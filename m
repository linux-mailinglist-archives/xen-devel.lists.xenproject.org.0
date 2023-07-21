Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1945C75C6DE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 14:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567512.886651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpEN-0005ib-Qw; Fri, 21 Jul 2023 12:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567512.886651; Fri, 21 Jul 2023 12:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpEN-0005fq-NP; Fri, 21 Jul 2023 12:27:35 +0000
Received: by outflank-mailman (input) for mailman id 567512;
 Fri, 21 Jul 2023 12:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=So7w=DH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qMpEM-0005fk-G3
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 12:27:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f78fb57e-27c1-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 14:27:33 +0200 (CEST)
Received: from DB9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:1db::19)
 by AS2PR08MB8456.eurprd08.prod.outlook.com (2603:10a6:20b:55c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 12:27:30 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::c9) by DB9PR06CA0014.outlook.office365.com
 (2603:10a6:10:1db::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25 via Frontend
 Transport; Fri, 21 Jul 2023 12:27:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Fri, 21 Jul 2023 12:27:30 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Fri, 21 Jul 2023 12:27:30 +0000
Received: from 2dcc4a55ac1e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C203589-AE2F-4FE3-A510-6726FB23B24B.1; 
 Fri, 21 Jul 2023 12:27:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2dcc4a55ac1e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 12:27:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9471.eurprd08.prod.outlook.com (2603:10a6:102:2e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Fri, 21 Jul
 2023 12:27:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:27:19 +0000
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
X-Inumbo-ID: f78fb57e-27c1-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9Zot7rjlz0cVnK4LhEOabZg2vXloiVvRB0vofcpwOI=;
 b=BEk4htsLRE6dtoKMkABFaP+juzott/mwEOdNItzBvQz4fQAGyRmejvbabaqLDVZnFTzlqy8VU6ZCcWNslwWh1artFkJkje5DZvShjKt0ovsGhxbopgTG3P5qdPpAYbh5aAtSBXd6W4WRo+GRYRPuB69a8kh/XNTshblNqcDUE+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1963503cd0537c63
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHXWwO0MGMBCbb9bzVM3W/eyMMvec8rtTFP/L9gFpSUYZHEFjGrSDKt6NEODDpdAzQvIk5DB3MEfJOLODUVlXBcWgAp12RhqA/FYvgFkjw8hhFSXrWVYR5VPj61U3AoIow2oi0VdzZARr94YHcu1LXNnbPVHk8QEJmo/HwgXdPLHOQrOvZY9dMNTtTHvE8uvYAlKrMRrPjTy6kSlTAgIttSEhRdgf7ePbeOssTgWGr4A67MGjfupF/Vj1CxodygmxFpX2vipi6WG+grQ0mp7sDz2IAY6mGWGktI+Du7uhjMPQ3Lu+d+Ec15Ej7+8HpEJHxZeS/aQickFbliGWHJF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9Zot7rjlz0cVnK4LhEOabZg2vXloiVvRB0vofcpwOI=;
 b=KMiI2KfqlFa/sPE8QcdDPbO6OTw4rWrFFXUQOkJrX1E95tu4FLtFAlQYMJI8qSXGPEZSn9sDO/3LFK2/DFdSaK+CYBG84bZ0FbS9w1+pweZuL012SLuGx+ROIVvQt106FuFojNUl2H7xoxSVBIproDGh4LiDHZ+epe+cpJfhvAYQYroMurSn3LWQNIaFzxsHyij9rQyGbOmm/2uo6gLsWcdNxxakcoVoVYsiXb4hwqwpGp5w7vV3IZ6xnXSLivS2A+1ztku1Gs7OmDIc6vSyooPeVuVYYkKfoz39F+7y3M+q4u4TTNDMGY8x0x9fXORGT5JB2EkYTsTNiY9yL1Xlmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9Zot7rjlz0cVnK4LhEOabZg2vXloiVvRB0vofcpwOI=;
 b=BEk4htsLRE6dtoKMkABFaP+juzott/mwEOdNItzBvQz4fQAGyRmejvbabaqLDVZnFTzlqy8VU6ZCcWNslwWh1artFkJkje5DZvShjKt0ovsGhxbopgTG3P5qdPpAYbh5aAtSBXd6W4WRo+GRYRPuB69a8kh/XNTshblNqcDUE+4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Topic: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Index: AQHZu6nFJdPelAC9nE2wzAZF/5qPkK/D6iMAgAACsoCAABzbgIAAHFKA
Date: Fri, 21 Jul 2023 12:27:19 +0000
Message-ID: <C63A942A-AC5D-46CD-81B3-50B6376860E7@arm.com>
References:
 <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
 <cb7b53bc-2440-8619-61ce-39c967b56eb7@suse.com>
 <DFD07AA0-E7E2-400B-8961-A646E5531DF7@arm.com>
 <6b24847c-5cd2-877a-bc72-16bb732e0ca2@suse.com>
In-Reply-To: <6b24847c-5cd2-877a-bc72-16bb732e0ca2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9471:EE_|DBAEUR03FT010:EE_|AS2PR08MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf88495-b56c-480e-85ea-08db89e5da36
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 buVntpmc8AdLRaSQk2b7kMgjJ4TmouF1McPtTzUPP3xPpGJ7yupEe2eJdwbYXKyudf3GZ84zTw4h5IIWCq9Q5d0FcyvBCGQKW17Nl3hwpQoLDLuHBFLe3sGSQYFtP/cQQdg4DC7BFuMhmBF55xbjerd7pEGaN8zViM/LMza/RVSkEVCNy3UliqGLsyKjN05x070aRE4r4dO/qj8VybjZ74sBmrGAM1r439n5nyx5xOEJKnQpsMSUAG7DEFVfHfT8rzRQP0ybI2Slh5PjaVzMx8rI7WqWXY5CRbGnYcXjdFdRVXdEmigtn0Kj8/SnlAarj4qPI5e5lBhxhcZXURliSKIHauInmIOoJjMn/AgDWz31TL0tyAX/tbBExOsmiUGasakYY5ELfI74dQxHuCzH582yvt5lFIxIU6DZ0RhNfHRl2b4NYs5pa1sNLTEajT4j+G/v7nz4f9IOYPLCeYxeDK4JTDxBY/D5vk5GWdIp2Rv6fesNld/c0g/TelOWrxvp8e8Vd66oxRgyVguujivKfx4Mx416ZXfuDmkg/Ox5Hn7s5oXGf2vmisKYK7W4jGNTbrbr4rKkau8G60+HK63DPn+Clmryz6xbJ5J28PdCK608MfavLwZgZHihp+pyAvHIGu3DCauYFCl0ug/AsGqAEl8vPjypkjlMnGegnLFaUl/EzjWAwLDFl2flowcu6PKC
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(71200400001)(478600001)(6512007)(6486002)(91956017)(54906003)(186003)(53546011)(6506007)(2906002)(76116006)(41300700001)(6916009)(4326008)(316002)(66556008)(64756008)(5660300002)(8936002)(8676002)(66446008)(2616005)(38100700002)(66476007)(122000001)(66946007)(33656002)(36756003)(38070700005)(86362001)(83380400001)(76704002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7747BC0EE9DE3D469CC3813D489F669C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9471
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62f91019-8bea-49df-a5d2-08db89e5d3cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W0NY0tlo42m15qiUKX3Xfgoni5bU4Nks3oNetalonG8YkNZMrGrX1qn2WntvE4e7LR6NOgMPB04B/lXbTcz6IxRbN7/3WFBNqpcrQoV9yp6k5uTOlqTvvaQEzQPkjTsf5LSmr8cIQ9R8+nAGPvKBUzswDcztjLes2e5U/WfqFZTU1yGa7G3Uw2P7dGzTGu6IcyCeUn0FCfMoO6FH0GqHxkukaHrmIJWzuwmmVHXsnG4abUgDIRjatEtYRBAtX9epBNHr8MLkUDOQMmeSL0IATnmdn7zc20oGs43E9m6EFufY6g8FUKp2JPdyNgFOLRgvpFBH2XkJifM/GtY0hj/4USZSbpporW/nVIz5Y1wMEMRJsI25tbmquAx7ngbRQA84++k60lioqxzsxbQxn1XtWwSKx4kW/Dg8uDhTHFtAYkecupLK5ris0/6kbEfcmhtkurKjGcjgcV1YegdKuGj5M25JoS+cx762zLlvXMu5jQ7pU7IcQ3ig54/p5MyVd7FWXgfhIYbI83Q5lptBnKXi11pddyihRzqYCQAaF0TubLBdrdlnFjl2PCexhaXPj1ZQxlpKGN0SZMKiGCBxZx9S/w8izlCWXYmEKmTrB07vfJ7+UZaoLplHupsnCLxKbI6ps1sr0Z1dxeC1XSfQOxruE7CmWmaWbhliB5C0PU4ADrahBzUADr0Bv2qP5lJE1cnpfDDZEGBTCvuR/NjI2yWlFJJvpAk8/NlKLrGSMX2G318q1G1pUWMPEpBD24zIW+hmYMWiWkQySQWDhgmpfjaKbQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(40480700001)(41300700001)(5660300002)(33656002)(6862004)(8936002)(8676002)(4326008)(40460700003)(70586007)(54906003)(70206006)(86362001)(316002)(82740400003)(356005)(81166007)(2906002)(186003)(2616005)(36756003)(6486002)(53546011)(336012)(26005)(6506007)(6512007)(47076005)(478600001)(36860700001)(83380400001)(76704002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:27:30.4423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf88495-b56c-480e-85ea-08db89e5da36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8456

Hi Jan,

> On 21 Jul 2023, at 12:45, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 21.07.2023 11:02, Bertrand Marquis wrote:
>>> On 21 Jul 2023, at 10:52, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 21.07.2023 10:02, Bertrand Marquis wrote:
>>>> --- a/xen/arch/arm/tee/Kconfig
>>>> +++ b/xen/arch/arm/tee/Kconfig
>>>> @@ -1,7 +1,17 @@
>>>> +menu "TEE mediators"
>>>> + visible if UNSUPPORTED
>>>=20
>>> With this ...
>>>=20
>>>> +config TEE
>>>> + bool
>>>> + default n
>>>> + help
>>>> +  This option enables generic TEE mediators support. It allows guests
>>>> +  to access real TEE via one of TEE mediators implemented in XEN.
>>>> +
>>>> config OPTEE
>>>> - bool "Enable OP-TEE mediator"
>>>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>>>=20
>>> ... you shouldn't need the "if" here, and ...
>>>=20
>>>> default n
>>>> - depends on TEE
>>>> + select TEE
>>>> help
>>>> Enable the OP-TEE mediator. It allows guests to access
>>>> OP-TEE running on your platform. This requires
>>>> @@ -13,9 +23,13 @@ config FFA
>>>> bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>>>=20
>>> ... you could drop the one here. I think.
>>=20
>> visible if is only for the GUI/ncurse display but the if is required
>> to make sure that a .config file cannot set CONFIG_TEE or
>> CONFIG_FFA if. UNSUPPORTED is not selected.
>=20
> Is what you describe "depends on"? "if" controls merely prompt
> visibility aiui.

So you think that having  CONFIG_FFA without CONFIG_UNSUPPORTED
would be a valid configuration and the if is only here for the gui ?

I tested that with the following procedure:
- use menuconfig, select UNSUPPORTED and FFA
- edit .config and disable UNSUPPORTED but keep FFA
- build
- CONFIG_FFA is removed from .config

Now what puzzles me is that i did the same but removing the if UNSUPPORTED
for TEE and FFA and i have exactly the same behaviour.

So it seems that "if UNSUPPORTED" and visibility all behave in the same way
as depends on which i was not expecting.

So what should i keep or remove here ?

Cheers
Bertrand

>=20
> Jan


