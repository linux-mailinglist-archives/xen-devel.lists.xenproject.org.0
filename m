Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBAC7DE02E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 12:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626389.976658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy98a-0003A9-6w; Wed, 01 Nov 2023 11:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626389.976658; Wed, 01 Nov 2023 11:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy98a-00038M-2v; Wed, 01 Nov 2023 11:11:52 +0000
Received: by outflank-mailman (input) for mailman id 626389;
 Wed, 01 Nov 2023 11:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wFu=GO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qy98Y-0002jT-J7
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 11:11:50 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7211f5f3-78a7-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 12:11:47 +0100 (CET)
Received: from AS8PR04CA0185.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::10)
 by AS8PR08MB6583.eurprd08.prod.outlook.com (2603:10a6:20b:33f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 11:11:16 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::ab) by AS8PR04CA0185.outlook.office365.com
 (2603:10a6:20b:2f3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Wed, 1 Nov 2023 11:11:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 11:11:15 +0000
Received: ("Tessian outbound 26ee1d40577c:v228");
 Wed, 01 Nov 2023 11:11:15 +0000
Received: from fd811c3948c8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0617F22-3C64-4482-8D8A-2C00BCA1E511.1; 
 Wed, 01 Nov 2023 11:11:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd811c3948c8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Nov 2023 11:11:09 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by AM8PR08MB5683.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 11:11:05 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::2c90:d66b:b17c:83f2]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::2c90:d66b:b17c:83f2%3]) with mapi id 15.20.6933.029; Wed, 1 Nov 2023
 11:11:05 +0000
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
X-Inumbo-ID: 7211f5f3-78a7-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DiYiTFGbscn6Jod673tl8ayll9jzlAvZrnFOt8fkGpkpIAT7ydzhVTC5mBhVmZVZq3jdwzqpViaY8/560Bg5ukEmY0tRvBBXD5fFwbwhYJ+wubfT4Aq9bfv4lvqEaqbqxnen0hkDYmJ0+q0euhom6X3P1KAA1mrHz36AYUEG5CtuxNkGzo/69oWH/bSEqpvUzdakF8oPESVi90e2t/NI9PRkpKB+C+54tvOKUpOZ5r+M9UEx2E0rKnNJF9ihTo9pSvgOFyfsVWdHH2upYNjU8usBBilCbo+urnb046XgNZL9qZDiITiW+xOSQyCcmqRgRzE7RdGnO9GjV5vPzjVQFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R022m9DiTXlf0oYGSKrT1IcOCXXhHcLRCRvf37XUic4=;
 b=inh+6VhUBAVEIs5DdRyIQUG4e4gJa+zc8EqkrJxIlPqEE4WHIIDKDxRvUKpyvShouDj6mgeAk0FBOdHBib394cRLYKgukWqNZ+mHYeS1fllD6964/ZO4jKDQEqtqUMsSv9iJsce7wP47U8EYtbYBqZuaDXf8tUzZypZcxXQcS+LJgvNqb2XpOTzwfN7d4CGEtds16o+rHAIPuwGddQnjWpNyTjgmqKl6/fXaH4llEaPtKenVVTsIp2KNlSK/b/+ijd/JAy9vpBOGfpmOnxotC9SYCry2V8eVaWY9O7acrwH1FCx9WGXE5tc2ZA899wf5LhQLLHu1F7DlEdLhkrXwdw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R022m9DiTXlf0oYGSKrT1IcOCXXhHcLRCRvf37XUic4=;
 b=go76W/scNkXVhUOhsFBWDR3NHptCcc7XDyXVoZwKINvQitjIr9G98zNSfBwOxeA/UhkNHRFQDMTIwc6xCW/IH2Xjpvkhnicu5IQIrxucGwHLFM4mtvf3zCdBHePxDeG1nJt0wPC8OkfuWAXAUulDN7O/1J3Y+0v8XbaK5q+lBv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9706d835900ef989
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itXZqMd5PR61EUVwJaa/3dDikzj6hv7aOfc/8QvwGKCmdYiTruhkj8MtbV6765vmaGSkqywAnN8Sa+T29WDL11YbxP0XvikGRT1YbIichn5V3V4TUHxAD3+0duZJTMdlZNC83L1dltA0LTtDB3laPL4a0g4RwyU8f8etwjyqgeQaj8A5RTdsxpCIJrpd8GelZf3/D/g8JDj6895h9tNcSRtd6ET/PZzkzYk1+iwOnSYzmiepTbjdcJZVy0nhCjWE6TBbuHQ8S5hjZMJI43iCiEm9JwuDTg9c554V1sc1FZPjmm2JmFZfepMKF2Z94HPcfVISRmrxkorC8nQwI8AEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R022m9DiTXlf0oYGSKrT1IcOCXXhHcLRCRvf37XUic4=;
 b=PPNo79Bec5AP5VHiZyLNoj9IWn5pY7aXPlyHEaLQTv3CTDqILMbTW8MTpAvuc0tEibukXnkLrDmc/QWM1XUdTM0QBEKl85bhEaensiqrUkj1gkpA1nMQXAdBsds38LTwMqqDEtDZTRGmrHftW3dRlnM5sW6ROroVzHPiKgJPWxR1YeYfphjp08HgHIfLVuYv2U3s/G+B/xwNUCsM760pSoEHZ7o7Qpvi5IJI7HiI4m/mKnwnPkLlO40a1qooTbXKh49b5/M8siKT+sNz6axmdXxoBGe0FEr85Nt/NlxFOEpm2Knhh2YHrLUesvvtcLBmmKXOkUWWDLAYQWWBBXGkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R022m9DiTXlf0oYGSKrT1IcOCXXhHcLRCRvf37XUic4=;
 b=go76W/scNkXVhUOhsFBWDR3NHptCcc7XDyXVoZwKINvQitjIr9G98zNSfBwOxeA/UhkNHRFQDMTIwc6xCW/IH2Xjpvkhnicu5IQIrxucGwHLFM4mtvf3zCdBHePxDeG1nJt0wPC8OkfuWAXAUulDN7O/1J3Y+0v8XbaK5q+lBv8=
From: Henry Wang <Henry.Wang@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
	Xen-users <xen-users@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>
Subject: Xen 4.18 rc5
Thread-Topic: Xen 4.18 rc5
Thread-Index: AQHaDLQbeYmGz7S65kSOlQvhwj74Hw==
Date: Wed, 1 Nov 2023 11:11:05 +0000
Message-ID: <F86371BB-DA75-4706-9E35-F1211B022AD7@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|AM8PR08MB5683:EE_|AMS0EPF000001A0:EE_|AS8PR08MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d67227a-aec7-40cc-7fa9-08dbdacb4403
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kcvuQ0UPgA7Yv7efQdUC6uoby4tECN/tHP2h3Ao/hRUqEYrcxFeTLA1SUm0C5ERtkd8Pf+ke1ygWjuOAThEfW8/vCC133N2LSHtHbtxYuqtvraSqnwLBQWpWaU8l4uqlwUGOPrffX1C6egrHNnDzQJcbuY/wghtdtrxWno3StGwrFcAZMU2re+PiJFsx2Xbn8VJLWjyfQqILQI+nG90gQp6Osrr6JY56Wp2nFB28DhZn6RkvvKmf98hutc2NmNdjGR++ByjFk2Q9Qv/WiPqiLUd4P4sk2Oe4JaxH5zUeAUvrJvhUg+/3jfiVNoyTfyu13eJggwgrqxPKD872c3q2S/KVF062gq4f08WIeGK1Uo3Iwg1S4ybbEsnJBPsnDCP5YDfexPG3rBAW66iXNPz58hucIS8rtWla1yLIxbSrI0GT2tr5YtR6xg0vtUNf7u5BiLFszB3s3FsLV7XzGZQPAPDt0z7GqL1b6Mhnj2lnILS7P5xu23deAM9DhCyE9/ZF7raA39w7zMoZ+bf/4eNMAAc9i3IYMA1mbLtLAJ0m89QlFPBtOTrB5jDEvR5SCNvBp2Z2nv5a2HMFpP03tNfe+p6YNyB8ktwQDzm0EnESn+1KAps2ml0F9m1MmibmslTO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(2616005)(26005)(38070700009)(36756003)(86362001)(33656002)(122000001)(38100700002)(7116003)(4744005)(2906002)(5660300002)(83380400001)(71200400001)(478600001)(6506007)(8676002)(8936002)(4326008)(66946007)(316002)(66446008)(64756008)(66476007)(6486002)(66556008)(110136005)(91956017)(76116006)(966005)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FF80E0D6B84FF4BA0EEEBA612089EC4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5683
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	913082f9-6b68-473f-6196-08dbdacb3df7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HRdGB92gi81XAkqX4vGXVxD71TjyYIURVBcu8IF4OJ+X+u9H+puTfwO169cdERFTCYnYfBSi99Pi0XX9o2ufn4ArkSzsvKiFritMzHPFQABLfutAkTXZuOjzFVxLi/xUCMmMdpTG2VoHm+pG65xbiDX1rCJ0GLZeArGV/980rmjhP9NqRnQXD3E5KoLU4/xDrWGGLRuX2Fy+DLzzLDnqcuWdd9KJdKfemtvPFtJ/88SOWLoGlwbzRyvSd4rTiaSrbgW5b5xrSsG13BKR08/zQD1sIX65m3ohDMyMPj7Ssue7F2HOr6Wbcr/WxVXZQIwSIeGy9kcZbV+5deErib1a3MoRK6OrPy70hyQAA1shBVTLZrlsRckkzKb7ta2PkEJ7fkGQFPpXwdFFlCPXBX6uu4F/1fa2ExC5hHrasKDxtnlf0eF+/eYVzewMngCU29E54hGp8EP3F+3RGgA0KQnZoIC1jAGiEUi8tOYSBc6dRCSXN1/QPRSIgW2M6EFFmpHy0XLloDYpqioq8w6eVKToIbIQlhzswZo3WmSKtCUszw4wYaokICOM9TPeqL+SJ0cfEwVTm7ZwYRtBd/C1YPG6qHOP3GIgm7YhfswbXPZa0JSxGNsz33P0G2YrGR8uNrd22bnJAuhOdDKz0p+VP0KqvKK+D5ryCxY6hXv4erY6knnfSLI9cTrTPCUr2bS2rli73yB+RZf89Ge1uOPNASASFn+INwY0QngKBnLjpa+Wdy8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(6512007)(26005)(2616005)(40460700003)(2906002)(4744005)(40480700001)(86362001)(33656002)(36756003)(81166007)(82740400003)(356005)(336012)(5660300002)(83380400001)(6486002)(6506007)(36860700001)(478600001)(4326008)(47076005)(8676002)(450100002)(8936002)(316002)(966005)(7116003)(70206006)(41300700001)(70586007)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 11:11:15.6415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d67227a-aec7-40cc-7fa9-08dbdacb4403
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6583

Hi all,

Xen 4.18 rc5 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.18.0-rc5

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.18.0-rc5/xen-4.18.0-rc5.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.18.0-rc5/xen-4.18.0-rc5.tar.=
gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me
(Henry.Wang@arm.com).

Kind regards,
Henry

