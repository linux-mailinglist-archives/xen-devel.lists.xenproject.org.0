Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EFE5EDE81
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 16:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413354.656958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXmh-0000kf-CW; Wed, 28 Sep 2022 14:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413354.656958; Wed, 28 Sep 2022 14:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXmh-0000hY-92; Wed, 28 Sep 2022 14:11:35 +0000
Received: by outflank-mailman (input) for mailman id 413354;
 Wed, 28 Sep 2022 14:11:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG3S=Z7=citrix.com=prvs=2639d358c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odXmf-0000S9-4V
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 14:11:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7202ac3b-3f37-11ed-964a-05401a9f4f97;
 Wed, 28 Sep 2022 16:11:30 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2022 10:11:27 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5596.namprd03.prod.outlook.com (2603:10b6:806:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Wed, 28 Sep
 2022 14:11:25 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 14:11:24 +0000
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
X-Inumbo-ID: 7202ac3b-3f37-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664374290;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=C/LWDynDNbuV9hcSSLexUl59+J9xjAwk6AToRd30lSE=;
  b=D7sLQphD6eKLheJqADumBHAHDw2DOjATSbYVfNuzPHqlu5L4G4lXyrAm
   JANCbt1+X2gkImhmUevvSxY8XTBT9VQbuavsvBpaE6g3qtRaiJJd7WQXH
   vhV3iAqcR0gpSCVmLmHeUEwUvle97ztn16tk98iMC58I2YuxdKGGXwdJF
   M=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 81960672
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MrWom6IAc5egAvJuFE+RfpQlxSXFcZb7ZxGr2PjKsXjdYENSgzxUm
 msYWmmGPq6KMDH1KYhyYYqyoB8HucDWmIVrTQNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4mNA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYEJx7paK3kNy
 eEddyoTcUG+neK164vuH4GAhux7RCXqFKU2nyg6iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QPT/PRni4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWPUrCry2bWncSXTcocVFLq8/69T23qc42FPKQU3EhyJmKzs4qK5c5cFQ
 6AOwQI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yx2CGmEOQzpFadonnMw7Xzon0
 hmOhdyBLT5ytLyYT1qN+7HSqim9UQAfIHUefyYCQU0A6sP6vYAophvVS5BoF6vdpuPyHTb80
 jWbth8Ujr8YjdMI/6ij9FWBiDWpzrDLRAMo4gTcXkq+8xh0IoWiYuSA9lzz/ftGaoGDQTGpv
 mUC3c6X7+kMDJSEvC2LXOgJWrqu4p6tMzDCgFgpA5go8Rys/WKuecZb5zQWGatyGsMNeDusb
 EqNvwpUvcVXJCHzM/8xZJ+tAcM3y6SmDc7iSv3fcttJZN52aROD+yZtI0WX2ggBjXQRrE32A
 r/DGe7EMJrQIf4PIOaeLwvF7YIW+w==
IronPort-HdrOrdr: A9a23:e40Q1K5/3nSw12FOcwPXwS6BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfTpyVSZNNXh7LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGg9HQjprpbTMPGhZisWC1/HqVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHml/2g0BfT20La8pwTstr8zdloAtCKl6EuW0PRozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBDGnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZxB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3MYiFXtuYdg99R/Bmc4a+L
 EENrCc2B8WSyLQU5nhhBgi/DT2NU5DXitvQSA5y7+oOnZt7TNEJnAjtbIid0c7he4AoqZ/lp
 v529xT5ddzp+8tHNdA7bQ6ML+KI12IZy7wG0SvBnmiPJ07Ghv22u7KCfMOlamXRKA=
X-IronPort-AV: E=Sophos;i="5.93,352,1654574400"; 
   d="scan'208";a="81960672"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+KAXb7pLNjekIxqJMEimSVeLcXdwY76dxBwYvjDnVbpBg9A8mSLDuatHRtbK+EIAISk8/GF6a4hEP738de0AQmJEp3Kb0rkZrAPA9dvwBPIgxvJ/NgpYh6d2MGeb8pp3OkhWO+6EBHVtHqrzvS7jowrHivLgSQRAaEXxy7mX3JhOLb+C2bfyZ769xvOymomgtgcHViBv8vGkx0IypRxSoPI91t4glYFLW4dWTxod17xD2AhPkVI5cFgGyG3wXWTJQaa1JyUqVkgm0KhcZY4SRDMJHkhzUsZlnSSqgVy895SC5w+JE02Ds7U+ksL7sd1u+f+OrMG0FGa9C6NhWnObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QckmXtlDiQaeZQuDTOhckAKX8c2IjxTAG/o+rQuU/OM=;
 b=DnuLV62IPZsEjmUwhQKEZuJxXgKSn6lmAs8PLG44Wqh1kKUiUDZfohr6jDvDAGgzmQYbDk0rmdVxA64SYy0yHTFo+echtmogc/p1qDKWtee7Xn4tGh6KJ2cJgU/0Hd4MsEZKTYyBpmioQq1vCLor1GZ8V500LYc5H7s3luS04Nm1jAiPnd8BE1c6ymm9ulaL1ufKgSR9s8zNhghaAdFB7PGp8fxbKu6oHyBL4rR+AR4YAueCa2VLJ5tuRab536lHzr7LOL2c14lOTIFTgSm5PXgYZ/m+mtLqceB+LYB5FRf8bIPsuDHD9UDCjUwtEswMmMxJwjSiPqECrkm+vhr1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QckmXtlDiQaeZQuDTOhckAKX8c2IjxTAG/o+rQuU/OM=;
 b=ujmo1F3tESA2QKBKYyhFFrUGIffTk6/pChDMadjAQt71YQCsVShVGUsH8CBneaq6Y2xWJYZ+zLo+hAowLxbGemj4jV1v0BYsMZvcJnPRYJt4oBslMSa+K8cDHVVEw5CdNKnjSDbGBzmRZ1E1cLbt/z9++vh+XGyBILxucJpuKvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 0/2] Move calls to memory_type_changed()
Date: Wed, 28 Sep 2022 16:11:15 +0200
Message-Id: <20220928141117.51351-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::24) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ad0678-df88-4503-aa8b-08daa15b5393
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3EeDrlN0INK0bFmAzmwjFKHS0+MH1J1GgEwI4pI4wFAwUpSAnwqjy3ZoOTptUVtkAE2VsHZRh5xgsK5tXWvb7iA8gGCuhvDltZoKii7PHMUReMENJr20lFBrgvUmOLZwm2jbS8ARxYb4zb9HNdtmem4v/qPXVBI18TgePlWUaTOpRH4zz7sy7vHnzzrFVZdJmcHgbCAtbkwO23T1YF123+q4loD6kLx+6ysfQT+waRYqvxdpQIDogb/+HeoJjSSGZVdNotvwA2aaftsns6WIMp4H4/K0xZGY0IxNOkPt02u3lEz1hPCdkMrm15x88MFj9sNLKBU5LrPjdmv0Kt0KkwiMlnJ6aoNnVqsKJUIcHDN0o7U3dbE2iX0yeKZ+/HG4K66xwgcpnow4vh8N2Ls9KQtU8l33z5Z2Zb5uT+/tzkLIZkI7pOHOcE3YqixF2wkZyiCWwNC5OnTtwVH3JMEP3Bz/pzswIiUkmupTdDPsVgHh+5ZkfQnDZMtdMp03xI1dVtfiFvvthHcnU0i2XBFClYY0C0DT9pCdTGO6KeONH4I9qEAbY6cziNvf0iauCrbIV8/GGgvwTnxHBw+yk8kL/300frTDovEMKC1yqvFw0LL4+mR2abh1o/kTalTrwTFH7q+XFDVR3+PF51qkm3qyFQEdm34ZMpCN6CEiIv8oiuM1q8BW9Bib0tKHuOyY4/cgC9JG8Ag4soEPFGyn9tEKYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(82960400001)(6916009)(316002)(54906003)(5660300002)(8936002)(8676002)(4744005)(36756003)(41300700001)(66556008)(66476007)(4326008)(2906002)(66946007)(6512007)(186003)(83380400001)(86362001)(2616005)(26005)(38100700002)(478600001)(1076003)(6486002)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2dmRW1pelBKRy9jb3owMGZIQ2JVelFLbEYycE5LQURXSWZEZVBuZjZEM0xR?=
 =?utf-8?B?U1Ywa2tzK2loZFNaUWNHbWZ3VzBhS1RtNW1ubGxmWlJUZFZaWHdpMmpQQ2Zp?=
 =?utf-8?B?eHRmYlZLZGFzYUxwRG9VNEhpNDJPY0FDc21iSzJTSGRvekUzYlNOM3UzNUJp?=
 =?utf-8?B?N2V4dVJacXdHVlJKejJpV1g2TXAwVklNZmE1K0hXbGdIRGdIL1F5cmN6SHBh?=
 =?utf-8?B?amlzSTNoSlhpSVMvYzNXS1hHTzgwRnFnNTdQK1BMOHd1WEMzRzg4ajZQZHk4?=
 =?utf-8?B?dDJHWWwrZkxmOVlGMVpjUUw2c3l0SUlqazBGajJGUktWV1JNWFJiZWYvTXFu?=
 =?utf-8?B?MEdHVFFBUWdsSnhDcHgyQTVKbC9ldmdkbjZ5ZlJvb0VNamt5dUdGdlVmZXl1?=
 =?utf-8?B?N25oekRvYnR5eG5JYWVIVnpEcmt4NWhhTm5QY1NTNmt0UWNiRXZuUXFYVU1z?=
 =?utf-8?B?ZVlzU1VZYmEreXJsMUFFb3FxaEVpbWY3bURCUG5DclN0aXlXVmVaTEJYWFVK?=
 =?utf-8?B?b3BUY29DVTlMcVAyTG9vRkJTZG1ucmhNa0kvbndZcGJWMmhnKzFsaHFMRGhE?=
 =?utf-8?B?NmVtckczOVZqNFowTTVjZ0pVSm80amtYK29NQzdDTUFicmRiTDBlbEoyRmt4?=
 =?utf-8?B?RnczT0g0bmdRSnlXNWFzWUd4NDlwQXhtVEJVdE1FMkprQU85STlOSWVzV0Zp?=
 =?utf-8?B?RTZ3UGQyalhzTmFsM01ENjRRUUp5TnpyN3hrK2s1blNwQVc5bnJLdnFIdFE4?=
 =?utf-8?B?UUgxT2o2eFdpWVlYbkpSdnArakNiL2hLTEVUWjVLMGk0UGkrdCtUY1FOSndU?=
 =?utf-8?B?aDdQYitPQUJ1dHVRODF2MWg0OWpuV2tPL2xpaEVOcEpKTFh1dDZUeVhXRlVT?=
 =?utf-8?B?QjU4c0RkYmYxNitzODJKTlplQ0oxd3hwNVdUK2VwYnIrRXJJN3NDeU1NYmlH?=
 =?utf-8?B?dC9uSTVQdjN1YUNSVjQvSWt0N1VEZUlLK0YxMEdOYTJlajNyZWZyVmZaTUM5?=
 =?utf-8?B?dEZDSzFYUTRUdFlwaGJCL0xWZGtxYkdPZmM2cVhmODJNSUxzaXpnYTZBa1Zm?=
 =?utf-8?B?OHJKS1A5Q2F4SXQ0UHlDUmduVG5ZT09xNllsSW9TZGZjc1lSOGZpaFFoRzhL?=
 =?utf-8?B?Qlhob1lqRVJiTGNSc2lXbUNuSEVuQmpxb0dvWmtlWkNkVlBabjZEN3BrQkkr?=
 =?utf-8?B?N2s2R2tITGp0b3paczdxU1gyTmZGWUJsZkJDQTFBeGpOUFZuVmcxYTFWNllw?=
 =?utf-8?B?NGQyVmphSTdhbmlEZVpoQ2pjTU0yTHZwcWdnRVo3MlBWNnRIaWw2SWdIRXpN?=
 =?utf-8?B?MTZQdmhtY1hOMmNxNDlpNTgrYmtBUzZoVHpJb3FGTjVBQTIrMHUzUEZXaXhp?=
 =?utf-8?B?RGNVaUkvN3JxMk4zNHN5dEh4NjJzWDQxM0crbW43Smx4eUtiWC9FU21UK04v?=
 =?utf-8?B?aStmcW8vVElFZXdZUHpRaXR6eXhsdGZLUVJPYjZOam1nMkdLUW1TYVdMNlcz?=
 =?utf-8?B?aGdJS09TWUtiQnZkYysrYmcwL095dEppU2diMW5vZnN5d3Z3Y3lISzN6NzNS?=
 =?utf-8?B?OVpzRlFTWHFISUNoV2ZEUEMvREg2b0diYlFaTWZReFJib2N4bkZ0eXUxa3BD?=
 =?utf-8?B?YUo0c2tYWE5VQXBuUVBVOGR4ZXdjUitrbFpjc1pkeFpjTUZ2bTNodkphVkxR?=
 =?utf-8?B?bFVEbWVvb2Q1Q3QwalppZXpWNHVwYXBhZHg0dnpibnRneDBjUVVieU5VR2xh?=
 =?utf-8?B?bHpVNnZYMHdjcityeXdGYzQ3cENkdkN4T3Z5b1krM0tRMXBGa3l5QzFwSG5r?=
 =?utf-8?B?djJsV2VpMXhjNHVJcGRWQ1hmcFQzaGVvN1hXb0dhejNRcXBIaEkrTTcwaVZ4?=
 =?utf-8?B?VnZqUUdZRS8yWFVUM0FSSWJ2T1FlZUJuY2lsUnF1QXlUUW44TWFTcGxwT3Fz?=
 =?utf-8?B?OXZhUndGS2M1anAySm1wVGxtcUxDTGE1eUhWa09GTG5LTVFkM2tObzhvZmZN?=
 =?utf-8?B?WXlpeUUzSkJ5SkdEd0VPT1UvK3BObDlTUVVRc09HQytIY251RE03WU4vVGIr?=
 =?utf-8?B?SEFHMCtoQ3RkTXM1UWttTEpHRENHV1RaZWFVTEhZMnVBN0RHRHFxbVdqMWZE?=
 =?utf-8?B?SEg0dTFkRVZtOVg5czBiVE85Rno1Mk5wL01jVkorZmFHaHRDVUNWNXpheXIr?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ad0678-df88-4503-aa8b-08daa15b5393
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 14:11:24.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M20+UmG59T2NQTrgLMDbX1WCUbvv5dChiwQfmgU2LehUUF9JwvJ6ctiabI8FQXBlSaOR69f2i8hBqI6fqHl70A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5596

Hello,

The current calls to memory_type_changed() are wider than strictly
necessary.  Move them inside the iocap handlers and also limit to only
issue them when required.

I would really like to get some feedback on the Arm change, since this
is now a prereq for the actual fix.

Thanks, Roger.

Roger Pau Monne (2):
  arm/vgic: drop const attribute from gic_iomem_deny_access()
  x86/ept: limit calls to memory_type_changed()

 xen/arch/arm/gic-v2.c            |  2 +-
 xen/arch/arm/gic-v3.c            |  2 +-
 xen/arch/arm/gic.c               |  2 +-
 xen/arch/arm/include/asm/gic.h   |  4 ++--
 xen/arch/x86/domctl.c            |  4 ----
 xen/arch/x86/include/asm/iocap.h | 33 +++++++++++++++++++++++----
 xen/arch/x86/mm/p2m-ept.c        |  4 ++++
 xen/common/domctl.c              |  4 ----
 xen/include/xen/iocap.h          | 38 ++++++++++++++++++++++++++++----
 9 files changed, 72 insertions(+), 21 deletions(-)

-- 
2.37.3


