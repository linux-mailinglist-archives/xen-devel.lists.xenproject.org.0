Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1CC9E280C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 17:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848075.1263084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIW5O-00057I-Sc; Tue, 03 Dec 2024 16:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848075.1263084; Tue, 03 Dec 2024 16:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIW5O-00054b-Pe; Tue, 03 Dec 2024 16:49:18 +0000
Received: by outflank-mailman (input) for mailman id 848075;
 Tue, 03 Dec 2024 16:49:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tIW5N-00054T-If
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 16:49:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20609.outbound.protection.outlook.com
 [2a01:111:f403:260e::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88485fc2-b196-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 17:49:16 +0100 (CET)
Received: from AS4P190CA0027.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::16)
 by AS2PR08MB9319.eurprd08.prod.outlook.com (2603:10a6:20b:599::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 16:49:11 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::97) by AS4P190CA0027.outlook.office365.com
 (2603:10a6:20b:5d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 16:49:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 16:49:10 +0000
Received: ("Tessian outbound 4eb3d11e9250:v514");
 Tue, 03 Dec 2024 16:49:10 +0000
Received: from L98739cf83a07.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A4626CE-0AB2-43BA-AEAF-D8E276D5B68A.1; 
 Tue, 03 Dec 2024 16:49:04 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L98739cf83a07.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Dec 2024 16:49:04 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU0PR08MB9631.eurprd08.prod.outlook.com (2603:10a6:10:448::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 16:49:02 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 16:49:01 +0000
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
X-Inumbo-ID: 88485fc2-b196-11ef-a0d3-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vdERTbylWYMJ/vD2oE1OaMD3/gkh3SNPCkRtgSRpdmZCgNgi2w3H4wllHsiJ8XX/0p2dXNGnLvmynsNnY24gs1a/mRH5d0AEYjPCpG93W8smB0pfq6SqnNXBtjeU7F3z48fr3+GhFJ36WDGTlF77vJbhf75Z4rC0bOptL0vDDqP1yvXiDf9gu5utV3Cz2iQVHLLnVyVMYFVB5HhO1CU8wUQ+H1JV/UPaQIwi48JFfHZZtXHdRLMJP4P27fGXyVapfAMiczv0KI9vTVGal7G2a9BCNZK4y7qQqO0EG8Ax4AotcbyxGcl0Pq6/Dtngc7Rmhu2aen0bQjhnoOrpZB/47w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTYDWcqNwuIfZLvqdzy09qQIMnJ/Jd/lkFMevRKznCY=;
 b=sfE6veXKJp9zzGR2agG2Ojwwwm28l7qbPpyBAb5BXCxsOPoJjikUQ9J16bx02jaWJ9avNoTWupLZ+lHcFR7+5dIPW0q+CGrqMn9x+VBajzHxc7t3kp4JOpWx7LquRQKFdGrvOxEvoGHhhkmv0h9RqwPGW6ZOBDRAzjYX0JSx0ubonrAYM4xoD2SQhLmavUjztblpXwI0JH844NweHQNfYd97uCaNoMj801SWJc9tHjSQRJxbqqgO8B8w1MW5swtf4Pmd9IS7G4vjptbWeUigEX6nb+bmCjH76Hjos7mJWN0OXAoUifJYS/G3Ckw93LKJf2hVcoLtpQsge8hzSWGdkQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTYDWcqNwuIfZLvqdzy09qQIMnJ/Jd/lkFMevRKznCY=;
 b=Q/pmJq4jWmAJimVO3Z5Ja70a9pmVRTyTN2O5B7OsTHFEHMDDTNYGmJasdW4naLXncFq8bDM6Sr+Fsc+sLm5u5yj1u94pf86ZSYqOwb1Iv+sZTtVjKD22pUv+yNBjJCQCWYRKIbBmdGReIKL/wkJGChq1M6jJrKzmYMRDZKmPYLw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59ad6097e1d01965
X-TessianGatewayMetadata: ZUUalytOjh1LK2gW329sJOWQqHtSmrqf1/Dtzq+zcHGAb4VaJbhhZ7j8zVCYDa0SV9O/EX3DUiMlKTKRpe8Ui3wBE947mCtdLWt3zdhCQcC57dBI7Ks3xxycEp+2yCpXHvfG3WJsLsqyE028UIxY/hLvkdRIsj6bhGcZ9NuVxEk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmUvcbT26rXZDw4gTkUx/bfzicwxXsAKex0Ct7hOTCyYXD7jFC2oWx2K72PXAqkbquBH4ca2vNeHQtHcB1ptk5A6TqCW63Ow3wYYEel4B/ns5wQvyTjQ+rUzZ4Qn/e3BgqjPdi87IQ8BsRZcfEyGK8ztLwNBDFtIyAkFrOObQyxXaNew8WG7CS5AusOtJHUO2fc6afbrllUpFx0R9/T01gw5B/vNFedx15/tC/76uGfMkuegMZIreU/l3M4FkYrVEdp3k0CSQLuIDzDO+3IGrLXiJ4/TvnAav4BeuuP0EiHw9wqTHdOm1Xie3MB5qfNA83Ipu/G++Sh7m2nIb+q3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTYDWcqNwuIfZLvqdzy09qQIMnJ/Jd/lkFMevRKznCY=;
 b=E8foPcEnVUAcLArSX8x8P5SQDG3EnR6r/qtoZeLzUllEAtEo2mE1GOREJLHxZA8GTqq8+TpnA4VvYo3hAwqWxceskQFb/VqduRJKL+4YUzURpWb83wbv1/o1yBLtQFnvR8cqQiaUDzaFNCOFYGk6WY6DPV3H9apF4YiuEQBlnl8t/mkAYuoPXSOk2ZdAPeLGzTPGYXjx2tZnulJSmsWYAG3+VeiS19EdWyhGgWIXo/DAMlvkYzOOVYN1K5TDTAwJ2vOjbBwr6SXIjreDrVNhVgJyD5WGIcQNvBsXvG6eSPBmjDNl110LFUL0l9N+T6LF9wPN1CP4vfOoqvNk011fpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTYDWcqNwuIfZLvqdzy09qQIMnJ/Jd/lkFMevRKznCY=;
 b=Q/pmJq4jWmAJimVO3Z5Ja70a9pmVRTyTN2O5B7OsTHFEHMDDTNYGmJasdW4naLXncFq8bDM6Sr+Fsc+sLm5u5yj1u94pf86ZSYqOwb1Iv+sZTtVjKD22pUv+yNBjJCQCWYRKIbBmdGReIKL/wkJGChq1M6jJrKzmYMRDZKmPYLw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Topic: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Index: AQHbRWz5mao3stJzR02TMW5lND/1eLLUrCiAgAAPXIA=
Date: Tue, 3 Dec 2024 16:49:01 +0000
Message-ID: <DD4CD1F6-D2D4-47AF-8A0E-D4344A6E1490@arm.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
 <20241127183906.485824-2-ayan.kumar.halder@amd.com>
 <433175CF-550A-4AF8-9422-5411D0107653@arm.com>
In-Reply-To: <433175CF-550A-4AF8-9422-5411D0107653@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU0PR08MB9631:EE_|AMS0EPF000001A8:EE_|AS2PR08MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a11a3c-9533-4c91-8edc-08dd13ba6947
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bWNFdWc0OW1rcHE4VzdmMXRKQ0tWTjR1enZPUTlpQStTUXVTei9VOEhvalJM?=
 =?utf-8?B?cUthQlBwTmtVVGczOHlKQVJ3K2JVNHIwRTJhR3o3MElNVGZpQno1d0ZpbEI1?=
 =?utf-8?B?UDZhUEdMMzNvblpBMVFkQVFtRzBSYXp0K1dBTkdJdWlXcFFUUkM4NFIyNCtu?=
 =?utf-8?B?L1YyblpxTFFMV05TRmtBZmk5b2JVM3RVeFZSQUZJZ1pOZ1orMEtjaHBkQkVJ?=
 =?utf-8?B?Y2JKczh0TS9CQlF1Z3FPaEpDT2xHZmx5TFR3andLZjRBVTJYdzlIMWQyNHVk?=
 =?utf-8?B?aW4xdHZGNG0vWGpVd3RKeWVHS1UzUktIV3BwN2JOckpaanZvQ1VpL2ZMTFl3?=
 =?utf-8?B?VHJlUGd4ekdlL0lmeno3U2hHSUlhcHF4ajBQSlBtZEJOOG52c29mckg2OUtU?=
 =?utf-8?B?aUZjNVdkamNnWVd4SlJSNGthQzBYaU5uK2w3dVg1RUU5OFZ3ZVBpcnllOVhS?=
 =?utf-8?B?RnZYdk1IbHJjNjVlcWhSbE5JOXRPcXZMaXg1Tmtpb0YyT2VFMlR0ck9nMGJY?=
 =?utf-8?B?c0hIeUZLUmtuNGdEYnhVOEJSbHdBTTQzdzNwNldLWDJadCtNVHZLQ0ZGUUk1?=
 =?utf-8?B?MExXTHJqRDc0TzFYVUNscXF5WjBpTi9sbTZsUFp0bjYvN2I3RjdySlZpd0Uz?=
 =?utf-8?B?ODh3dTRoNU02ZVA2TXhJbDhnOWQzOEk2REU2TEVjMUFmN3Q4TmZxRk0xb29C?=
 =?utf-8?B?aEhEWVlUd0ZBL0F6d3NHa0NWcHJBcnZhNlRIc2lKdm9iZGhWb0kvS01jZ0h4?=
 =?utf-8?B?cHNqcEhxa3A5bEdjY1BGM2FJamUreXduZEtDN010OHNHSzFQdUg4R1FiU0Y1?=
 =?utf-8?B?SDZGUkNIZFgwdUxvNmdPNU1SaHkxNG5ENS9uc0d4U1RISTJ4WmJ3TXdwb2Rw?=
 =?utf-8?B?bGcxeDFGT2dOamFOem9vWG0vWFFJSVEydndTQmZqaUxvbVpoMlVJaWlMNVNX?=
 =?utf-8?B?RnlzUjJtT0VmZGdEMXRkb1BBNUtKaUs2b3FjQm8yeTZIdm5uZWovSlhuT2hm?=
 =?utf-8?B?M2JJUldJbThJbUNsZVJIK3FuR0RiNWY0bHhFeGVQL0JpcEZhU0NucUcwSXJQ?=
 =?utf-8?B?SWpiREJEVVpLTlhZUk9PV3lxdVRJZlRUOHNZT2xFanNjVE9NNExvVDNJVUU0?=
 =?utf-8?B?eUpxRFQzTHpYU3paWDRvenBEeXJSb3VaV0ovNXRIcTRXekxpVFB1YmR5K1Jy?=
 =?utf-8?B?QnJmRUVuak1TVEcrRVlkR0YvdlJhOHN4M0x4ZEtmeTdMQWRrUXdWc2lBZTgy?=
 =?utf-8?B?ZFBrdlZGdGJSV29pODU3VW9KL0syZUxFOWNHYnpIQTVFcGZHdXZ6NkV0MEZJ?=
 =?utf-8?B?NWZCK0J6QTFXc0JySDFSRDBnSXBDL21TbGZMa3pkRlFQMHBDQzF6bWVhSFRv?=
 =?utf-8?B?djlySjBmNFZ4MDErT05XdnR2SVJDNUVyUi9wRW0waDFORVN3VUV6SVBSRWJQ?=
 =?utf-8?B?L0dxVm5WMVZOZ2tVYk9adkNoVXdHVzl3Z1ovMWF6UXpzejNibzRjVFFleUlC?=
 =?utf-8?B?T09VOWlSMWlVWFFjRElXWjJnRXQ1MFNUMVBFcjVqUnlZZXNxUjk3aEh0OW5F?=
 =?utf-8?B?QS8xU1pkbnNGRThxelFHdHRhRTE2Tk9IR0F6U0FJQ05UczlCNi9KRkxPeG5U?=
 =?utf-8?B?cFp1T2hwQnh3MnFWcnZuaXNkU3FBWUN6dE5ia3Y0ODFsQVMvOW1GWDFPeTRE?=
 =?utf-8?B?VHBZQWEvRXpvUnRBMUhFSUdCVFpDRXRMbTJyY3VraGlxTXVPSmNnZ0hxekts?=
 =?utf-8?B?Y21JU1JSb1h0WXcwb0hKeGdQd1ljbjVlMzcvNUhkenJXaW13K251SmVidUdl?=
 =?utf-8?B?dThjZE4rWjUwb1VlT0J4Y1dRZEk3RWQ5QURZTVE5enh2WHhUT2ZlMTJVRCs4?=
 =?utf-8?B?alFHTXVrVDBpYUFsVHp1bk9MVkswSUlpYmEza3RpS1NoY1E9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B24FA8527B1097479F7D39D2FA5CFCC0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9631
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	512c57ee-eda5-425e-46fe-08dd13ba6407
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|14060799003|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzluajdrU253M0VMTXNkWXp3STI0dERSWGVZRVJwcmswTGVaUlBwdHFlbHpo?=
 =?utf-8?B?NmFBU2FreFMvV21mNkFxUzRNNmExelZRY0cvTnovdlNpMTlVZEpqQ0hTYUJJ?=
 =?utf-8?B?NVBrbFhJOXNpYWU2ZHBBWXhYdlVmU0RBYTdWOEMxQXVTS3huYWVyZ2dISDNu?=
 =?utf-8?B?UXl4a0xkOWFJNnBrZU1LaURwOExJZVFxQmZOR3NTdHpGQWw4UTJnWmp2VW43?=
 =?utf-8?B?ZStxU1hSdUhlSnlRWFg5N004TStjT2t6Vng4eVlEWHoybVNwK3hVNHBxVW9M?=
 =?utf-8?B?WnJlMU4wdjVyQkZTTldrV1h1YTlLTVF2bEF1Z1c4M3pLRkZyMlZGN0dwaXh6?=
 =?utf-8?B?c1BIeUw1cEJ1emtNRVNaZ2hUWXQ5L1NVVDVIRDVzakZRTFFQZGcvZEptdnhD?=
 =?utf-8?B?SnBSd29PdUN3S0s3MXZHNy9ZaUQvWno4ODRuZ3o2QzFJRlhkWXJMTlZRaWRa?=
 =?utf-8?B?REJZcEYrWG5JQ1Q0a1dyQm5pbU5WUjhLNjkrazlvY01pNDRVOStYb2Fwd1Np?=
 =?utf-8?B?K3Z3V3l3SGd5Mkx1cEFqYlA4RzRFRHliblN4dUZHNUk3bDV4NjdncmgyNnUr?=
 =?utf-8?B?MzZIQnFZN0hXeWZPV2lJQUFzUW5BZlhIb28raFNxWFVHdURteGhBWStmT0pr?=
 =?utf-8?B?UXgzVndSNjhwUUx3NU1renAwTUltOGxDbnNFVmp6VTFCUmd0d0NxR1dwcUNr?=
 =?utf-8?B?UVE4UWd3NS9OZ1JIRTNNNWFjOVordGFSTVZoZk5md0REaDRncDJ6bTdLMGF4?=
 =?utf-8?B?alVMaDI0M2FrTTR3ZmN5ZTN4WDJUYURsTUJlcXhwU0FZZnp6bHJFeHlMYmg4?=
 =?utf-8?B?Q29VdmxIb29UdCtoQkp3RmNJd2dwVGRBd3pSWnR3RTJxS3FZRkxDL2dDT2Ns?=
 =?utf-8?B?TXdNSWJxWm5wSG0zOWFNb1lQRTJIQjZDejEyTEtCZzV3aDFuMUkxMmNtZUtG?=
 =?utf-8?B?bjd2NlRSbUVXQWlsbE5xVTVMWC9idVVCNURQTENpYXJHc1NpSnNlQmFkWXg1?=
 =?utf-8?B?MkNJK2RDem5SeThScWRuTi94SExNVGpWdUloeG4yRHUrbGdGbEgwcVVDTzBR?=
 =?utf-8?B?NitlZGZ1dnZQeGtTYThXa1ZvZU1sQU81RGd1UWQ4KzlpempieklPdS9hdWV4?=
 =?utf-8?B?MTBPU1hjUzZkL1BPdDNYbEhJYitHUDRsMnhVcWd1NGgxOVZLNmVIY2htdkRC?=
 =?utf-8?B?Ynkyb2R3dDVBbUE1dzBPR0N5enNwUzBKeVN0RVg1SVp5QXNHZkhmVG5oN1RZ?=
 =?utf-8?B?ajZQNnpjUXI1eTFSMVR6UXBSaUNBckh5NGtsQmxIcGVjUXZxOVcweFFMdk5z?=
 =?utf-8?B?VURtaGIwU1ZOZFhJYVFiaXBMY04rUy9DSGpVQ0o4RWNtL254bUkvN2RRaW9Z?=
 =?utf-8?B?NzkrM1BlcXdHZm80THUwOFFIaEpqRUdzYlJ4ZUdLVFpPb25iTzVybFVaVEpM?=
 =?utf-8?B?cTFlaVZuVHhpcksxRVJHQ2JXVEw4bTFOV01YZm8wMXdqd3dPZ0RQQjM0QnFq?=
 =?utf-8?B?U0JXY1d3eGo2NlBJbXZnc0gyV2NRaG1pbDdTMGthK0NtN3JMcXFsNDQ4c3Fp?=
 =?utf-8?B?MmlwRW95Zit2dWxMMmFWOEk4eTBaSm1vZlZrY2FkL1REeEp0T0YvSk5XWExq?=
 =?utf-8?B?Myt1MEhwMmlrN1ZETEIySlRZNkhBdXpxbExUalhtV25zTWVYTWhRZHJjVW5o?=
 =?utf-8?B?UVU5NjZNQzRnYjhOektvWGw1QTRhSEE0OGhyV3lOSURLTzhPZ1NLYWthMlhJ?=
 =?utf-8?B?RlhRaHVIMjFKcDNHMGFNeFR5OE9teXNBMHlEUWZpOG4rbFhjeW1ZZE9zSXk0?=
 =?utf-8?B?UEcyUzl0Wm9CZE85c3BhWU1QdnVBOFZLS1JkZTdkbi90aEZla0dmL05EUFBt?=
 =?utf-8?B?SGRrR2JSVGhENzJBSUdJTkkxcWt3TkpxR2JNSkxKSXRVanZDbWJSZXRHemZo?=
 =?utf-8?Q?QZbZU/yYdtP846qC5uJo8+Egbdv8YQFE?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 16:49:10.6839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a11a3c-9533-4c91-8edc-08dd13ba6947
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9319

DQoNCj4gT24gMyBEZWMgMjAyNCwgYXQgMTU6NTQsIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2Vs
bHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBBeWFuLA0KPiANCj4gc29ycnkgZm9yIHRoZSBz
ZXBhcmF0ZSBtZXNzYWdlLCBJJ3ZlIHNwb3R0ZWQgYW5vdGhlciB0aGluZyB3aGVyZSBJ4oCZbSBp
biBkb3VidA0KPiANCj4+IE9uIDI3IE5vdiAyMDI0LCBhdCAxODozOSwgQXlhbiBLdW1hciBIYWxk
ZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPj4gDQo+PiBDT05GSUdfRUFS
TFlfVUFSVF9TSVpFIGlzIGludHJvZHVjZWQgdG8gbGV0IHVzZXIgcHJvdmlkZSBwaHlzaWNhbCBz
aXplIG9mDQo+PiBlYXJseSBVQVJULiBVbmxpa2UgTU1VIHdoZXJlIHdlIG1hcCBhIHBhZ2UgaW4g
dGhlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSwNCj4+IGhlcmUgd2UgbmVlZCB0byBrbm93IHRoZSBl
eGFjdCBwaHlzaWNhbCBzaXplIHRvIGJlIG1hcHBlZC4NCj4+IEFzIFZBID09IFBBIGluIGNhc2Ug
b2YgTVBVLCB0aGUgbWVtb3J5IGxheW91dCBmb2xsb3dzIGV4YWN0bHkgdGhlIGhhcmR3YXJlDQo+
PiBjb25maWd1cmF0aW9uLiBBcyBhIGNvbnNlcXVlbmNlLCB3ZSBzZXQgIEVBUkxZX1VBUlRfVklS
VFVBTF9BRERSRVNTIGFzIHBoeXNpY2FsDQo+PiBhZGRyZXNzLg0KPj4gDQo+PiBFQVJMWV9VQVJU
X0JBU0VfQUREUkVTUyBhbmQgRUFSTFlfVUFSVF9TSVpFIHNob3VsZCBiZSBhbGlnbmVkIHRvIHRo
ZSBtaW5pbXVtDQo+PiBzaXplIG9mIE1QVSByZWdpb24gKGllIDY0IGJpdHMpIGFzIHBlciB0aGUg
aGFyZHdhcmUgcmVzdHJpY3Rpb25zLiBSZWZlciBBUk0NCj4+IERESSAwNjAwQS5kIElEMTIwODIx
IEExLjMgIkEgbWluaW11bSBwcm90ZWN0aW9uIHJlZ2lvbiBzaXplIG9mIDY0IGJ5dGVzLiIuDQo+
PiANCj4+IFVBUlQgaXMgbWFwcGVkIGFzIG5HblJFIHJlZ2lvbiAoYXMgc3BlY2lmaWVkIGJ5IEFU
VFI9MTAwICwgcmVmZXIgRzEuMy4xMywNCj4+IE1BSVJfRUwyLCAiLS0tMDEwMCBEZXZpY2UgbWVt
b3J5IG5HblJFIikgYW5kIERvYyBJRCAtIDEwMjY3MF8wMTAxXzAyX2VuDQo+PiBUYWJsZSA0LTMs
IEFybXY4IGFyY2hpdGVjdHVyZSBtZW1vcnkgdHlwZXMgKG5HblJFIC0gQ29ycmVzcG9uZHMgdG8g
RGV2aWNlIGluDQo+PiBBcm12NyBhcmNoaXRlY3R1cmUpLiBBbHNvLCBpdCBpcyBtYXBwZWQgYXMg
b3V0ZXIgc2hhcmVhYmxlLCBSVyBhdCBFTDIgb25seQ0KPj4gYW5kIGV4ZWN1dGlvbiBvZiBpbnN0
cnVjdGlvbnMgZnJvbSB0aGUgcmVnaW9uIGlzIG5vdCBwZXJtaXR0ZWQuDQo+PiANCj4gDQo+IFsu
Li5dDQo+IA0KPiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hlYWQu
UyBiL3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TDQo+PiBpbmRleCBmNjkyZmM3NDQzLi44
NmU0MDE5YTBjIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L21wdS9oZWFkLlMN
Cj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TDQo+PiBAQCAtMTEsOCArMTEs
MTAgQEANCj4+ICNkZWZpbmUgUkVHSU9OX1RFWFRfUFJCQVIgICAgICAgMHgzOCAgICAvKiBTSD0x
MSBBUD0xMCBYTj0wMCAqLw0KPj4gI2RlZmluZSBSRUdJT05fUk9fUFJCQVIgICAgICAgICAweDNB
ICAgIC8qIFNIPTExIEFQPTEwIFhOPTEwICovDQo+PiAjZGVmaW5lIFJFR0lPTl9EQVRBX1BSQkFS
ICAgICAgIDB4MzIgICAgLyogU0g9MTEgQVA9MDAgWE49MTAgKi8NCj4+ICsjZGVmaW5lIFJFR0lP
Tl9ERVZJQ0VfUFJCQVIgICAgIDB4MjIgICAgLyogU0g9MTAgQVA9MDAgWE49MTAgKi8NCj4+IA0K
Pj4gI2RlZmluZSBSRUdJT05fTk9STUFMX1BSTEFSICAgICAweDBmICAgIC8qIE5TPTAgQVRUUj0x
MTEgRU49MSAqLw0KPj4gKyNkZWZpbmUgUkVHSU9OX0RFVklDRV9QUkxBUiAgICAgMHgwOSAgICAv
KiBOUz0wIEFUVFI9MTAwIEVOPTEgKi8NCj4gDQo+IFNob3VsZCB0aGlzIHBvaW50IHRvIEFUVFI9
MCBpbnN0ZWFkPyBGcm9tIHdoYXQgSSBzZWUgb24gWmVwaHlyLCB0aGUgcGwwMTEgaXMNCj4gbWFw
cGVkIHdpdGggbkduUm5FLCBvbiBSODIgdGhpcyB3b3JrcyBmaW5lIGJlY2F1c2UgaXQgd2lsbCB0
cmVhdCBhbGwgZGV2aWNlIG1lbW9yeSBhcw0KPiBuR25SbkUsIGJ1dCBJ4oCZbSBub3Qgc3VyZSB0
aGF0IHRoaXMgd2lsbCB3b3JrIHdlbGwgb24gb3RoZXIgQXJtdjgtUiBhYXJjaDY0IHBsYXRmb3Jt
cy4NCj4gDQo+IEkgd2FzIHRyeWluZyB0byBjaGVjayBob3cgTGludXggbWFwcyBwbDAxMSBidXQg
SeKAmW0ga2luZCBvZiBsb3N0LCBzbyBtYXliZSBpZiBhbnlvbmUgaGFzDQo+IG1vcmUgZXhwZXJp
ZW5jZSBpcyBtb3JlIHRoYW4gd2VsY29tZSB0byBjb250cmlidXRlIHRvIHRoZSBkaXNjdXNzaW9u
Lg0KDQoNCkFueXdheSwgY2hhbmdpbmcgdGhhdCB0byAweDAxIChBVFRSPTAgRU49MSkgaXMgZ2l2
aW5nIG1lIGEgd2VpcmQgaXNzdWUgaW4gbXkgYnJhbmNoOg0KDQoiRXJyb3IgZ2V0dGluZyBJUlEg
bnVtYmVyIGZvciB0aGlzIHNlcmlhbCBwb3J0IDDigJ0gZnJvbSBjcmVhdGVfZG9tVXMoKSwgc28g
SeKAmW0gbm90IHN1cmUgbm93DQppZiB0aGUgcmlnaHQgdmFsdWUgd2FzIGluZGVlZCAweDA5DQoN
Cg==

