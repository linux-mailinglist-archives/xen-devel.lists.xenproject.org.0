Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B074F96B7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 15:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301597.514789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncojB-0001jy-F2; Fri, 08 Apr 2022 13:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301597.514789; Fri, 08 Apr 2022 13:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncojB-0001gS-B5; Fri, 08 Apr 2022 13:32:41 +0000
Received: by outflank-mailman (input) for mailman id 301597;
 Fri, 08 Apr 2022 13:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3bc=US=citrix.com=prvs=090ff2996=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncoj9-0001gM-7Y
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 13:32:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a09c2bb-b740-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 15:32:37 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5a09c2bb-b740-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649424757;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=WGJ4CgXNLi1TAOJBwy//92r7OiD6bYyBigPIi1XfE2c=;
  b=ZNhCePHCMttnzcFINn5N1L/q4HEHc3C4zUEAKWkuWw8n/UFuWQa7cdhL
   dp2cg7qBGFfveJ8x14HMGKegGzZsjaTS/a2jMSVRBRR3hf9eYriMZzCAd
   o4gOBiUpifl0lB/PStUgaOnbiTHNb1C31mIwOt4dHQ+a1YUe+8s4AWCU7
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70771134
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pg6FVKjruX5gnEX7lml3iI8CX161GxAKZh0ujC45NGQN5FlHY01je
 htvWDuHPffcY2Pzc9Byb4Wzph4PvsXVyoQ2GlRuqXoxFykb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vd4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YT4wF7fWvcNGajwGKysvAq8Z9pDbCGfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNamGO
 JVAMGEzBPjGSwxmIGZOOsMgp+CpiGfOdXp7lUOql4NitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrlH/EzVPCwH9+6PgzBfjBZQPc
 CT45xbCs4AL7WWxVPzaBCSd/kaO7yEeBNR/D8QlvVTlJrXv3y6VAW0NTzhkYdMgtdMrSTFC6
 mJlj+8FFhQ07uTLFCv1GqO86GrrZHNLdTNqiTosF1Nt3jX1nG0kYvsjpP5HGbX9sND6ECqYL
 9ui/Hln3OV7YSLmOsyGEbH7b9CE+8Chou0dvFy/soeZAuVRPtPNi2uAswWz0Bq4BNzFJmRtR
 VBd8yRk0MgADIuWiAuGS/gXEbei6p6taWOA0AQ/QsRxqGv0ohZPmLy8BhkkeS+F1e5eJ1fUj
 LL741sNtPe/wlP0BUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStKWMxPkWvtL89AgOBD+8zL7T6KLXwN50/8iuT2ib/8YeptDWZimchltPjU/1iPq
 4832gnj40w3bdASqxL/qOY7BVsLMWI6FdbxrclWffSEOQ1oBCcqDPq5/F/rU9wNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:Lh+EcKuKnjm1PQyHO6Pa4XwZ7skCgIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/hqAV7CZnichILMFu9fBOTZslvd8kHFh4xgPM
 RbAtdD4b/LfCFHZK/BiWHSebZQo+VvmJrY+ds2pE0dKj2CBZsQijuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 929lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQlo+a87bW3HAb0cYa
 dT5Jm23ocWTbraVQGTgoBX+q3hYpxpdS32AnTruaSuokprdT5CvgglLfck7wY9HaIGOud5Dt
 v/Q9RVfcl1P7crhIJGdZM8qJiMexvwqSylChPgHb2gLtBEB07w
X-IronPort-AV: E=Sophos;i="5.90,245,1643691600"; 
   d="scan'208";a="70771134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ih2orIlwBhK9/4YXOWTFIJ5ce/RAA/lL7hr51Zad0SmHTrtSi+0cFVQxHZ7v40e37YlzJxxPW1qt1gtNrOlWQinZFXhcL6XUW0gKk3KQeG8CStZrCUTWBNMC3zEn8WbmcvBob95S8qswQ0nZPh9P5zgcQGXSyHfGxc59qhEZztV8E51AO/4D1tcvNiVswtM2RrZ2aB4hOv01C5LFqX2mTtLpuZHEv7K8v0pVEm7oAmRkYABEPm29Qf8XP8I3HOGUuyyuJ3MZ/VKVaQMoqM1D1+RXYq5p2lQe+hXgoXQsNdjk1MNWaEXcoRtzRQQu2+lw6+2wHucyhgTz2LgKaN+7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mycfYRjCuGQviAUZ42UDfke1LB0gXnoRC/rpO3Rwhhs=;
 b=nzB3cKjTwFd6oX1BVSYqsgqsdhbFvaz8BeDsgMz0D30lGtFrYEVnfWxEr8MpKd0RcRohcID1ImCtXUC43l2LKe0ST0VkX2HC8OtAgCEtFTnmU4X2JZZHca1mx8beqae+miZ9Kjp4z81CaAj03RwsdmsMhTkqHmJOETTE7qdVdOeeGw9BRwKtMsqmuqcfm7MzKZOZp2YW1T83zr99wRq4WnuGpwCH+1c9Yf/gYhqxT+n10VzsfDB31soNTUt+QGLyfiBdgUtoDuSMOBW9s8lhyBrTEhhRQx4jRz4cCcAR1oU+zVybw528wciZ10S02356NO+ePqvr4hzTHnSh+9L6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mycfYRjCuGQviAUZ42UDfke1LB0gXnoRC/rpO3Rwhhs=;
 b=TbKYu2ZMPBiEKScCJ9VFaumv1K3DYjdMRyWLoCKkVJkwchCdG6p5jpyFs7WJYAI1WLKnRHWMMaKdHm36T4pIuh4TRWjtEcecKBhsyH/2k9dyiCOErs1TZZCFHNwfBl8J5yXLy/zC3O4Jf1yA06VmCxnnBd4OWA3UDqF8b10ear8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xl: fix vif and vcpupin parse tests
Date: Fri,  8 Apr 2022 15:31:46 +0200
Message-ID: <20220408133146.48117-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09fb0442-1224-43be-44b4-08da19642f5f
X-MS-TrafficTypeDiagnostic: MN2PR03MB5247:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB5247168DE2E5CF28BF5153108FE99@MN2PR03MB5247.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4gSdwEllLQmPUZML5UgTFuz+KrS/62nHSFTFVjJsxI4ZF76oupXkfX7Cec9zoMrQxavJWSXwjFM1UZQSNwkmXSvJNYo1CwPWEJibXAj50XOThFs/FISplkVoit4LrULc6X5WvCInHg/3MCeIAJlSNmTLCH/hA2Ir8JiiD0G9MVvf+ColNEGPexoT85Ft3ELz+iAGOXNt5UvgaU0xrhb6v+2eMGgk+2yOwfs2e2iC2ZT/z7hTHKccdGvk8Wq2rvgSt9cGWvsOG5ToMqDxyAOVAjoTe5xwQroB+1FUyLIb+PK+xSFJIrHCzTazA9gx5r0mcV4UFM5usLW8xawqg+kxz/nBLrB1ZTqPExrhiJfQj55bav5U52UOCnK+QUVsu3zjrFmZER/+kWaGW8q7VXj++4EPqgwgHqwIJ9qjmo49X3//I38dUbXHo+Vje5xhOUWYyWfKaCyiYkZXhCAP4bh2CcHEXP8VqQkPjVHbOVMezRuBdnBTo+PZfjmzV9U9plvcq8xh64LL1/Ly+Hw1/ItftsHxFfpMN4cW7H0qIO6oAjPrHRVRjlgOpjIWjsYNDGq4z6EJp303taaqVMzXhlAshtqQDhNvK3ZEOguJds3Hjk0gfRMlUtyirE7qJ57SEc/vU68QyFjWvYo9i1PwW1IHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(6512007)(54906003)(38100700002)(8676002)(66476007)(66556008)(6916009)(2616005)(66946007)(5660300002)(6506007)(86362001)(186003)(82960400001)(83380400001)(6666004)(508600001)(6486002)(8936002)(2906002)(36756003)(1076003)(107886003)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3EvdW5hNGFWd3JxSGhRVXZ5NW01MGRFSFgvd1hMSitDVzkzY2YvWmY2U1Qx?=
 =?utf-8?B?MUM5K3QyME84SllCcW8veCtha1R5RjRpWk9PYXFmWGJObFpKSlZBSTZSeitM?=
 =?utf-8?B?YmVUWlBTdVZrTlZXZEtnZDNpaThBZ0xoNk9Hc0NHQmYyd3JkMVY5emJLT2ts?=
 =?utf-8?B?cllmSG5yYVNkU08rdjFFUHJiSXFJZ1RjT0lwM3ZJK3hDWTZoYWN0cjk4VU5q?=
 =?utf-8?B?ZmNzM3JXYmgrclhMRW1zWEd4d2N0WCtZeHRIVm9NR0V3NmpNZWoyVm5WZ3A4?=
 =?utf-8?B?clgvQkRwMDkzUnRTSmVxZ1M4QS9DWllsTEFIVlNtVk43RXZxMzczL3JYbUpD?=
 =?utf-8?B?Vk9WR2I4SGZFUlJOQkpGaE1WK05URXhsVjY3cXFPRFRHcTFrb01Ndmo3ZFVB?=
 =?utf-8?B?Q29NYkVTelNFZVdmTzdtbXlNbE5WUkJZR1ptUFdqZDdxN3BCSnF2OXZWWFB5?=
 =?utf-8?B?NTRWWnZqTm1IaDBmQTJqb2x1eERrVHU3aW8zZGRNSG5QRWd5T3BiZmFlTDlK?=
 =?utf-8?B?Q0tLZEpVNERNSnNGbGJ2YWlwc1MxRkFZVk9VcEVXUm16eW53b2x6UFhYYTBD?=
 =?utf-8?B?RG5IcFRhMUxCZEphT0wvcHFYYlErWUFZRldWRUFENjhKM3grQUg2ZWluMHVD?=
 =?utf-8?B?QkhlSnQ1cnRwV2twSkkxR1g4S3FySmJPOFVtNjBxRlpRNk8zd2NvOWY5cURa?=
 =?utf-8?B?ek5xci8zWENJc2lJeVhYVmdXcUpjSFB4QzltYnozbUl2c1Fic2RIRXE0eS94?=
 =?utf-8?B?enI0L2o0ZmRSdkNqaHpXd0h0VXpvOTdsdXRhRWNxKzdrUUMxZk9IV1krcXNs?=
 =?utf-8?B?eCtHTG1RNU9xS2dNN3VXTGZ5djEvVmxibzRBeHdTcnhZUERGNExPZGdvaHM2?=
 =?utf-8?B?aFIvMXY3TFErWU1TTkhva1lkSHlkVGhIVERBcmJELzdGaXljbVhsYkRjb1Zm?=
 =?utf-8?B?V3YzUHZQT0piR0lheU82RWtHdTZtcnlOWFB1cUtkdjVVbjZNVnlEMVptRGNE?=
 =?utf-8?B?R1FET05qRnVNSmZTbEY3S3NUd0hIK201b2pHV3lJeUN2eHQ4cWZDMUhDalFn?=
 =?utf-8?B?d004T3cyWG9WVmRGTFE3b1BtV1RUcTVESzN3RUhOK3llYUE0YUxCWkpCZ0wr?=
 =?utf-8?B?b2Ywby9FOGd2bHc0Ry9tbWJSbW96bDlMM053Rml0b3V3czJHVXhzbS9RbVpz?=
 =?utf-8?B?b29WZUZ1a2hKMXZBOWxUNllFTTRKdU5GTjlDZVdIMWVsTFNCbWR0Sk15c1Y2?=
 =?utf-8?B?Y0ZXZnhWS1Z2QWtnSm5sb3RHVlFhYWgxL01OSTFuanVUNlZGQitubm5raTVz?=
 =?utf-8?B?eko3QU41cXFQdlJXbG5ob2g5VjdYbmQ1aFdaV25KRGJSL2JVbWhrUEh5aXl6?=
 =?utf-8?B?RkF6SDh2ZHdCbWcrTldzL3pSRHJrVVppbFlXUVpaaEN4SHRyekxCVWlUNkMr?=
 =?utf-8?B?UXR1eXZ3bmk2Z0xMb0JKZ251cDNMbGN2QkRxSWhiREFXN1RKbXdYZEF6TlZz?=
 =?utf-8?B?Qk5CODZ2TFU1aTcwTFFtYXBWWkt1dk01aG9LbkY3MytldzcraTIwSzhGT1Rh?=
 =?utf-8?B?R29BeXgvcVZJRFpkM0NEOHhTVUcreEcvSm10V1JoNWd1YWY3NkY0N0JRcG1O?=
 =?utf-8?B?MGZmZVZmZGJ2c0c4SVNxTHpvT3MwM2pVWnRoVlp1SXR4THYzTkJBWkVKTUJu?=
 =?utf-8?B?YVBvU2hwOTh4UU9GbUNHMFRiNFZFWXZHWmxyUEQ3Vm0vck81TVNFU1grclM4?=
 =?utf-8?B?Nm1URy90R2taakJiQ2hPU3N0R0RCQkxHbmhHRGxiUisxWkxFTEJNanhVZ1pu?=
 =?utf-8?B?bGJqUFpBY0ROWFBVelZQZ0JzdEF6WTEzZG5FdU9wTWQ5T05SZ2M0c3lSc2lG?=
 =?utf-8?B?YWNha3ppQVpxMDJ5b1VqWjFab1pzRUJKd3l3b28rTEhkZlJuWTcwMnVXd3kw?=
 =?utf-8?B?UktBODlLNmF6SnF6Rkg0cFhpYklySndkZUxvaTUxalBxY0o3SCtwdjVNN2ZV?=
 =?utf-8?B?Ti81ZEFhTkl3K3NWZHd6L3FPQ3pBT29STWg5WkJJeXRUYnhJNy9tcThGSkxG?=
 =?utf-8?B?Ym5vOXd6MjQ1cDBwcUI2RzV0K0dhdS9wOVZ3Z1lEbVJ1eCs4WnByZmVGOVBQ?=
 =?utf-8?B?T3hOclpQeE4yRmNldklxUU03NENTR0diSUgyQXFWTTVCRUFjd0RGNTZzYU5n?=
 =?utf-8?B?OXBKM2dEV0VtbUFaN0xjMTByb01iZHloWkxGdE04aXJMNzdiOWJPdm50UDdv?=
 =?utf-8?B?emoxdm1hWjU3T2QzQ3cyYXo1UFgreXlmQlIrRUxRbXVDMTVpNWdISWIrdnky?=
 =?utf-8?B?N05rVXo3QllIZWlwcnRNMzVHUnFJVnd2TXVjQXpYaytOTWlEWWhydz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fb0442-1224-43be-44b4-08da19642f5f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 13:32:11.0730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGQ3ZiXe/EAqYmM1bRwZj/QVA7aD1EmZEHVVw6wPdi+DurS4k+dbDrcswW+biLIdUCtregAzlZCGYaBGsLZgAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5247
X-OriginatorOrg: citrix.com

Current vif and vcpupin parse tests are out of sync.  First of all, xl
returns 1 on failure, so replace the expected error code.

Secondly fix the expected output from some vif tests, as xl will no
longer print the unpopulated fields.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
We should find a way for those tests to be run as part of osstest, or
else they will go stale again sooner or later.
---
 tools/xl/check-xl-vcpupin-parse |  2 +-
 tools/xl/check-xl-vif-parse     | 52 +--------------------------------
 2 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/tools/xl/check-xl-vcpupin-parse b/tools/xl/check-xl-vcpupin-parse
index 21f8421ad0..633616a597 100755
--- a/tools/xl/check-xl-vcpupin-parse
+++ b/tools/xl/check-xl-vcpupin-parse
@@ -158,7 +158,7 @@ END
 RANDOM=$seed
 
 echo "# Testing a wrong configuration" >> $outfile
-write foo 255 ""
+write foo 1 ""
 
 echo "# Testing the 'all' syntax" >> $outfile
 write "all" 0 "cpumap: all"
diff --git a/tools/xl/check-xl-vif-parse b/tools/xl/check-xl-vif-parse
index 02c6dbaeb6..04bd9463d8 100755
--- a/tools/xl/check-xl-vif-parse
+++ b/tools/xl/check-xl-vif-parse
@@ -40,7 +40,7 @@ complete () {
     fi
 }
 
-e=255
+e=1
 
 
 #---------- test data ----------
@@ -62,16 +62,6 @@ one $e rate=10ZB/m
 # test b/s and B/s rate units
 expected <<END
 vif: {
-    "backend_domid": 0,
-    "devid": 0,
-    "mtu": 0,
-    "model": null,
-    "mac": "00:00:00:00:00:00",
-    "ip": null,
-    "bridge": null,
-    "ifname": null,
-    "script": null,
-    "nictype": null,
     "rate_bytes_per_interval": 100000,
     "rate_interval_usecs": 50000
 }
@@ -86,16 +76,6 @@ one 0 rate=2000000B/s@50ms
 # test Kb/s and KB/s rate units
 expected <<END
 vif: {
-    "backend_domid": 0,
-    "devid": 0,
-    "mtu": 0,
-    "model": null,
-    "mac": "00:00:00:00:00:00",
-    "ip": null,
-    "bridge": null,
-    "ifname": null,
-    "script": null,
-    "nictype": null,
     "rate_bytes_per_interval": 100,
     "rate_interval_usecs": 50000
 }
@@ -109,16 +89,6 @@ one 0 rate=2KB/s@50ms
 # test Mb/s and MB/s rate units
 expected <<END
 vif: {
-    "backend_domid": 0,
-    "devid": 0,
-    "mtu": 0,
-    "model": null,
-    "mac": "00:00:00:00:00:00",
-    "ip": null,
-    "bridge": null,
-    "ifname": null,
-    "script": null,
-    "nictype": null,
     "rate_bytes_per_interval": 100000,
     "rate_interval_usecs": 50000
 }
@@ -132,16 +102,6 @@ one 0 rate=2MB/s@50ms
 # test Gb/s and GB/s rate units
 expected <<END
 vif: {
-    "backend_domid": 0,
-    "devid": 0,
-    "mtu": 0,
-    "model": null,
-    "mac": "00:00:00:00:00:00",
-    "ip": null,
-    "bridge": null,
-    "ifname": null,
-    "script": null,
-    "nictype": null,
     "rate_bytes_per_interval": 50000000,
     "rate_interval_usecs": 50000
 }
@@ -173,16 +133,6 @@ one $e rate=10MB/s@10h
 # test replenishment interval in seconds
 expected <<END
 vif: {
-    "backend_domid": 0,
-    "devid": 0,
-    "mtu": 0,
-    "model": null,
-    "mac": "00:00:00:00:00:00",
-    "ip": null,
-    "bridge": null,
-    "ifname": null,
-    "script": null,
-    "nictype": null,
     "rate_bytes_per_interval": 10000000,
     "rate_interval_usecs": 1000000
 }
-- 
2.35.1


