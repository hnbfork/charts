/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : etcd-manage

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 26/08/2019 20:39:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for etcd_servers
-- ----------------------------
DROP TABLE IF EXISTS `etcd_servers`;
CREATE TABLE `etcd_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(3) NOT NULL DEFAULT 'v3' COMMENT 'etcd版本',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT 'etcd服务名字',
  `address` varchar(600) NOT NULL COMMENT 'etcd地址列表',
  `prefix` varchar(100) NOT NULL DEFAULT '' COMMENT 'key前缀，建议不为空，防止大量key',
  `tls_enable` varchar(5) NOT NULL DEFAULT 'true' COMMENT '是否启用tls连接',
  `cert_file` text NOT NULL COMMENT '证书',
  `key_file` text NOT NULL COMMENT '证书',
  `ca_file` text NOT NULL COMMENT '证书',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(60) NOT NULL DEFAULT '' COMMENT '密码',
  `desc` varchar(300) NOT NULL COMMENT '描述信息',
  `created_at` datetime DEFAULT NULL COMMENT '添加时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='etched server列表';

-- ----------------------------
-- Records of etcd_servers
-- ----------------------------
BEGIN;
INSERT INTO `etcd_servers` VALUES (1, 'v3', '默认未启用ssl', '192.168.5.246:2379', '', 'false', '', '', '', '', '', '本机测试', NULL, '2019-08-26 05:26:10');
INSERT INTO `etcd_servers` VALUES (3, 'v3', '集群ssl', '127.0.0.1:2379,127.0.0.1:12379,127.0.0.1:22379', '', 'true', 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUdGakNDQS82Z0F3SUJBZ0lVVlZYZHkwMUI0elVaWFl6bnBRbWxhWXNiVlBzd0RRWUpLb1pJaHZjTkFRRU4KQlFBd2J6RUxNQWtHQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFXcHBibWN4RURBT0JnTlZCQWNUQjBKbAphV3BwYm1jeERUQUxCZ05WQkFvVEJHVjBZMlF4RmpBVUJnTlZCQXNURFdWMFkyUWdVMlZqZFhKcGRIa3hGVEFUCkJnTlZCQU1UREdWMFkyUXRjbTl2ZEMxallUQWVGdzB4T1RBeE1EY3dPRE16TURCYUZ3MHlPVEF4TURRd09ETXoKTURCYU1HY3hDekFKQmdOVkJBWVRBa05PTVJBd0RnWURWUVFJRXdkQ1pXbHFhVzVuTVJBd0RnWURWUVFIRXdkQwpaV2xxYVc1bk1RMHdDd1lEVlFRS0V3UmxkR05rTVJZd0ZBWURWUVFMRXcxbGRHTmtJRk5sWTNWeWFYUjVNUTB3CkN3WURWUVFERXdSbGRHTmtNSUlDSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQWc4QU1JSUNDZ0tDQWdFQTE2aUYKL1ZsU1NGYXNsdkk0b3I0QVowUDB5M0RIemRkYmZ4dzRuVFNmWDhlOGRFb0JRSmtITjk0VXhYREJjRWttUWk2UQpFQnRhRk9QUmYvNHBST3J6bmxIVWpFN1V4VzlLVjdkQ1BuM2JmbmNUdXB2Nkd4UFRpcmEwbzBLaXdsSzJCbFJVCmlJOXhkYnFrK3dSTGthTXo3RTlHdUxoMUx2WlIveVBiekdUbC9vNk43dlBzZFVta0laR2sraW5zc25lS1BMZ0oKNnRoU0U2WVJqWHMzODZtV1pYaDdOdDRZY3B0MEQ0dnp1WHFVcHlVeE1uUkNITDZJU2tVTTJ6SXZEQlNJQllzbwpvMU5oWlRuWXd5V083eU91ZDEvMHJtSjRkcitaakhDZmkxdDZhTFk0U3lQendpT0RneFNrcVU4eFFzODhtVTZYCmdBNkdqUHR3QzZQT2xmNTZIQklFNFpibEhSd2pSZUg2bFdwQlhCZE1SUWRuTGVxbFRjVDZJNUxSVGxNS2xkaHMKOFpNYlhXeWZlM3dRQ3Z2WXNDR3A4NS9ERXV6NVhKVmVrV1JrOTBvd0tVeVZMcm1Fc1RNQTFWbFNhc0Fpbm1UZApVMW1EV0dKWS9nQm1XaXY2b3liNmVRdCs5VmlPb3J4SGN2QXdKc25sdHJQckFTR0hiZ2hORkxBdlQ2by9YVjRmCkp2T1VNcW5kMlRTL3J0Z1lLV3NabjV3SGhiMnFLU1RUUnhyOFBZb1Q3K2l5bFVHVDZPNmRDamg2dXBKMTdSL1IKS1ltQnl6ZTkwRmNmRzJ2QURiQWZ6YXg1WlJQNGhoSnN5OTlXL2p1aFIzT05obWRCeXoybFNQS3BlM285L2NtcQpuMnljNms4Z2loMVYyQTNjYlp3VnFYWFpqcksrL1g0ZGZEMEFzNTBDQXdFQUFhT0JzVENCcmpBT0JnTlZIUThCCkFmOEVCQU1DQmFBd0hRWURWUjBsQkJZd0ZBWUlLd1lCQlFVSEF3RUdDQ3NHQVFVRkJ3TUNNQXdHQTFVZEV3RUIKL3dRQ01BQXdIUVlEVlIwT0JCWUVGRU9EbHkvNEcrWjFlWnNSSGhsOGdzM25Fd08vTUI4R0ExVWRJd1FZTUJhQQpGRDNsS21XWHI0TUk1cnJrTFhBT2MycksxNXlTTUM4R0ExVWRFUVFvTUNhQ0NXeHZZMkZzYUc5emRJSUZaWFJqClpEQ0NCV1YwWTJReGdnVmxkR05rTW9jRWZ3QUFBVEFOQmdrcWhraUc5dzBCQVEwRkFBT0NBZ0VBdHMrK3JLU04KSllBQjU4ODl2d0UxUmhKa2dDdk1oVVZ4ZTE1S1k5d0IwWGJ2dFg5YkNoakFaMkVEU0VMaktyb1poaHpiRHkzbgozUGRvZFQyanVZYzFiUUxObEJMaHgybFNvR2tWM041U3E4ZjVQN3JYazhVTlQrUy9hNlUwQ0h4MUhyNUJDWU9kCllsZDN6eVVNQkNZM1VHZE5mOU5RZGsxMWJqZnJha2lkUTkwTHg4N2ZROHh3OFMweHNHR0hQaSt5YkcvYTd5RXMKK1FKR0UvdVp3SnJhQzVjMVhLMDJrdUlpa0p3dm1GbmF2bDJleEJMKzZFSFZ6RWRUUjNoOXVVYkdPWVRabktTVgpvMkkvc3dDSjVWdCtucHdCL3dOTmo1Q0hUMmlaQ3lVbXhGZUE0bFhGbnByMnkwWjBBQ1czQWNGUDBsTkw4VDRrCkpHVG0vR3M5YXZaM0FCYkdIdEtTM1lXVVlvelB1cW9CV1dsbDhKL1NralpjdFNEbnJoOW9LcFlGUVhmV0tGTkYKckZoVWRaUzZjZmw1Q2Iyb3MvdGsyazZoZE40UVNnQTh4TkVuMVIzQzAwUnEwRWRSY01zeHJ2bXp1cGl3RTdaRQo4SHVmQWpqSTlBbFJSR1V2Q3R4aE5UYllEWll6WXRmZmNIbTZVWGx4WXBaVGFMb3VJU1ptdkVVZ2c0Wkt4VlR2CkhOenJSTTI2cGc2TFVvOFhqMlFZV0lMS3o3d0M0OWF4OTZ0NzlVbFRVTDlOYnhjTGRsV2pYVWxtbitJY3E0Rm4KbUIyN0sxQ2tjc3U3N3h0WEFvYmlhYk9yR3dzN0NlRjBVWG4yck1Xc0xNUk5GRCtBZ0FLOGhaVzg1aUlDOG8wWgpMQVYrZnFHSTZ0UThMM2d3Rm95OVMxMWRJc1NNOWYxdnZqVT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=', 'LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlKS1FJQkFBS0NBZ0VBMTZpRi9WbFNTRmFzbHZJNG9yNEFaMFAweTNESHpkZGJmeHc0blRTZlg4ZThkRW9CClFKa0hOOTRVeFhEQmNFa21RaTZRRUJ0YUZPUFJmLzRwUk9yem5sSFVqRTdVeFc5S1Y3ZENQbjNiZm5jVHVwdjYKR3hQVGlyYTBvMEtpd2xLMkJsUlVpSTl4ZGJxayt3UkxrYU16N0U5R3VMaDFMdlpSL3lQYnpHVGwvbzZON3ZQcwpkVW1rSVpHaytpbnNzbmVLUExnSjZ0aFNFNllSalhzMzg2bVdaWGg3TnQ0WWNwdDBENHZ6dVhxVXB5VXhNblJDCkhMNklTa1VNMnpJdkRCU0lCWXNvbzFOaFpUbll3eVdPN3lPdWQxLzBybUo0ZHIrWmpIQ2ZpMXQ2YUxZNFN5UHoKd2lPRGd4U2txVTh4UXM4OG1VNlhnQTZHalB0d0M2UE9sZjU2SEJJRTRaYmxIUndqUmVINmxXcEJYQmRNUlFkbgpMZXFsVGNUNkk1TFJUbE1LbGRoczhaTWJYV3lmZTN3UUN2dllzQ0dwODUvREV1ejVYSlZla1dSazkwb3dLVXlWCkxybUVzVE1BMVZsU2FzQWlubVRkVTFtRFdHSlkvZ0JtV2l2Nm95YjZlUXQrOVZpT29yeEhjdkF3SnNubHRyUHIKQVNHSGJnaE5GTEF2VDZvL1hWNGZKdk9VTXFuZDJUUy9ydGdZS1dzWm41d0hoYjJxS1NUVFJ4cjhQWW9UNytpeQpsVUdUNk82ZENqaDZ1cEoxN1IvUktZbUJ5emU5MEZjZkcydkFEYkFmemF4NVpSUDRoaEpzeTk5Vy9qdWhSM09OCmhtZEJ5ejJsU1BLcGUzbzkvY21xbjJ5YzZrOGdpaDFWMkEzY2Jad1ZxWFhaanJLKy9YNGRmRDBBczUwQ0F3RUEKQVFLQ0FnQjdtS0h5S1JiM1RuVnJyVGE0VHB4OGtuM2hlcW1JVnp5aEJOT05oWE14dVk5UU5ubXhSQUxYQ2ZodApqOG5OU0o4Y253TUJ1Q3RRZmFDNzhqWkV3VU1PSVdmblllYWZvTURDdE16S2MrY3YrNTdhL0RuQyt3SHFKZnd3CjlTZkNweFNiWEFsMm1uODBNZHdMNE5KT2pYSmNwTEtyZTB2dHRrNFlJN3o4ejNiaEJXSmk2SGxFWHdncUZRYXcKT1FibTRZdmdjTGwrVnF2emh1SFliQjRORDh5YUt3cXl6MmJEaUVSa0JKbVNXNmFHaE5KRlVFdnpuVjhPOGJRRQpqQ1phamduRzQ1Sk95S0t4R1E0YUNaUjVpY0didU9yS1pyVVRtWXV1NlgwR3FVN21aRWl2QjlQVUYvWnZVWTF0ClcyMm9GSTF1YjVSMFY5N1ZQZVZoUm1oSG5xanNFQmhyRGwvZzArRXJIbzdCRFFwZVB6eFRwVXlkeTdKclIyRzMKRW9LUnMwSUhHaVQ2TDhCRElka1Byd0dYMnpxUU9ZYk14STVPaTR2SUMrY0hQYXlRSStSRHJ3T2FMMStYUnc2egprYUpnTHp6ZVRiNUk3bWFjaHJ1MGNVR1J4aFl1UjBvRWRrdmZ4SkFGd1M4cExMamZZenZsdE5qVTM1S282ajhSCkVsYWJCREdqTDFjRTIvTTFweWhXcmt6ZkU5bDZSMWNWbVVRNFVuSy9jdGNyaHdwMEpkWEF5VWpKQjN6S0puSzMKNmxHcG5relJjcUcwdDJHdlBCMUJvR3NvSytRc0p4UklIM3ZOOSt6dzZaT3Bxb2ZoOGcwWjZQcDdFaTR0T0xUSgpKbWdMYUlZUzlNZ01sRS9KbFdHWTI0VmdXenZQbmhUOC9sSmJtcUJqTVBuYnJWUFFBUUtDQVFFQTVHVVhtSWJMCm5rVHhxQXd0THRXZE5RcTBKdnB2K1JaUmVxR0FJZVp1YjByeFVLZ1AyZEJJS0o5MC9VOHBmK2Rxd05kZm53Q1AKMElKem1kQnA1ckpxb2JBZFArMlpmTkZiUjI4bC9LQjI3L0hmNFFoeG5DbXNBTUgyc25XeWxSWWxXRVlUcExjRwpPWVlBR3I3aW5CWnhCT2djaUczME1SVEJnNEVjdkxDZkRoY3BJRkJZRU1Xb0p5cGNyQ25FQnNiVENiMGxLZjlYCmVKQ2liWWE1a08xQmVaYnJWMEMwbUNGaGhhSS9wekhKQXd6U3pUamxobEF6N0czTStZN3gvZ05ZT0QwVldiNWoKejdIeUZhSUFBNjQ2Uzh6YjhNdVlIcXZLaC9iRXUrQkFib09zWldlejRSK3JaU0E0cFZ3OHNPWUdDb2NPNGFHSApDMUdwcGl1bFNFNG5IUUtDQVFFQThibFhIWW1RSGRXY2xaT3RyQ2hVT0VmZkRsVitKVnRiTlVQZjRiaUVycXRYCnlLQ1hwU2dPd3p4RUtlYnlvSU5TcDVxbFg3a3F4Q3UvcDIyR3QwNDhnSEt3NmZzYjEzenRndzVzUFBtV1dETFYKUEF0QTJ4SHpuRUlxRHV2ajVjckhweXZXVXFpWVFoaHVtdGtIT1RTQ1JOVDVVQlhnSGJVeFFaN29TdWNFTGUyWAp2ckZINmVVTXBmQk1PNUlRVTZHYzBveFJqR2tDSE9TZmZMOVhhRFlxeXBLc2tkRFlwUXV1ZTdRVkJBMDE3NmptCmF1UlZnZ2hGQjRHSnljUExSTUlwUW5KMHkxREFQd1YzM0xNY0lmekNjNUpBdUl0OGRMQmx3UkJnemdpRjZBREwKNUc2SUhUVXRObDdnNUZTVm9qeWRYM2gvOHB1aXpTSEU2OTNuNjBTV2dRS0NBUUJuZWRXaTZROC9lWVR5MmZGdQprcUZTOHJLRUpscXN3NHZPdjNUSjV4aUptNjZSR0ZOMkg0TlJ4RXpBcHlqcUpmS2J3L2d5bFpLU3FVZXVuRm9lCmh4OEFla1lHUEtPWmhWQ1JvSzNaTXVvdjg2bTJ6cGlLWStibHdQc0FCNHNOT0tkYXd3VUxUMUNtcHl0TThzYkEKYVBwemVxWFN1ZDQwam03T0lhVGZhRFhuc0Y2Vm9WRUU2RWd5MW1KK0xiMytRLzVCSDB6REpraCsreWhiN3ZvTAp5eklxNEZGbmlvMUhqM2diajFLL2NUTGRDdVpHekV4UStlMU1aTUxGSGhwTk56NjAzQmZjUFFJRGkxOWVwYkxUCitBKzVYK3NWd1dmK0hWNzVFcmczVm5aYW01VnpxL1EzUHAzc2h4aWk4cE1jb2xxQ1VvWlBlMXN2cWFQdkFUODAKN3hPUkFvSUJBUUNyRGhZNHY4VXRaNkdFTTlvOXJ0aFNiNEhJV2ZXSHFBdDJPUTd3WTZ2NUV5VnV3ejRzMEprSgp6ZGNLcy9UVVk3b1ZBeG11RUpIVCtvV0lqTGc5ZFc3WkV0Qmc4Nkx6TGVQQnoyNEhCRFJCTzgrcnl1YmRYK205CmxSREFPR3V3akh3V3I2M2VGcEtRaTB1UjVxejI3VktXTlFRc2lSNXN4M0VRMTh2WVhYeVdwOEN2WURMY3NJcnYKem9tVHlqd2xnb05BZDYycHFCR25zcDJ1SUpWUkdLdlZhRkFZYStzemVIM0Q2bDdJM0RSajRXa1ZFWG4xSjdiNQpwZENFNkRvcThSOVRkejF4Tnpha0lsRjg2MzZvQ243c1cvM1MybHA3Rk8wYzMyTXh5ZFJBcG5laXNoaytXZ2doCnBxaU15OUtMMlVzZ2FWeFpxWXRla0Z3UzhaaVI0NXFCQW9JQkFRRGgyb0dHUzRUYUowZnZDSzJVb1JBN2hJSTQKY1M5K0NlVStJOUpFdEdhVVUySXYwUGE1bWMrZ0FqcE52SnUrcld1R1p6NTZPR0EzbGhPZ3kySXo4Wk1seFZMegp3QzlteDNqbStpeXJwUW1rR1RLZ2lhcUdwbXdWem9IWUVoQkJlVVcvb3c0U3NzYVY4NEQyeDRRd0RSMXJmbWZyCnBid2RkUGE1RVVYY1VlOTdEWXRZOWg5dE05SGJVcHVKd0JOR283UXhxQnJLZlJ4QmV4RXp2WGJXUVJNQmZvMnQKQnJTM1d5WmthclBCMEFHQWVLSXYxNUJYd3pCLzEvTFg0TmMranM5cjlIcHd2ZlVKNVBuQm4wbnFFZnpCNTBNZwp0cDhOb1FUUUd4WlAyclp2Y0Q1b21lNkRlTnJZUHZHRmYvRU1KRXlDSzVoRy80V1FDMm40UFRGTjFDb1YKLS0tLS1FTkQgUlNBIFBSSVZBVEUgS0VZLS0tLS0K', 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUZyakNDQTVhZ0F3SUJBZ0lVR1J5QkZXU2IvWFVRZy9sNHd5djIzUnJPTHlvd0RRWUpLb1pJaHZjTkFRRU4KQlFBd2J6RUxNQWtHQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFXcHBibWN4RURBT0JnTlZCQWNUQjBKbAphV3BwYm1jeERUQUxCZ05WQkFvVEJHVjBZMlF4RmpBVUJnTlZCQXNURFdWMFkyUWdVMlZqZFhKcGRIa3hGVEFUCkJnTlZCQU1UREdWMFkyUXRjbTl2ZEMxallUQWVGdzB4T1RBeE1EY3dPRE14TURCYUZ3MHlOREF4TURZd09ETXgKTURCYU1HOHhDekFKQmdOVkJBWVRBa05PTVJBd0RnWURWUVFJRXdkQ1pXbHFhVzVuTVJBd0RnWURWUVFIRXdkQwpaV2xxYVc1bk1RMHdDd1lEVlFRS0V3UmxkR05rTVJZd0ZBWURWUVFMRXcxbGRHTmtJRk5sWTNWeWFYUjVNUlV3CkV3WURWUVFERXd4bGRHTmtMWEp2YjNRdFkyRXdnZ0lpTUEwR0NTcUdTSWIzRFFFQkFRVUFBNElDRHdBd2dnSUsKQW9JQ0FRRDVGRllEa1hSaXhDYlFIN1Y3bUZlUmhxL05qdlNUeWJTOHB2MTdSOVRuVGFmWWtXckJtbmZuak82UQpXL2c2S1UzQXVXZWRHN1dKUVp2U2Q4d3JVVm1SMkdRcWRxS1psRDFobVNYd2YwQnhqYjcrYVpHeUlzb1RkUnMyCjNEZWx3SXhXS25SeEIzZzJXTDhjMzZUZFQvRngvbE9EZDBrNVF4TXpVUTRiZnd1cTBhZUpIL3l6c1FSbTExNEUKei9tRW9wd3NQU0xsU09LOVVYUkNxZXNQVGlndzlROUljN29ZM3J3ZVBKNGZJL3pHK0ZiQUFJditLT0FMUGlDaQpUbmVIOTA4N2xZMW1zVHBGeWV3Y3pRYVVBaHdwVkVFVlRNTE5ieTFHcldmeWVUZTJmSFRLVys0aVA1NkJ2L1BvClZiS1cwMTdTTzRVQ1lKeS9zQVJYUXI0VEtIejhjWmwxZmR6bmppeTNwS3htUVlSY2s4c1o0L1BHajYxM3FsMFkKbWhyUHVFV0hTd1NvTDJNQjQvamh5Vi9vdStodzhxMVRGQ3Rld1NEN3UxSHIxQUg3eEVFMEZJUENDc0hBTjFyOQpMUnpMcGY0ZXNaRUVJK2x5ODNUWmUxZzI3Vlg4aStTd3JSSllFdFlmN3hqc0VTbnBYRXRDTmRPMTd2RmZKZ2MyCktYbkZIOVV5Z3JMUlA4UmhnZ2lURWxpdlQ4OXpwRDB0RkVGODlESUhNM2Urbm53MjlzTW9pZEFzOXRsUkY5Y08KWW9RcEV5WXR3R2RBZWJBR1hYWGZhTytoU3V5UWVrcGZXbGhLaEFTSXlYdzk4LzE2OUVJbS9aejhTODdxOG94UQp5QVRoS0NlZU1GZ3Y4aDRYaTJkekp6ZndKQlo0blhwbm9zODRWNDJCOWpjd25Sc2RJUUlEQVFBQm8wSXdRREFPCkJnTlZIUThCQWY4RUJBTUNBUVl3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFkQmdOVkhRNEVGZ1FVUGVVcVpaZXYKZ3dqbXV1UXRjQTV6YXNyWG5KSXdEUVlKS29aSWh2Y05BUUVOQlFBRGdnSUJBRHlJdlFIVkRGbkFmUU1JSzRZSwpvRm1sSVgwdXp3OUIyaFBUZzlkbW9QSFNvaFArcVcxV3FwNmZ1SGRhdlh6R0NMMUdDYkxOQ1daaGc2N0NPV1VlCkxQWXpuRTBIRThxRERwc1hSZVpsaSt1MTJlNUxFWmZXUlcvVStkT3pCNFkyMXU3NUdxclVEY2RzVm1GUmwzaXQKdHl1OFlJVk1IWXJNMjhadHBKMmFKc1JWVnZDR0MzV09CQXBaMmF5QlJyNEtTUlhmcnQwQmlzVk1MRmtEa2xTawoxUDNGZGF3bkNySXZDeEs1QU9KaFRicytpU2pUT0sxT3ZZVUd2ZmtKU3B1dnlJR2NKc3NsN08xdS83cVRnL0N4CjdFTVRTM1R5bXJ5bmRMUnZNQ0pMUVRQelZmbnlpaHJmQWVxRW1MUElMenhnZlVKcFR2QWsxUWNYdnp5MlJRankKK0hJSXhvK0xyK3dqR1N4VUxENmtNbU01bWNMSk9BT2xIVGFQc3hhYkdBdFZVTlJ2cjE4QlpoTm95b2IwbFVVZwora2hyUnpQRzd1UnFiQ1dhM2xDRlVlMmJSRDN3ZmlJakJUZ1ppQ0ExWDBHQTg3ZXBDY3lGanFpQkNnb3lIQ3B5CmxhaElMK1JGckRoNlB1a1Y3S3hvR2xSWjdjQU9aR2dCVFZsS2Zxb1NPdmw0cTMxOW5Qa1RqRW1pckkyY3A0cWgKckpqdi9tQ2hKR0l3ZVBlRXdGdzFjb0ZXcjJwSWRsTW5obmR4YnAwQ25ibUZ5ZWpLMzFFU3BkQ2pLYy9VbDVNVwpDaE1xazRZKzh0V0pDTFVTN2dtTkNCU21Qa2xYZlkwSDZCL1JhTWZwc3EzMXh0NFNtSnRBREh5eHREWHVYdk1LClR2OXFxTytGVW16Vks0TVBKRzRVU0FSOQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==', '', '', '备注一下\n999999', NULL, '2019-08-24 16:24:07');
COMMIT;

-- ----------------------------
-- Table structure for role_etcd_servers
-- ----------------------------
DROP TABLE IF EXISTS `role_etcd_servers`;
CREATE TABLE `role_etcd_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etcd_server_id` int(11) NOT NULL DEFAULT '0' COMMENT 'etcd服务id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0读 1写 -1无任何权限',
  `created_at` datetime NOT NULL COMMENT '添加时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_etcd_server_id` (`etcd_server_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限表';

-- ----------------------------
-- Records of role_etcd_servers
-- ----------------------------
BEGIN;
INSERT INTO `role_etcd_servers` VALUES (15, 1, 1, 1, '2019-08-21 12:48:19', '2019-08-21 12:48:19');
INSERT INTO `role_etcd_servers` VALUES (16, 1, 2, 1, '2019-08-21 12:48:19', '2019-08-21 12:48:19');
INSERT INTO `role_etcd_servers` VALUES (17, 1, 3, 1, '2019-08-21 12:48:19', '2019-08-21 12:48:19');
INSERT INTO `role_etcd_servers` VALUES (18, 3, 1, 1, '2019-08-23 11:42:50', '2019-08-23 11:42:50');
INSERT INTO `role_etcd_servers` VALUES (19, 3, 2, -1, '2019-08-23 11:42:50', '2019-08-23 11:42:50');
INSERT INTO `role_etcd_servers` VALUES (20, 3, 3, -1, '2019-08-23 11:42:50', '2019-08-23 11:42:50');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '角色名',
  `created_at` datetime NOT NULL COMMENT '添加时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, '高级管理员', '2019-08-14 19:43:44', '2019-08-14 19:43:48');
INSERT INTO `roles` VALUES (2, '开发只读', '2019-08-18 04:14:42', '2019-08-18 04:32:02');
INSERT INTO `roles` VALUES (3, '开发管理', '2019-08-18 04:25:05', '2019-08-18 04:32:21');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(300) NOT NULL DEFAULT '' COMMENT '邮箱',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `created_at` datetime NOT NULL COMMENT '添加时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'admin', '94d9484ada1e5639810258b515fa61f1', '', 1, '2019-08-12 20:19:15', '2019-08-14 11:43:56');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
