Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316F1554CF8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353951.580962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Kr-0001r0-O1; Wed, 22 Jun 2022 14:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353951.580962; Wed, 22 Jun 2022 14:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41Kr-0001oN-J9; Wed, 22 Jun 2022 14:28:01 +0000
Received: by outflank-mailman (input) for mailman id 353951;
 Wed, 22 Jun 2022 14:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UqP7=W5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o41Kq-0001oF-DY
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:28:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82b64b02-f237-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 16:27:58 +0200 (CEST)
Received: from AS9PR06CA0353.eurprd06.prod.outlook.com (2603:10a6:20b:466::30)
 by VE1PR08MB5613.eurprd08.prod.outlook.com (2603:10a6:800:1a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 14:27:54 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::e6) by AS9PR06CA0353.outlook.office365.com
 (2603:10a6:20b:466::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Wed, 22 Jun 2022 14:27:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 22 Jun 2022 14:27:52 +0000
Received: ("Tessian outbound ff2e13d26e0f:v120");
 Wed, 22 Jun 2022 14:27:52 +0000
Received: from 0334c8926917.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F685BC6-0D12-4BBC-B54C-499F45A504BC.1; 
 Wed, 22 Jun 2022 14:27:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0334c8926917.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Jun 2022 14:27:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB3117.eurprd08.prod.outlook.com (2603:10a6:803:42::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 14:27:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 14:27:37 +0000
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
X-Inumbo-ID: 82b64b02-f237-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=W5HUAGPuKv+GArt5EYxmhGD+bi4QgtdNKAhqdycIfkhTHFBmPGOZW/JgKx+R0d8d86JgbpznvxQ/ozN+Vr4R/rSdII1R5u1GS/W2FyCctutu3xypMJ8KEG7y4C9Kjz8xLToreP+sKOjbQLvuv28E7lfXKo655DnSQuFPIpsHkn5DBvo1J5ks+rLVYdoxlp3GnnPAamyyT21zYB03lW5seaxZs3A4/V3wj1Yt96zLSPF5pjPl5tLqKZEK7cEmJqiLjp56khXBmvXF8mA4WzWEv6OhNXQOGTYwVkAd4jk+hCx/ykoneTMLH5SX96wYGsGTWTV/iJV/tx+0RnvBoFbXNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiT9BcoUKho+AnERVhlqd+nwbS3V+UP3nk5M87Uf6Zs=;
 b=M6/BY9IYS7YuZuE6uMZiH9s97iF6iCfoylTMqGAI0nYB7VGhmvxiGx70lOlBMHb41QDXARox78SHiE4538k7Ccx4aAq8Q42gkALYwPvLtk1byDxVqWKSziBDuxOzl0S5TUsaz/gyWE/6KlUeNvt+agyjdaG0RJIGYSsSbEdnIMqEQyJ6R7XGUhZDGnew/y824Qyb/phwa1Wx6CSQkdyVVia4cX2rIOsxTY1MqLgnvw/Q2xWZXmmK1SxI7ZYmFWDu/AaiNX8i1ReTJC0mARyw7ZRWwBVP6+kUunVn+ezg4reTBCmZEHJeOWty3I6k1CfLK4eqBCgbUkZfVmj8j3+gYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=arm.com; dmarc=temperror action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiT9BcoUKho+AnERVhlqd+nwbS3V+UP3nk5M87Uf6Zs=;
 b=hcZ8u5sNUS+6qU5qNYapBICth0uUhALIj+cyxlD1rbrmqnJZN7xNuStSRzBcRHVjtDbXEl8EDUlUEk/GPtQnNrf6aWZFu7Lk/DHsoUs1PIiwyW8an+owBxtNQD5lg49d6OMWdY0NdBgpxXp8j/sNt80/A/crrZDzTg4qYV5CO/s=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: a365c00f1da8da82
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxgYGzg1W0QptBhQmUHF6nvWXyXzpYHn4EsfmnuR72K6PMCSAAwLKNHrwvraRiwq/1Fsm0a5VDQaIxRZ1D/PUTZmnadGwC0JYlcg7GU035kcAsncGCPd2z0lFq3wxjm4sV4d7rl/6R8WF/XrTFdfWjp2c2HqDTSMKkb1mw0GHx0z3UqBjsRXWF5zyvY/QE8MQd9JNLQLNvthIJZAquNseN2pHWFRheMO7tuqogDJp+rl+3a7BwhZ4ABF/hvQB57P1ArCEblh/WKU4EiWaL4HlcRB4QyPdSngkSuHGD/kBgrPfKfxb8DSbzOJs4BWLYLLvhGyP5ePCbTD9OSt4okJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiT9BcoUKho+AnERVhlqd+nwbS3V+UP3nk5M87Uf6Zs=;
 b=imE3dnwnsqL71yqRKWeSR6qjs7hyNcGT5PO8qnbhWQfdMVwvmZcFkRVBl7TcT80GScvkisotTnQbqmZjaJcX8oY7EHCUhttl+SotJsL/bWlZ+RaJcJUi0pHVoix0+B4271yg9A9J3buUKkKEHPQc0WJgJJOcB3DoKIZcIVZtC6sRp0rZeMdDA8jyJSkEjEJ2obmqHQkXlGe5aubA7WRzFtzGwAnvhhVOSVFLRVZAA9gSQtBu4scUsPRjzeQ3CyND+S/g6+YcdG3D8XerxEx+x373w1QRZ0huamxjM4j83Z0UMkjuyg7JnB/PPo+3yqYVJT4Ha/3JTbYv9ktA22Lxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiT9BcoUKho+AnERVhlqd+nwbS3V+UP3nk5M87Uf6Zs=;
 b=hcZ8u5sNUS+6qU5qNYapBICth0uUhALIj+cyxlD1rbrmqnJZN7xNuStSRzBcRHVjtDbXEl8EDUlUEk/GPtQnNrf6aWZFu7Lk/DHsoUs1PIiwyW8an+owBxtNQD5lg49d6OMWdY0NdBgpxXp8j/sNt80/A/crrZDzTg4qYV5CO/s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Michal Orzel <Michal.Orzel@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Thread-Topic: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Thread-Index:
 AQHYhHPRZL4o3B5WdE6OPtXA3biXiq1bO8sAgAAqE4CAAAG+gIAADwQAgAAEMoCAAAS3gA==
Date: Wed, 22 Jun 2022 14:27:37 +0000
Message-ID: <BE80A241-7983-425F-9212-0957E29AA5C7@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
 <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
 <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
 <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
 <68d7fb35-e4c5-e5d2-13a8-9ee1369e8dbe@suse.com>
In-Reply-To: <68d7fb35-e4c5-e5d2-13a8-9ee1369e8dbe@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 83d1f982-cbf0-4ef1-dc8d-08da545b6475
x-ms-traffictypediagnostic:
	VI1PR08MB3117:EE_|AM5EUR03FT020:EE_|VE1PR08MB5613:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5613DEE4D6322EFD308DF64E9DB29@VE1PR08MB5613.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2Wemg1Pc4dYYFxL6iHqF3sYE6sQc6ecZFabVzYTdIO7AVCkTlBdxUCguSWixxHo3YjgYEbQj6a2B+HooRcOeCyss+gb2e3STh3HjzzztEl18P+kAL1ugshECUgvAVPNByTr4MwZk2tvE9bg0dAVpaAdmfzT1nZH73CNQG/3QFJzJHgBn8cmE3GCHUwfGeLtgQcJ37/7j9ef1tmE09Jg4gE9JBDgBwREs8u4X4xdtcoZmmfcHBc/KOcZXuXQkf6WQApkAC9okHhSfqyodggWoGHscUy497YDOoniUn+VueA0+R3QaW2P8cBvayHAaZdrn9DpgACHTn/xnGjHEXt4gHZQHmHazYO+MbhUtjXc/dIz3XjVuRTu90gQIhc2y/O3lf92C4WrVVO3fHEiXvc5xYerXpoPqqpf4FUXyIUn/2EaCuRcgCM4Mk9zFgiJTmG7VHVRIDeKm16r7iNfaSpLWXfueJmBLbRN9iF96mTCEyOtfhPezQUXMtuJKashhARqX2lIxH9nxlkV/EG06zL9WV1cHoo90wh4vMJPQuQ8BvR1iVyznzP6Rv25pNpptAIc1URaKnoQsGOe7GyI3v8dfjUYC3Iky7kVvFDqqApmUYlH9FKVq0sWYtp0g1Kb3XEpdAAG+m2K9HQYW2yd8Z85Cd4YAPOvc3EmyqQEqh5pmu0nr/RtKvG9VXRuLJ2M6IlHM8Kq1efgVeZVkWZ17mIHJLlEJb6UdWBvij6clXX7jMwzApEts7szHq/m1OiMfOu4YdWn2nrEk//zIdAN9ceFglyFYTfVJSaRa8FPjaw3TdU0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(38070700005)(5660300002)(8936002)(76116006)(53546011)(6916009)(7416002)(478600001)(4326008)(71200400001)(122000001)(6486002)(54906003)(33656002)(86362001)(8676002)(66476007)(64756008)(91956017)(36756003)(66946007)(66556008)(66446008)(316002)(186003)(41300700001)(83380400001)(6506007)(38100700002)(2906002)(26005)(6512007)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9ABC2D41EDEA444FAE0854DC39057966@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3117
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	782ab43b-c4e6-46f2-ebea-08da545b5b37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6WdrR3L/EKd15k7DAvIQaGzF6ihewMge4C5kKR1pRuBdeBAIfZ4Nf9S08ayWCLUeBvxzaHeKH28OyJTlCbGduKB0fRA4GeJD9/PxcmCMbmhd0eL1xYnte/+HDS718SIq0s08f20P7GNuTpFHy0LsPPBgISO9cHeYxqDcIpO6cfBTxNzA8viBwh2EheRiEzmnwElnUFk30b9mdXFT44rhWkC4Ro5feuQ3q3Z24Nd6PDTEF8V7OkkldmCbfN9FLBlKGRb88NflPT2GjewSyXxAGlvnVMPGwhNG3MjzQ5xltOL/eVr0h4liUZEaBzTaZeSO+2sCsmWUnEZ7rb43gtqX/Q7Ah7EiGwYcrsIMtR5Aol4NS5mz3vCOGyM+6EfQPIzbA7cp9Npgp3frbHhlZifmfKCb/+SwBBfzQwHolYWNdh8vzQY7XDlulY77g9kS82SWFM1h+wM9ADMmCPXhgUSH4oC0FRG9lIGXbKPdeLsfvzKuFjFRFRqlDKvWtAzkCQHNSgGHFLEAH71yIy7mLz4AH36vI7J/NKBQAQp/NzJIWrUe5xSEryksbb9BDBns6tgm5Ag2NlSF/Gt23s0LkEaW4Oz5x9sHFykqtNQ3kNLEq0iyLZpJq2HGaMswSGDvoFKn0Ta7xAxeZfDtEsUGRoAXHQ2G+CnqUeHNSrpjCcXG/RYIit8NDlaYMan2zdJopATjPcdgaZ/YMmG5SdXTfn8dgoM20p3SzgsLOtpiBNASB1Tw/QsEySSlddkGzR99AFldQ0vzkZFlJYOuxxInLS+d6R+7XUkKNXG+fuU9dYleNemFcEkcTklV5IfYCu1+YJjWTJGzfq00QeuRbkcT/ZN6dQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(40470700004)(46966006)(36840700001)(6862004)(54906003)(356005)(6512007)(6486002)(8936002)(82740400003)(40480700001)(70206006)(81166007)(5660300002)(86362001)(33656002)(8676002)(4326008)(70586007)(40460700003)(2616005)(83380400001)(336012)(63350400001)(82310400005)(41300700001)(186003)(63370400001)(36860700001)(36756003)(2906002)(478600001)(26005)(53546011)(316002)(47076005)(6506007)(45980500001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 14:27:52.9680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d1f982-cbf0-4ef1-dc8d-08da545b6475
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5613

Hi,

> On 22 Jun 2022, at 15:10, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 22.06.2022 15:55, Bertrand Marquis wrote:
>> Hi Jan,
>>=20
>>> On 22 Jun 2022, at 14:01, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 22.06.2022 14:55, Michal Orzel wrote:
>>>> On 22.06.2022 12:25, Jan Beulich wrote:
>>>>> On 20.06.2022 09:02, Michal Orzel wrote:
>>>>>> This series fixes all the findings for MISRA C 2012 8.1 rule, report=
ed by
>>>>>> cppcheck 2.7 with misra addon, for Arm (arm32/arm64 - target allyesc=
onfig).
>>>>>> Fixing this rule comes down to replacing implicit 'unsigned' with ex=
plicit
>>>>>> 'unsigned int' type as there are no other violations being part of t=
hat rule
>>>>>> in the Xen codebase.
>>>>>=20
>>>>> I'm puzzled, I have to admit. While I agree with all the examples in =
the
>>>>> doc, I notice that there's no instance of "signed" or "unsigned" ther=
e.
>>>>> Which matches my understanding that "unsigned" and "signed" on their =
own
>>>>> (just like "long") are proper types, and hence the omission of "int"
>>>>> there is not an "omission of an explicit type".
>>>>>=20
>>>> Cppcheck was choosed as a tool for MISRA checking and it is considerin=
g it as a violation.
>>>=20
>>> Which by no means indicates that the tool pointing out something as a
>>> violation actually is one.
>>>=20
>>>> It treats unsigned as an implicit type. You can see this flag in cppch=
eck source code:
>>>>=20
>>>> "fIsImplicitInt =3D (1U << 31), // Is "int" token implicitly added?"
>>>=20
>>> Neither the name of the variable nor the comment clarify that this is a=
bout
>>> the specific case of "unsigned". As said there's also the fact that the=
y
>>> don't appear to point out the lack of "int" when seeing plain "long" (o=
r
>>> "long long"). I fully agree that "extern x;" or "const y;" lack explici=
t
>>> "int".
>>=20
>> I am a bit puzzled here trying to understand what you actually want here=
.
>>=20
>> Do you suggest the change is ok but you are not ok with the fact that is=
 flagged
>> as MISRA fix even though cppcheck is saying otherwise ?
>=20
> First of all I'd like to understand whether what we're talking about here
> are actually violations (and if so, why that is). Further actions / reque=
sts
> depend on the answer.

I would say yes but this would need to be confirmed by Roberto I guess.
In any case if we think this is something we want and the change is right
and cppcheck is saying that it solves a violation, I am wondering what is
the point of discussing that extensively this change.

Cheers
Bertrand


