Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09937602F76
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 17:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425197.672956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okoLj-0003Wg-Vs; Tue, 18 Oct 2022 15:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425197.672956; Tue, 18 Oct 2022 15:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okoLj-0003TQ-SW; Tue, 18 Oct 2022 15:17:47 +0000
Received: by outflank-mailman (input) for mailman id 425197;
 Tue, 18 Oct 2022 15:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opEU=2T=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1okoLi-0003TK-I4
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 15:17:46 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03d7e813-4ef8-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 17:17:44 +0200 (CEST)
Received: from DB8PR09CA0020.eurprd09.prod.outlook.com (2603:10a6:10:a0::33)
 by DB9PR08MB8265.eurprd08.prod.outlook.com (2603:10a6:10:3c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 15:17:40 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::57) by DB8PR09CA0020.outlook.office365.com
 (2603:10a6:10:a0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Tue, 18 Oct 2022 15:17:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 15:17:40 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Tue, 18 Oct 2022 15:17:39 +0000
Received: from a7e7e8fd1376.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 79A1230C-79F0-4EF9-9600-B84614FE2355.1; 
 Tue, 18 Oct 2022 15:17:29 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7e7e8fd1376.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Oct 2022 15:17:29 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM8PR08MB6514.eurprd08.prod.outlook.com (2603:10a6:20b:36b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 18 Oct
 2022 15:17:26 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 15:17:26 +0000
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
X-Inumbo-ID: 03d7e813-4ef8-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aI6xRDzD1Wahfjl1EAK9xFk4uSZMwxClJho6bhrQNiRBSKqChuMOUwxOCCrpf0I+BRPOn9kHTLPJ90646plOm7anQCceVjmJCJOl2KpGXbTQ7+1I3Z8K51haNbrRch79yR21zNGnvG9wW89FYKDCGKh3Mm0X5T66JojC+KLZVDA1tpnM8VVU2yKo3ZMgdfINNvtKicykPov+keemWzbLDw6xO1zikUVJ6P4mHq/uFM4Jfy9gb5ijbfE84cqodyYHm9xMILZpO3TCV1oYEr8cYc4vMIZGXk9lowuUU0EsoDligkwRCSZLHpi1RU8Q5o5Y8wWt3MU1EY0Duv2HLWfaUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ghlzpktg46hCF/5KCmkbb768aLnMPNkKW7sL6+jCLY=;
 b=l6CIhLmc3es3PHJ9zkCRSB1/5XdLvYNcxkVP48y/zoKnPV56O2iiGg2tfMRj78LsUId+fnxPNmAnf9JCS0iRebqmIe/8/Ir0Zo47KWBn+vmc9ggsn4yVK3MOa9Hiix3r3Ewax0BhXdVg3LVA7HUM5vFboUXkljpnytBzYlt5LGTm60i4oJeO+eNL8FAusOFKcxrCa//9kY5set5H8GsozqlhP8L2jeA9Yc3j2tbEtPCRKCLvFSdl5k1aA/+4KjPXmFZpFEVRPm9lo56k70PiyoCA53JQmGLz1Ay9eNuCXtCsmg8Ht0C34E5wKK1e+BsLlx3E3Q1A/AuwPb3xi6Gesw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ghlzpktg46hCF/5KCmkbb768aLnMPNkKW7sL6+jCLY=;
 b=qbO0xTcRhVCBu5/dKH0mtTjHYSw6L5iNep2+EC5JC2BrmIZhdURAgOKwRUu37FRqev+Rj+qA9j/63Ah2SzERF6ksAgbWv39oeaMdYo4fQrHQzNn73jvCn8YPKggDiWlOA5TueEGse9zvWwEitFDAKzRadAtsBBRRFLLCsNdsajo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6cee83c84770fa8c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XViCx/ecZJ1XseowFrBUzUKris7o4AWx5XG3sbSvRb/oObzC/Rn8+Xi5uJCpaW6hzmd4X0LTQLuCSHHN8/iYrY/mlC0VcRZTLobAQGj436EVuu6X5xDrhck2CMBQyEbWYCIltx7uceSu1wHjJeLzIVRsFyGG57+2cmURn/newvcvNYAzFTxXmkM6wzTwKAZD/rXGnSQRhvO/OK8ZOsR5PXrJimFeMvPg6eydfHU6rpYoxosRtBpOwuawO33eACGypdJhi8ljRm+hZZAcfsDoU0yBgf19x4lLDU0RbbxKGDD5ucc92jtYnrOO//Ev1auL5VIy4PFj5RadcKeiiWhgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ghlzpktg46hCF/5KCmkbb768aLnMPNkKW7sL6+jCLY=;
 b=fV9V9e8OnfhmoOA29AE4z62yck/YXQ6aooQ8zy1LPwjj1r5DbEupe5fGJ7eFMt7MlpLvHfk8++W+WjtV7c9AHvp9S4qxPPcvF/vTALab63hbnU6gQ1oope5Vity95LutlEDhPcNU3YCnPddFRK981SlO0CF/fuhfbZ9Us20DAvseXQeV1AkLKlc7QvwqD5wiChaaR49Tf3cIqrI+i1Y7OXm3mwzoR8F8r2S5GbkwW8wpYsNz+l4U/05A+P+Icu+zRpfB2o8o/f2nwyf1EpqHtQy+jqrin2eQsKgaonxNGG0Ce3+f6lEho8YLfhfzQrzzo2TPdny7nuZPE82zlF4q2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ghlzpktg46hCF/5KCmkbb768aLnMPNkKW7sL6+jCLY=;
 b=qbO0xTcRhVCBu5/dKH0mtTjHYSw6L5iNep2+EC5JC2BrmIZhdURAgOKwRUu37FRqev+Rj+qA9j/63Ah2SzERF6ksAgbWv39oeaMdYo4fQrHQzNn73jvCn8YPKggDiWlOA5TueEGse9zvWwEitFDAKzRadAtsBBRRFLLCsNdsajo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Proposal for deviations in static analyser findings
Thread-Topic: Proposal for deviations in static analyser findings
Thread-Index: AQHY3lPHTZwvWtdyCU+0K6Hw9nMyM64L9DeAgAAneoCAABdHAIAIGdUA
Date: Tue, 18 Oct 2022 15:17:26 +0000
Message-ID: <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
 <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
In-Reply-To: <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AM8PR08MB6514:EE_|DBAEUR03FT011:EE_|DB9PR08MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf6bdaa-046e-4bc2-6ea9-08dab11be59c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZSd/Sdj/tIQmhqv4CqzbK6dMbBDsZZ0n7dUFZchQZdPW8m0SyO+FWHncyDSTVK540NxyAWSdmgT4qDhh8ACovmqZzL73+/lry0Uy4J4eVp/Q4YkBVHe7LdehK6KS7PqJzmh9r/JbO6npD1U1aQIHbojyDPoDxxjCTWAAIrhNDl/Cmh9n2CK5IQ67ZkwbfH2JwRpA3GphO77p3UZ8FPvcYQCZcLNhf9cj4QRJ7vq00Blfl+WSsrvdV6Jq618EssWCNrwj3eOihrOIk0mJ47sb8HwuSrmQlK+1nJe0NIGq4ZlKqy/fVjFqvCKWFB6pE3sdVCZI06ujB1/o7KApQLDPWMNTVGK2rwn1LIESZdfyowp+LclH592bQ735JY8VazyJCy1PwBQpw7D3ZORXVcbMZAEAv4Ig+HXW12p2rcpoF2BzuwVSq8uzCNmgfWYKFLJo4NDGukiPcdqul0CYc1iHhIjHVKSoObdZsaerD2pRQN9keW7OFV6FLKurTOEZIshxNCyahnmqdpRB9iSI4KCMbCKxb7XQizhWFysYBk/zcaPLBopJCGQUtfAjzGkr9VI603hdyoNQY8l8J9Pgiocf5aLwgA5ZHtYvXCMlikIXBsbOihEZgZ7t/BiMSeD5dv+8K6xPv5z3O8VpJrwUiNpT/0tBcOsuf7qTzNE9pQYRbdqSQfsRImyXt0KXg0vTStlmZ5bbD1BItbK7YGGfMT025cLzngezRrgPb3Uoy+rFikztpTMRKwhPrfAnChEo0cxfgZV1Z0vFemkUGRfUqlo6aXxm2WkB1ihHE6kfGOUf9AWQ2aUOskn+FJE/u/plywSUeaAMzk8SISOjFBUFA7Ag2A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199015)(186003)(2616005)(2906002)(6506007)(26005)(54906003)(5660300002)(53546011)(316002)(6916009)(6512007)(86362001)(38100700002)(41300700001)(66446008)(64756008)(8676002)(66476007)(33656002)(91956017)(76116006)(66556008)(66946007)(30864003)(83380400001)(122000001)(4326008)(966005)(8936002)(38070700005)(478600001)(36756003)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F40FEFAC34BA16479618CB8FB5D2B7DC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6514
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	647e5766-0b61-4079-7cd7-08dab11bddb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6m+SbglRLebYnL1C4PfwWwz4eQklx7FidCu+ANCq0gy+dTlGpQ8+lyP/KeDfg5tLK2JCuZbPZp5P3A36DtAAdszyzjzacfDSYFBty/szobs58Wg2V/dfUdUcAY9a6QHr5Hih0hEd1tw4ojwIr9k3l5L6rtXEy2m961I5i4u6QxySi9U390GDF/oUJU+n0RaPAKrfZhw5CSQQpMfuC9/xePkVwGiPbcC0Z4wk+4ysRxKzqM9hthLJ8lDwoHZ6TGr6zXqYPYusSzON0UmpJ6BCT4tX/my7Vs9+Lyg/LKj9eaRRHWnsKtnqCQOi267ONZdCBF+ECdpmd6JrqdNYTMttHRqsPPSbg4MSjBIQ6N984pyYrgp8eo8WI47PfkLQ30xnvjjIPvoLNpX8fTGVv47gG4hB2o6m8V1Yv31UZdWJN8KIr7glX7Ab1RpOO1sbHvxfVRNH4Swbl3BSgFBeGUJ9gm6pzPbDN1N3KGsOZw1iTO39iHkXbfFb9IfEME/Z+hBwIe8zC2O3rTmuw/otQXBoS0bh5CCV2JswFbsRdyeh9A9R2qHHAQbllwK+yge4M/+cdU8rnUzr8imLUYF9rF5uC9oQrtP8vmz2MBVTyI7VdA0Oe3cGeiWmJupSgR/djj5hwcCQ84V9CDxLVWIxnEV+amxXj/QSPZoRGMfjKjoiiRXOHmeO9tcA9XV/YxM8IGm9ZS72C5gohnUz/OmpMJr0btUY2bNv1mqoxuOu0uF1CFSSZeNIqPNt7R+oXa9T7+r8k0/57olXitIjf0FrBUAeedLPjjezqCfcUPQZZ6o2ggs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(41300700001)(8936002)(2906002)(6862004)(5660300002)(30864003)(82310400005)(478600001)(316002)(70586007)(70206006)(6486002)(40480700001)(82740400003)(4326008)(8676002)(36756003)(26005)(54906003)(6512007)(6506007)(53546011)(966005)(33656002)(356005)(81166007)(2616005)(86362001)(40460700003)(47076005)(186003)(36860700001)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 15:17:40.0658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf6bdaa-046e-4bc2-6ea9-08dab11be59c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8265

DQoNCj4gT24gMTMgT2N0IDIwMjIsIGF0IDEyOjM0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTMuMTAuMjAyMiAxMjoxMSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAxMyBPY3QgMjAyMiwgYXQgMDg6NTAsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMTIuMTAuMjAyMiAxODowMCwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4gSW4gdGhlIFhlbiBjb2RlYmFzZSwgdGhlc2UgdGFncyB3aWxsIGJlIHVz
ZWQgdG8gZG9jdW1lbnQgYW5kIHN1cHByZXNzIGZpbmRpbmdzOg0KPj4+PiANCj4+Pj4gLSBTQUYt
WC1zYWZlOiBUaGlzIHRhZyBtZWFucyB0aGF0IHRoZSBuZXh0IGxpbmUgb2YgY29kZSBjb250YWlu
cyBhIGZpbmRpbmcsIGJ1dA0KPj4+PiB0aGUgbm9uIGNvbXBsaWFuY2UgdG8gdGhlIGNoZWNrZXIg
aXMgYW5hbHlzZWQgYW5kIGRlbW9uc3RyYXRlZCB0byBiZSBzYWZlLg0KPj4+PiAtIFNBRi1YLWZh
bHNlLXBvc2l0aXZlOiBUaGlzIHRhZyBtZWFucyB0aGF0IHRoZSBuZXh0IGxpbmUgb2YgY29kZSBj
b250YWlucyBhDQo+Pj4+IGZpbmRpbmcsIGJ1dCB0aGUgZmluZGluZyBpcyBhIGJ1ZyBvZiB0aGUg
dG9vbC4NCj4+PiANCj4+PiBXZSBkaWQgZGlzY3VzcyB0aGlzOiBGYWxzZSBwb3NpdGl2ZXMgYXJl
IG9mdGVuIHNwZWNpZmljIHRvIGp1c3Qgb25lIG9mIHRoZQ0KPj4+IHRvb2xzIHVzZWQuIEkgdGhp
bmsgdGhpcyB3YW50cyBtZW50aW9uaW5nIGhlcmUsIGluY2x1ZGluZyB0aGUgaW1wbGljYXRpb25z
DQo+Pj4gKGlpcmMgdGhlIHBsYW4gd2FzIHRvIGtlZXAgdGhlIHRhZyBnZW5lcmljIGJ1dCBtYWtl
IHRoZSB0YWJsZSBlbnRyeSBleHByZXNzDQo+Pj4gd2hpY2ggdG9vbCBpdCBpcyB0aGF0IGlzIGFm
ZmVjdGVkKS4NCj4+IA0KPj4gWWVzLCBpbiB0aGUgZGF0YWJhc2UgZm9ybWF0IGJlbG93LCBhIGZh
bHNlIHBvc2l0aXZlIGVudHJ5IHdpbGwgaGF2ZSBpdHMga2V5LXZhbHVlIGl0ZW0NCj4+IGluIHRo
ZSDigJxhbmFseXNlcuKAnSBkaWN0aW9uYXJ5LiBNb3Jlb3ZlciwgYSBmYWxzZSBwb3NpdGl2ZSBl
bnRyeSBjb3VsZCBiZSB3cml0dGVuIGZvcg0KPj4gZXhhbXBsZSBhcyB0aGUgbGluZSBiZWxvdywg
dG8gc3VwcHJlc3MgYSBjcHBjaGVjayBmYWxzZSBwb3NpdGl2ZSBmb3IgTUlTUkEgcnVsZSAyMC43
Og0KPj4gDQo+PiAvKiBTQUYtMC1mYWxzZS1wb3NpdGl2ZSBjcHBjaGVjayBmYWxzZS1wb3NpdGl2
ZSBmb3IgcnVsZSAyMC43ICovDQo+PiANCj4+IENsZWFybHkgdGhpcyBjb21tZW50IHdhbnRzIHRo
ZSBwcm9wZXIgZW50cnkgaW4gZmFsc2UtcG9zaXRpdmUuanNvbiB3aXRoIHRoZSBjb3JyZWN0IGlu
dGVybmFsIElEDQo+PiBmb3IgdGhlIHJ1bGUgMjAuNyBnaXZlbiBieSBjcHBjaGVjaywgdGhhdCBp
cyDigJxtaXNyYS1jMjAxMi0yMC434oCdLCBhbmQgYSBwcm9wZXIganVzdGlmaWNhdGlvbiB0aGF0
DQo+PiBleHBsYWlucyB3aHkgaXTigJlzIGEgYnVnIG9mIHRoZSB0b29sIGFuZCBub3QgYSBub24t
Y29tcGxpYW5jZSBvZiB0aGUgY29kZS4NCj4gDQo+IEFsbCBvZiB5b3VyIHJlc3BvbnNlIGRvZXNu
J3QgcmVhbGx5IHNlZW0gdG8gZml0IG15IHJlcXVlc3Qgb2YgbWFraW5nIG1vcmUNCj4gZXhwbGlj
aXQgdGhhdCBpbiB0aGUgY29tbW9uIGNhc2UgZmFsc2UgcG9zaXRpdmVzIGFyZSBleHBlY3RlZCB0
byBiZSBsaW1pdGVkDQo+IHRvIGp1c3Qgb25lIHRvb2wuIChJbiBmYWN0IEkgd2FzIHdvbmRlcmlu
ZyB3aGV0aGVyLCBvdGhlciB0aGFuIGZvciB0aGUNCj4gInNhZmUiIHRhYmxlLCB0aGVyZSB3b3Vs
ZG4ndCBiZXR0ZXIgYmUgcGVyLXRvb2wgZmFsc2UtcG9zaXRpdmVzIHRhYmxlcy4gTm90DQo+IHRo
ZSBsZWFzdCBiZWNhdXNlIGZhbHNlIHBvc2l0aXZlcyBhcmUgYWxzbyBsaWFibGUgdG8gYmUgdmVy
c2lvbiBkZXBlbmRlbnQsDQo+IHdoaWNoIGN1cnJlbnRseSB5b3UgaGF2ZSBubyB3YXkgdG8gZXhw
cmVzcy4pDQoNClRoZSBmYWxzZS1wb3NpdGl2ZSBmb3JtYXQgbWlnaHQgYmUgZGlmZmVyZW50IGZy
b20gdGhlIHNhZmUgdGFibGUsIGZvciBleGFtcGxlIGFkZGluZyBhIOKAnHZlcnNpb27igJ0gZmll
bGQgdG8NCnRoZSBlbnRyeSAod2hpY2ggaXMgZWFzeSB1c2luZyB0aGUgSlNPTiBmb3JtYXQpLg0K
DQpJdCBzaG91bGRu4oCZdCBiZSBhIHByb2JsZW0gdG8gaGF2ZSBkaWZmZXJlbnQgZmlsZXMgZm9y
IGVhY2ggYW5hbHlzaXMgdG9vbCwgYnV0IHdlIG5lZWQgdG8gcHJvdmlkZSBkaWZmZXJlbnQNCnRh
Z3MgbGlrZSAvKiBTQUYtWC1mYWxzZS1wb3NpdGl2ZS08dG9vbD4gKi8NCg0KQnV0IEkgZG9u4oCZ
dCBleHBlY3QgdG8gaGF2ZSBhIGxvdCBvZiBmYWxzZSBwb3NpdGl2ZSBhcGFydCBmcm9tIGNwcGNo
ZWNrLCBzbyBmb3IgdGhhdCByZWFzb24gSSB3YXMgc3VnZ2VzdGluZw0KanVzdCBvbmUgZmlsZS4N
Cg0KPiANCj4+Pj4gRW50cmllcyBpbiB0aGUgZGF0YWJhc2Ugc2hvdWxkIG5ldmVyIGJlIHJlbW92
ZWQsIGV2ZW4gaWYgdGhleSBhcmUgbm90IHVzZWQNCj4+Pj4gYW55bW9yZSBpbiB0aGUgY29kZSAo
aWYgYSBwYXRjaCBpcyByZW1vdmluZyBvciBtb2RpZnlpbmcgdGhlIGZhdWx0eSBsaW5lKS4NCj4+
Pj4gVGhpcyBpcyB0byBtYWtlIHN1cmUgdGhhdCBudW1iZXJzIGFyZSBub3QgcmV1c2VkIHdoaWNo
IGNvdWxkIGxlYWQgdG8gY29uZmxpY3RzDQo+Pj4+IHdpdGggb2xkIGJyYW5jaGVzIG9yIG1pc2xl
YWRpbmcganVzdGlmaWNhdGlvbnMuDQo+Pj4gDQo+Pj4gQ2FuIHdlIGFkZCBwcm92aXNpb25zIGZv
ciBzaHJpbmtpbmcgc3VjaCBlbnRyaWVzIHRvIGUuZy4ganVzdCB0aGVpciAiaWQiDQo+Pj4gbGlu
ZT8gT3IgaXMgdGhlIGludGVudGlvbiB0byBiZSBhYmxlIHRvIHJlLXVzZSBzdWNoIGFuIGVudHJ5
IGlmIGEgbWF0Y2hpbmcNCj4+PiBpbnN0YW5jZSBhcHBlYXJzIGFnYWluIGxhdGVyPw0KPj4gDQo+
PiBJIHByZWZlciB0byBkb27igJl0IHNocmluayBpdCwgdGhlIG5hbWUgaXRzZWxmIGlzIG5vdCB2
ZXJ5IGxvbmcsIGV2ZW4gdXNpbmcgbWFueSBkaWdpdHMgb2YgdGhlIGluY3JlbWVudGFsDQo+PiBu
dW1iZXIsIGl0IHJlbW92ZXMgYWxzbyB0aGUgZGVwZW5kZW5jeSBvbiB0aGUgZmlsZSBuYW1lLg0K
PiANCj4gTmFtZSBsZW5ndGggaXNuJ3QgcmVsZXZhbnQgaGVyZSwgYW5kIEkgaGF2ZSBubyBpZGVh
IHdoYXQgZGVwZW5kZW5jeSBvbiBhDQo+IGZpbGUgbmFtZSB5b3UncmUgdGhpbmtpbmcgb2YuIE15
IHF1ZXN0aW9uIGlzIGEgc2NhbGFiaWxpdHkgb25lOiBPdmVyIHRpbWUNCj4gdGhlIHRhYmxlIHdp
bGwgZ3JvdyBsYXJnZS4gSWYgYWxsIGVudHJpZXMgcmVtYWluIHRoZXJlIGluIGZ1bGwgZm9yZXZl
ciwNCj4gdGFibGUgc2l6ZSBtYXkgYmVjb21lIHVud2llbGR5Lg0KDQpPayBJIG1pc3VuZGVyc3Rv
b2QgeW91ciBxdWVzdGlvbiwgbm93IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgYXNraW5nLCB3
ZSBjb3VsZCByZW1vdmUgdGhlIGNvbnRlbnQNCm9mIHRoZSDigJxhbmFseXNlcuKAnSBkaWN0aW9u
YXJ5IGZvciBzdXJlLCBiZWNhdXNlIGlmIHRoZXJlIGlzIG5vdCBhbnltb3JlIGEgbGluayB3aXRo
IHRoZSBjdXJyZW50IGNvZGUuDQoNClJlZ2FyZGluZyByZW1vdmluZyB0aGUg4oCcbmFtZeKAnSBh
bmQg4oCcdGV4dOKAnSwgY291bGQgaXQgYmUgdGhhdCBhdCBzb21lIHBvaW50IHdlIGNhbiBpbnRy
b2R1Y2UgaW4gdGhlIGNvZGUNCmEgdmlvbGF0aW9uIHRoYXQgcmVxdWlyZXMgdGhlIHNhbWUganVz
dGlmaWNhdGlvbiBwcm92aWRlZCBieSB0aGUg4oCcb3JwaGFu4oCdIGVudHJ5Pw0KSW4gdGhhdCBj
YXNlIHdlIGNvdWxkIHJldXNlIHRoYXQgZW50cnkgd2l0aG91dCBjcmVhdGluZyBhIG5ldyBvbmUg
dGhhdCB3aWxsIG9ubHkgd2FzdGUgc3BhY2UuDQpXaGF0IGlzIHRoZSBvcGluaW9uIG9uIHRoaXM/
DQoNCj4gDQo+Pj4gVGFraW5nIHRoaXMgZXhhbXBsZSBJIGFsc28gZGFyZSB0byBhc2s6IFNob3Vs
ZG4ndCB0b29scyBiZSBhd2FyZSB0aGF0DQo+Pj4gdG9rZW4gY29uY2F0ZW5hdGlvbiBuZWNlc3Nh
cmlseSBtZWFucyBubyB1c2Ugb2YgcGFyZW50aGVzZXM/IFNlZSBhbHNvDQo+Pj4gYmVsb3cuDQo+
PiANCj4+IFllcyB0aGUgdG9vbCBzaG91bGQgYmUgYXdhcmUsIGluIHRoZSBleGFtcGxlIGJlbG93
LCB0aGUgdG9vbCBpcyBjb21wbGFpbmluZyBqdXN0DQo+PiBmb3IgdGhlIGxpbmVzIDc1IGFuZCA4
MCwgaW4gdGhhdCBwYXJ0aWN1bGFyIGV4YW1wbGUgSSB3b3VsZCBoYXZlIGZpeGVkIHRoZSBmaW5k
aW5nDQo+PiBpbnN0ZWFkIG9mIHVzaW5nIGEganVzdGlmaWNhdGlvbiwgYnV0IEnigJl2ZSByZXBv
cnRlZCB0aGF0IGV4YW1wbGUganVzdCB0byBzaG93IGhvdw0KPj4gdGhlIGZpbmRpbmcgY2FuIGJl
IHN1cHByZXNzZWQuDQo+PiANCj4+IEhlcmUgdGhlIGxpbmsgdG8gZWNsYWlyOiBodHRwczovL2Vj
bGFpcml0LmNvbTozNzg3L2ZzL3Zhci9saWIvamVua2lucy9qb2JzL1hFTi9jb25maWd1cmF0aW9u
cy9heGlzLVRhcmdldC9BUk02NC9heGlzLWFnZW50L3B1YmxpYy9idWlsZHMvNTQxL2FyY2hpdmUv
RUNMQUlSL291dC9QUk9KRUNULmVjZDsvc291cmNlcy94ZW4vaW5jbHVkZS94ZW4vcGFyYW0uaC5o
dG1sI0w3NV92aW9sYXRpb24NCj4+IA0KPj4gVGhlIGNvZGluZyBzdGFuZGFyZCB3YW50cyBqdXN0
IHRvIGhhdmUgdGhpczoNCj4+IA0KPj4gI2RlZmluZSBzdHJpbmdfcGFyYW0oX25hbWUsIF92YXIp
IFwNCj4+IF9fc2V0dXBfc3RyIF9fc2V0dXBfc3RyXyMjX3ZhcltdID0gKF9uYW1lKTsgXA0KPj4g
X19rcGFyYW0gX19zZXR1cF8jI192YXIgPSBcDQo+PiAgICAgeyAubmFtZSA9IF9fc2V0dXBfc3Ry
XyMjX3ZhciwgXA0KPj4gICAgICAgLnR5cGUgPSBPUFRfU1RSLCBcDQo+PiAgICAgICAubGVuID0g
c2l6ZW9mKF92YXIpLCBcDQo+PiAgICAgICAucGFyLnZhciA9ICYoX3ZhcikgfQ0KPiANCj4gTWF5
IEkgc3VnZ2VzdCB0aGF0IHlvdSBwaWNrIGEgcmVhbCBleGFtcGxlIHRoZW4gcmF0aGVyIHRoYW4g
b25lIHdoZXJlIHdlDQo+IGFjdHVhbGx5IHdhbnQgdG8gZml4IHRoZSBjb2RlPyBQZW9wbGUgbWF5
IGRlcml2ZSBtb3JlIHRoYW4ganVzdCB0aGUNCj4gaW50ZW5kZWQgaW5mb3JtYXRpb24gZnJvbSBh
bnkgZXhhbXBsZXMgZ2l2ZW4gaGVyZS4NCg0KWWVzLCBsZXTigJlzIHRha2UgYSB2aW9sYXRpb24g
b2YgdGhlIFJ1bGUgOC42Og0KDQpFY2xhaXIgcmVwb3J0cyBpdCBoZXJlOg0KaHR0cHM6Ly9lY2xh
aXJpdC5jb206Mzc4Ny9mcy92YXIvbGliL2plbmtpbnMvam9icy9YRU4vY29uZmlndXJhdGlvbnMv
YXhpcy1UYXJnZXQvQVJNNjQvYXhpcy1hZ2VudC9wdWJsaWMvYnVpbGRzLzU0OS9hcmNoaXZlL0VD
TEFJUi9vdXQvUFJPSkVDVC5lY2Q7L3NvdXJjZXMveGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oLmh0
bWwjUjUwNzQzXzENCg0KQWxzbyBjb3Zlcml0eSByZXBvcnRzIGl0LCBoZXJlIGFuIGV4dHJhY3Qg
b2YgdGhlIGZpbmRpbmc6DQoNCnhlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaDo2ODoNCiAgMS4gbWlz
cmFfY18yMDEyX3J1bGVfOF82X3Zpb2xhdGlvbjogRnVuY3Rpb24gIl9zdGFydCIgaXMgZGVjbGFy
ZWQgYnV0IG5ldmVyIGRlZmluZWQuDQoNClRoZSBhbmFseXNlcnMgYXJlIGNvbXBsYWluaW5nIGJl
Y2F1c2Ugd2UgaGF2ZSB0aGlzIGluIHhlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaCBhdCBsaW5lIDY4
Og0KDQpleHRlcm4gY2hhciBfc3RhcnRbXSwgX2VuZFtdLCBzdGFydFtdOw0KDQpUaG9zZSBhcmUg
c3ltYm9scyBleHBvcnRlZCBieSB0aGUgbGlua2VyLCBoZW5jZSB3ZSB3aWxsIG5lZWQgdG8gaGF2
ZSBhIHByb3BlciBkZXZpYXRpb24gZm9yIHRoaXMgZmluZGluZy4NCg0KV2Ugd2lsbCBwcmVwYXJl
IG91ciBlbnRyeSBpbiB0aGUgZGF0YWJhc2U6DQoNCnx7DQp8ICAgICJ2ZXJzaW9uIjogIjEuMCIs
DQp8ICAgICJjb250ZW50IjogWw0KfCAgICAgICAgew0KfCAgICAgICAgW+KApl0NCnwgICAgICAg
IH0sDQp8ICAgICAgICB7DQp8ICAgICAgICAgICAgImlkIjrigJ1TQUYtMS1zYWZlIiwNCnwgICAg
ICAgICAgICAiYW5hbHlzZXIiOiB7DQp8ICAgICAgICAgICAgICAgIOKAnGVjbGFpciI6ICJNQzNS
MS5SOC42IiwNCnwgICAgICAgICAgICAgICAgImNvdmVyaXR5IjogIm1pc3JhX2NfMjAxMl9ydWxl
XzhfNl92aW9sYXRpb24iDQp8ICAgICAgICAgICAgfSwNCnwgICAgICAgICAgICAibmFtZSI6IOKA
nFJ1bGUgOC42OiBsaW5rZXIgZGVmaW5lZCBzeW1ib2xzIiwNCnwgICAgICAgICAgICAidGV4dCI6
IOKAnEl0IGlzIHNhZmUgdG8gZGVjbGFyZSB0aGlzIHN5bWJvbCBiZWNhdXNlIGl0IGlzIGRlZmlu
ZWQgaW4gdGhlIGxpbmtlciBzY3JpcHQuIg0KfCAgICAgICAgfSwNCnwgICAgICAgIHsNCnwgICAg
ICAgICAgICAiaWQiOuKAnVNBRi0yLXNhZmUiLA0KfCAgICAgICAgICAgICJhbmFseXNlciI6IHt9
LA0KfCAgICAgICAgICAgICJuYW1lIjogIlNlbnRpbmVsIiwNCnwgICAgICAgICAgICAidGV4dCI6
ICIiDQp8ICAgICAgICB9DQp8ICAgIF0NCnx9DQoNCkFuZCB3ZSB3aWxsIHVzZSB0aGUgcHJvcGVy
IHRhZyBhYm92ZSB0aGUgdmlvbGF0aW9uIGxpbmU6DQoNCi8qIFNBRi0xLXNhZmUgW29wdGlvbmFs
IHRleHRdICovDQpleHRlcm4gY2hhciBfc3RhcnRbXSwgX2VuZFtdLCBzdGFydFtdOw0KDQpUaGlz
IGVudHJ5IHdpbGwgZml4IGFsc28gdGhlIHZpb2xhdGlvbiBvbiBfZW5kIGFuZCBzdGFydCwgYmVj
YXVzZSB0aGV5IGFyZSBvbiB0aGUgc2FtZSBsaW5lIGFuZCB0aGUNCnNhbWUg4oCcdmlvbGF0aW9u
IElE4oCdLg0KDQpBbHNvLCB0aGUgc2FtZSB0YWcgY2FuIGJlIHVzZWQgb24gb3RoZXIgc3ltYm9s
cyBmcm9tIHRoZSBsaW5rZXIgdGhhdCBhcmUgZGVjbGFyZWQgaW4gdGhlIGNvZGViYXNlLA0KYmVj
YXVzZSB0aGUganVzdGlmaWNhdGlvbiBob2xkcyBmb3IgdGhlbSB0b28uDQoNCj4gDQo+Pj4+IEhl
cmUgYSBicmllZiBleHBsYW5hdGlvbiBvZiB0aGUgZmllbGQgaW5zaWRlIGFuIG9iamVjdCBvZiB0
aGUgImNvbnRlbnQiIGFycmF5Og0KPj4+PiAtIGlkOiBpdCBpcyBhIHVuaXF1ZSBzdHJpbmcgdGhh
dCBpcyB1c2VkIHRvIHJlZmVyIHRvIHRoZSBmaW5kaW5nLCBtYW55IGZpbmRpbmcNCj4+Pj4gY2Fu
IGJlIHRhZ2dlZCB3aXRoIHRoZSBzYW1lIGlkLCBpZiB0aGUganVzdGlmaWNhdGlvbiBob2xkcyBm
b3IgYW55IGFwcGxpZWQNCj4+Pj4gY2FzZS4NCj4+Pj4gSXQgdGVsbHMgdGhlIHRvb2wgdG8gc3Vi
c3RpdHV0ZSBhIFhlbiBpbi1jb2RlIGNvbW1lbnQgaGF2aW5nIHRoaXMgc3RydWN0dXJlOg0KPj4+
PiAvKiBTQUYtMC1zYWZlIFsuLi5dIFwqLw0KPj4+PiAtIGFuYWx5c2VyOiBpdCBpcyBhbiBvYmpl
Y3QgY29udGFpbmluZyBwYWlyIG9mIGtleS12YWx1ZSBzdHJpbmdzLCB0aGUga2V5IGlzDQo+Pj4+
IHRoZSBhbmFseXNlciwgc28gaXQgY2FuIGJlIGNwcGNoZWNrLCBjb3Zlcml0eSBvciBlY2xhaXIu
IFRoZSB2YWx1ZSBpcyB0aGUNCj4+Pj4gcHJvcHJpZXRhcnkgaWQgY29ycmVzcG9uZGluZyBvbiB0
aGUgZmluZGluZywgZm9yIGV4YW1wbGUgd2hlbiBjb3Zlcml0eSBpcw0KPj4+PiB1c2VkIGFzIGFu
YWx5c2VyLCB0aGUgdG9vbCB3aWxsIHRyYW5zbGF0ZSB0aGUgWGVuIGluLWNvZGUgY29tZW50IGlu
IHRoaXMgd2F5Og0KPj4+PiAvKiBTQUYtMC1zYWZlIFsuLi5dIFwqLyAtPiAvKiBjb3Zlcml0eVtj
b3Zlcml0eS1pZF0gXCovDQo+Pj4gDQo+Pj4gSW4gaGVyZSwgd2hlcmUgd291bGQgY292ZXJpdHkt
aWQgY29tZSBmcm9tPyBBbmQgaG93IGRvZXMgdGhlIHRyYW5zZm9ybWF0aW9uDQo+Pj4gaGVyZSBt
YXRjaCB1cCB3aXRoIHRoZSB2YWx1ZSBvZiB0aGUgImNvdmVyaXR5IjogZmllbGQgaW4gdGhlIHRh
YmxlPw0KPj4gDQo+PiBJIGNhbiBwdXQgYW4gZXhhbXBsZSBvZiB0aGF0LCBhcyB5b3UgcG9pbnRl
ZCBvdXQgaXQgY291bGQgYmUgZGlmZmljdWx0IHRvIGdldCB3aGVyZQ0KPj4gdGhpcyBwcm9wcmll
dGFyeSB0b29sIElEIGNvbWVzIGZyb20uDQo+PiANCj4+IFRoZSBwcm9wcmlldGFyeSBJRCAoQ292
ZXJpdHkgaW4gdGhpcyBjYXNlKSBjb21lcyBmcm9tIHRoZSByZXBvcnQgaXQgcHJvZHVjZXM6DQo+
PiANCj4+IFvigKZdDQo+PiA8ZmlsZSBwYXRoPjo8bGluZSBudW1iZXI+Og0KPj4gIDEuIHByb3By
aWV0YXJ5X0lEOiBb4oCmXQ0KPj4gW+KApl0NCj4+IA0KPj4gYWZ0ZXIgd2Ugc2VlIHRoZSBmaW5k
aW5nLCB3ZSB0YWtlIHRoYXQgSUQsIHdlIHB1dCBpdCBpbiB0aGUg4oCcYW5hbHlzZXLigJ0gZGlj
dGlvbmFyeSBhczoNCj4+IA0KPj4gW+KApl0NCj4+ICJpZCI64oCdU0FGLTItc2FmZSIsDQo+PiDi
gJxhbmFseXNlcuKAnTogew0KPj4gCeKAnGNvdmVyaXR54oCdOiDigJxwcm9wcmlldGFyeV9JRCIN
Cj4+IH0sDQo+PiBb4oCmXQ0KPj4gDQo+PiBTbyBpbiB0aGUgc291cmNlIGNvZGUgd2Ugd2lsbCBo
YXZlOg0KPj4gDQo+PiAvKiBTQUYtMi1zYWZlIFtvcHRpb25hbCB0ZXh0XSAqLw0KPj4gQyBjb2Rl
IGFmZmVjdGVkIGxpbmU7DQo+PiANCj4+IEFuZCB3aGVuIHRoZSBhbmFseXNpcyB3aWxsIGJlIHBl
cmZvcm1lZCwgdGhlIHRvb2wgKGNvdmVyaXR5IGZvciBleGFtcGxlKSB3aWxsIHJ1biBvbiB0aGlz
IHNvdXJjZSBjb2RlOg0KPj4gDQo+PiAvKiBjb3Zlcml0eVtwcm9wcmlldGFyeV9JRF0gKi8NCj4+
IEMgY29kZSBhZmZlY3RlZCBsaW5lOw0KPj4gDQo+PiBUaGUgdG9vbCB3aWxsIHdyaXRlIGEgcmVw
b3J0IGFuZCB3aWxsIHN1cHByZXNzIHRoZSBmaW5kaW5nIHdpdGgg4oCccHJvcHJpZXRhcnlfSUTi
gJ0gdGhhdCBjb21lcyBpbiB0aGUgQyBjb2RlDQo+PiBsaW5lIGFmdGVyIHRoZSBjb21tZW50Lg0K
PiANCj4gTGV0IG1lIGFkZCBzb21lIGJhY2tncm91bmQgdG8gbXkgZWFybGllciBjb21tZW50Og0K
PiANCj4gSWYgd2Ugd2FudGVkIHRvIGFkZCBzdWNoIElEcyB0byB0aGUgdGFibGUsIHRoZW4gSSBn
dWVzcyB0aGlzIHdvdWxkIHJlc3VsdCBpbg0KPiBhIHByb2xpZmVyYXRpb24gb2YgZW50cmllcy4g
SWYgbXkgb2JzZXJ2YXRpb25zIGhhdmVuJ3QgbWlzZ3VpZGVkIG1lLA0KPiBDb3Zlcml0eSBtaWdo
dCByZS11c2UgdGhlIHNhbWUgSUQgZm9yIG11bHRpcGxlIHNpbWlsYXIgbmV3IGlzc3VlcyBmb3Vu
ZCBpbiBhDQo+IHNpbmdsZSBydW4sIGJ1dCBpdCB3b3VsZCBub3QgcmUtdXNlIHRoZW0gYWNyb3Nz
IHJ1bnMuIEhlbmNlIGlycmVzcGVjdGl2ZSBvZg0KPiB0aGVpciBzaW1pbGFyaXR5LCBtdWx0aXBs
ZSB0YWJsZSBlbnRyaWVzIHdvdWxkIGJlIG5lZWRlZCBqdXN0IGJlY2F1c2Ugb2YgdGhlDQo+IGRp
ZmZlcmVudCBDb3Zlcml0eSBJRHMuDQoNCkNvdmVyaXR5IHdpbGwgdXNlIGV2ZXJ5IHJ1biB0aGUg
c2FtZSBpZCBmb3IgdGhlIHNhbWUgY2xhc3Mgb2YgdmlvbGF0aW9uLCBmb3IgZXhhbXBsZQ0KbWlz
cmFfY18yMDEyX3J1bGVfOF82X3Zpb2xhdGlvbiBmb3IgdmlvbGF0aW9uIG9mIHJ1bGUgOC42Lg0K
DQo+IA0KPj4gQWZ0ZXIgdGhlIGFuYWx5c2lzLCB0aGUgc291cmNlIGNvZGUgd2lsbCByZXR1cm4g
YXMgdGhlIG9yaWdpbmFsICh3aXRoIHRoZSBTQUYtKiB0YWcpLg0KPiANCj4gV2hpbGUgeW91IG1l
bnRpb24gc29tZXRoaW5nIHNpbWlsYXIgYWxzbyBhcyBzdGVwIDMgaW4gdGhlIG9yaWdpbmFsIGRv
Y3VtZW50DQo+IG5lYXIgdGhlIHRvcCwgSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgd2hh
dCB0aGlzICJyZXR1cm4gYXMgdGhlIG9yaWdpbmFsIg0KPiBtZWFucy4gSWYgeW91IHdhbnQgdG8g
cnVuIHRoZSB0b29sIG9uIGFuIGFsdGVyZWQgKGNvbW1lbnRzIG1vZGlmaWVkKSBzb3VyY2UNCj4g
dHJlZSwgd2hhdCBJJ2QgZXhwZWN0IHlvdSB0byBkbyBpcyBjbG9uZSB0aGUgc291cmNlcyBpbnRv
IGEgdGhyb3ctYXdheSB0cmVlLA0KPiBtYXNzYWdlIHRoZSBjb21tZW50cywgcnVuIHRoZSB0b29s
LCBhbmQgZGVsZXRlIHRoZSBtYXNzYWdlZCB0cmVlLg0KPj4+PiBpZiB0aGUgb2JqZWN0IGRvZXNu
J3QgaGF2ZSBhIGtleS12YWx1ZSwgdGhlbiB0aGUgY29ycmVzcG9uZGluZyBpbi1jb2RlDQo+Pj4+
IGNvbW1lbnQgd29uJ3QgYmUgdHJhbnNsYXRlZC4NCj4+PiANCj4+PiBJaXJjIGF0IGxlYXN0IENv
dmVyaXR5IGlnbm9yZXMgY2VydGFpbiBpbnN0YW5jZXMgb2Ygd2hhdCBpdCBtaWdodCBjb25zaWRl
cg0KPj4+IHZpb2xhdGlvbnMgKGZhbGwtdGhyb3VnaCBpbiBzd2l0Y2goKSBzdGF0ZW1lbnRzIGlu
IHBhcnRpY3VsYXIpIGluIGNhc2UNCj4+PiBfYW55XyBjb21tZW50IGlzIHByZXNlbnQuIFRoZXJl
Zm9yZSBtYXkgSSBzdWdnZXN0IHRoYXQgc3VjaCBjb21tZW50cyBiZQ0KPj4+IGRlbGV0ZWQgKHJl
YWxseTogcmVwbGFjZWQgYnkgYSBibGFuayBsaW5lLCB0byBtYWludGFpbiBjb3JyZWN0IGxpbmUN
Cj4+PiBudW1iZXJpbmcpIGlmIHRoZXJlJ3Mgbm8gbWF0Y2hpbmcga2V5LXZhbHVlIHBhaXI/DQo+
PiANCj4+IFllcyB0aGUgbGluZSB3b27igJl0IGJlIGFsdGVyZWQgaWYgdGhlcmUgaXMgbm8gbWF0
Y2guIFRoaXMgdG8gZW5zdXJlIHRoZSBjb3JyZWN0IGxpbmUNCj4+IG51bWJlcmluZyBpcyBub3Qg
YWZmZWN0ZWQuDQo+IA0KPiAid29uJ3QgYmUgYWx0ZXJlZCIgaXMgdGhlIG9wcG9zaXRlIG9mIHdo
YXQgSSd2ZSBiZWVuIGFza2luZyB0byBjb25zaWRlcjoNCj4gT2JzZXJ2aW5nIHRoYXQgY29tbWVu
dHMgX3JlZ2FyZGxlc3NfIG9mIHRoZWlyIGNvbnRlbnRzIG1heSBzaWxlbmNlIGZpbmRpbmdzLA0K
PiB0aGUgc3VnZ2VzdGlvbiBpcyB0byByZW1vdmUgY29tbWVudHMgKGxlYXZpbmcgYSBibGFuayBs
aW5lKSB3aGVuIHRoZXJlJ3Mgbm8NCj4gZW50cnkgZm9yIHRoZSB0YXJnZXRlZCB0b29sIGluIHRo
ZSB0YWJsZSBlbnRyeS4NCg0KV2h5PyBUaGUgdGFnIGNvbW1lbnQgd29u4oCZdCBkbyBhbnl0aGlu
ZywgaXQgd291bGQgYWN0IGFzIGEgYmxhbmsgbGluZSBmcm9tIHRoZSBhbmFseXNlcg0KcGVyc3Bl
Y3RpdmUuDQoNCj4gDQo+Pj4+IC0gbmFtZTogYSBzaW1wbGUgbmFtZSBmb3IgdGhlIGZpbmRpbmcN
Cj4+Pj4gLSB0ZXh0OiBhIHByb3BlciBqdXN0aWZpY2F0aW9uIHRvIHR1cm4gb2ZmIHRoZSBmaW5k
aW5nLg0KPj4+IA0KPj4+IFRoZSBkaXN0aW5jdGlvbiBiZXR3ZWVuIHRoZSBsYXN0IHR3byBkb2Vz
bid0IHJlYWxseSBiZWNvbWUgY2xlYXIuIFRha2luZw0KPj4+IHlvdXIg4oCcVmFyaWFibGUgc2V0
IGJ1dCBub3QgdXNlZCIgZXhhbXBsZSBhYm92ZTogU3VjaCBhICJuYW1lIiB3aWxsIGZpdA0KPj4+
IG1hbnkgY2FzZXMsIHlldCB0aGUganVzdGlmaWNhdGlvbiBmb3IgZWFjaCBtaWdodCBiZSBkaWZm
ZXJlbnQuIEhlbmNlDQo+Pj4gdGhlIHF1ZXN0aW9uIGlzIGhvdyB1bmlxdWUgIm5hbWUiIHNob3Vs
ZCBiZSBhbmQgLSBpZiBpdCBkb2Vzbid0IG5lZWQgdG8NCj4+PiBiZSB1bmlxdWUgLSB3aGF0IGlu
Zm9ybWF0aW9uIGl0IGlzIGludGVuZGVkIHRvIGNvbnZleS4NCj4+IA0KPj4gTmFtZSBpcyBub3Qg
ZW5mb3JjZWQgdG8gYmUgdW5pcXVlLCBpdOKAmXMgY29udmVuaWVudCB0byBnZXQgYSBzdWJqZWN0
IGZvciB0aGUgcGFydGljdWxhciBqdXN0aWZpY2F0aW9uLg0KPj4gSWYgdGhlIG5hbWUgb2YgdHdv
IGp1c3RpZmljYXRpb24gaXMgdGhlIHNhbWUsIGJ1dCB0aGUganVzdGlmaWNhdGlvbiBpcyBkaWZm
ZXJlbnQsIHRoZW4gaXQgd29u4oCZdCByZXF1aXJlDQo+PiBtdWNoIGVmZm9ydCB0byB3cml0ZSBh
IGRpZmZlcmVudCBuYW1lIHRvIHF1aWNrbHkgcmVjYWxsIGFuZCBkaWZmZXJlbnRpYXRlIHRoZSBv
bmUgZnJvbSB0aGUgb3RoZXIuDQo+PiANCj4+IEhvd2V2ZXIgaWYgbm8gb25lIGZpbmRzIHRoZSDi
gJxuYW1l4oCdIGZpZWxkIG5lY2Vzc2FyeSwgd2UgY2FuIHJlbW92ZSBpdC4gSXQgd2FzIGludHJv
ZHVjZWQgaGF2aW5nDQo+PiBJbiBtaW5kIHRoYXQgYXQgc29tZSBwb2ludCBhIGRvY3VtZW50IHdp
bGwgYmUgY3JlYXRlZCB3aXRoIGFsbCB0aGUganVzdGlmaWNhdGlvbnMgdG9nZXRoZXIuDQo+PiAN
Cj4+IElmIG90aGVycyBhcmUgYWdhaW5zdCBpdCBqdXN0IHJlcGx5IHRvIHRoYXQuDQo+IA0KPiBJ
IGNhbid0IHNheSB3aGV0aGVyIEknbSBwcm8gb3IgY29uIGFzIGxvbmcgYXMgaXQncyBub3QgcmVh
bGx5IGNsZWFyIHdoYXQNCj4gaW5mb3JtYXRpb24gaXMgdG8gYmUgY29udmV5ZWQgYnkgYm90aC4g
SWYgIm5hbWUiIGlzIHNvbWV3aGF0IGxpa2UgdGhlDQo+IHN1YmplY3Qgb2YgYW4gZW1haWwgYW5k
IGlkZW50aWNhbCBuYW1lcyBhcmUgZGVlbWVkIGZpbmUsIHRoZW4gc28gYmUgaXQuDQo+IFF1ZXN0
aW9uIHRob3VnaCBpcyB3aGV0aGVyIGhhdmluZyBwZXJoYXBzIGRvemVucyAob3IgaHVuZHJlZHMp
IG9mDQo+IGlkZW50aWNhbGx5IG5hbWVkIGVudHJpZXMgaXMgdmVyeSB1c2VmdWwuDQoNCk9rLCBs
ZXTigJlzIHdhaXQgZm9yIG1vcmUgZmVlZGJhY2tzIG9uIHRoaXMuDQoNCj4gDQo+Pj4+IEhlcmUg
YW4gZXhhbXBsZSBvZiB0aGUgdXNhZ2Ugb2YgdGhlIGluLWNvZGUgY29tbWVudCB0YWdzOg0KPj4+
PiANCj4+Pj4gLyogU0FGLTAtc2FmZSBbZXZlbnR1YWwgZGV2ZWxvcGVyIG1lc3NhZ2UgdGhhdCBz
aGFsbCBub3QgZXhjZWVkcyBsaW5lIGNoYXIgbWF4IGNvdW50LCBkb27igJl0IGJyZWFrIHRoZSBs
aW5lIV0gKi8NCj4+Pj4gI2RlZmluZSBzdHJpbmdfcGFyYW0oX25hbWUsIF92YXIpIFwNCj4+Pj4g
ICBfX3NldHVwX3N0ciBfX3NldHVwX3N0cl8jI192YXJbXSA9IF9uYW1lOyBcDQo+Pj4+ICAgX19r
cGFyYW0gX19zZXR1cF8jI192YXIgPSBcDQo+Pj4+ICAgICAgIHsgLm5hbWUgPSBfX3NldHVwX3N0
cl8jI192YXIsIFwNCj4+Pj4gICAgICAgICAudHlwZSA9IE9QVF9TVFIsIFwNCj4+Pj4gICAgICAg
ICAubGVuID0gc2l6ZW9mKF92YXIpLCBcDQo+Pj4+ICAgICAgICAgLnBhci52YXIgPSAmX3ZhciB9
DQo+Pj4+IA0KPj4+PiBJbiB0aGUgZXhhbXBsZSBhYm92ZSwgdGhlIHRvb2wgZmluZGluZyBmb3Ig
dGhpcyBtYWNybyBpcyBzdXBwcmVzc2VkLiBXaGVuIHRoZXJlIGFyZSBtdWx0aXBsZSBmaW5kaW5n
cyBmb3INCj4+Pj4gdGhlIHNhbWUgbGluZSwgbXVsdGlwbGUgaW4tY29kZSBjb21tZW50cyBuZWVk
cyB0byBiZSBpbnNlcnRlZCwgZXZlcnkgb25lIG9uIGEgZGlmZmVyZW50IGxpbmUuDQo+Pj4gDQo+
Pj4gU2luY2UgdGhpcyBpcyBhYm91dCBwYXJlbnRoZXNpemF0aW9uLCB3b3VsZA0KPj4+IA0KPj4+
ICNkZWZpbmUgc3RyaW5nX3BhcmFtKF9uYW1lLCBfdmFyKSBcDQo+Pj4gICBfX3NldHVwX3N0ciAo
X19zZXR1cF9zdHJfIyNfdmFyKVtdID0gX25hbWU7IFwNCj4+PiAgIF9fa3BhcmFtIChfX3NldHVw
XyMjX3ZhcikgPSBcDQo+Pj4gICAgICAgeyAubmFtZSA9IChfX3NldHVwX3N0cl8jI192YXIpLCBc
DQo+Pj4gICAgICAgICAudHlwZSA9IE9QVF9TVFIsIFwNCj4+PiAgICAgICAgIC5sZW4gPSBzaXpl
b2YoX3ZhciksIFwNCj4+PiAgICAgICAgIC5wYXIudmFyID0gJihfdmFyKSB9DQo+Pj4gDQo+Pj4g
c2F0aXNmeSB0aGUgdG9vbHM/IEFuZCB3b3VsZG4ndCB3ZSBiZXR0ZXIgbm90IG1hc2sgZGV0ZWN0
aW9uIG9uIHRoaXMNCj4+PiBjb25zdHJ1Y3QgYW55d2F5LCBzaW5jZSB0aGUgbGFzdCBvZiB0aGUg
dXNlcyBvZiAiX3ZhciIgaW5kZWVkIGRvZXMNCj4+PiB2aW9sYXRlIHRoZSBydWxlICh3aXRob3V0
IHBhcmVudGhlc2VzIGFkZGVkKT8NCj4+IA0KPj4gWWVzIHRoaXMgd2FzIGp1c3QgYW4gZXhhbXBs
ZSBvZiBob3cgdG8gc3VwcHJlc3MgYSBmaW5kaW5nLCBpbiB0aGlzIHBhcnRpY3VsYXINCj4+IGNh
c2UsIEkgd291bGQgaGF2ZSBmaXhlZCB0aGUgZXJyb3IgaW5zdGVhZCBvZiBzdXBwcmVzc2luZyBp
dC4NCj4+IFRoZSBjaGFuZ2VzIHRvIGZpeCB0aGUgZmluZGluZyBpcyBhYm92ZS4NCj4+IA0KPj4+
IA0KPj4+IEFzIHRvIHRoZSBwbGFjZW1lbnQgb2YgdGhlIGxhYmVsOiBJdCB3YXMgcmVwZWF0ZWRs
eSBzYWlkIHRoYXQgYW5hbHlzaXMNCj4+PiBvY2N1cnMgb24gcHJlLXByb2Nlc3NlZCBzb3VyY2Vz
LiBJcyBwbGFjaW5nIGEgbGFiZWwgYWhlYWQgb2YgYSBtYWNybw0KPj4+IGRlZmluaXRpb24gdGhl
cmVmb3JlIGdvaW5nIHRvIGhhdmUgYW55IGVmZmVjdCBhdCBhbGw/IFdvdWxkbid0IHRoZSB0aGlu
Zw0KPj4+IHJhdGhlciBuZWVkIHRvIGxvb2sgbGlrZSB0aGlzIChhc3N1bWluZyBhIHByZS1wcm9j
ZXNzaW5nIG1vZGUgaXMgdXNlZA0KPj4+IHdoaWNoIHJldGFpbnMgY29tbWVudHMgYW5kIHJlc3Bl
Y3RzIGxpbmUgc3BsaXRzIGRlc3BpdGUgdGhlIHVzZSBvZiBsaW5lDQo+Pj4gY29udGludWF0aW9u
cyBpbiB0aGUgbWFjcm8gZGVmaW5pdGlvbik6DQo+Pj4gDQo+Pj4gI2RlZmluZSBzdHJpbmdfcGFy
YW0oX25hbWUsIF92YXIpIFwNCj4+PiAgIC8qIFNBRi0wLXNhZmUgLi4uICovIFwNCj4+PiAgIF9f
c2V0dXBfc3RyIF9fc2V0dXBfc3RyXyMjX3ZhcltdID0gX25hbWU7IFwNCj4+PiAgIC8qIFNBRi0w
LXNhZmUgLi4uICovIFwNCj4+PiAgIF9fa3BhcmFtIF9fc2V0dXBfIyNfdmFyID0gXA0KPj4+ICAg
ICAgIC8qIFNBRi0wLXNhZmUgLi4uICovIFwNCj4+PiAgICAgICB7IC5uYW1lID0gX19zZXR1cF9z
dHJfIyNfdmFyLCBcDQo+Pj4gICAgICAgICAudHlwZSA9IE9QVF9TVFIsIFwNCj4+PiAgICAgICAg
IC5sZW4gPSBzaXplb2YoX3ZhciksIFwNCj4+PiAgICAgICAgIC5wYXIudmFyID0gJihfdmFyKSB9
DQo+PiANCj4+IEZyb20gdGhlIGV4cGVyaWVuY2Ugb24gY3BwY2hlY2sgYW5kIGNvdmVyaXR5LCBp
dCBpcyBlbm91Z2ggdG8gcGxhY2UgdGhlDQo+PiBJbi1jb2RlIGNvbW1lbnQgYWJvdmUgdGhlIGZp
cnN0IGxpbmUgb2YgdGhlIG1hY3JvIHRvIHN1cHByZXNzIHRoZSBmaW5kaW5nLg0KPiANCj4gSW50
ZXJlc3RpbmcuIEhvdyBpcyB0aGUgY29tbWVudCB0aGVuIHByb3BhZ2F0ZWQgdG8gYWxsIGV4cGFu
c2lvbnMgb2YgdGhlDQo+IG1hY3JvIChpbiB0aGUgY291cnNlIG9mIHByZS1wcm9jZXNzaW5nKT8N
Cg0KSeKAmW0gYWZyYWlkIHRoYXQgSSBkb27igJl0IGhhdmUgdGhlIGV4YWN0IGFuc3dlciBhcyBp
dCBpcyBpbnRlcm5hbCB0byBldmVyeSB0b29sIEkgZ3Vlc3MuDQpBbGwgSSBrbm93IGlzIGZyb20g
YSB1c2VyIHBlcnNwZWN0aXZlLg0KDQpDaGVlcnMsDQpMdWNhDQoNCj4gDQo+IEphbg0KDQo=

