Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC97AFEB6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608742.947429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQ1M-0003z6-8b; Wed, 27 Sep 2023 08:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608742.947429; Wed, 27 Sep 2023 08:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQ1M-0003wg-5b; Wed, 27 Sep 2023 08:35:48 +0000
Received: by outflank-mailman (input) for mailman id 608742;
 Wed, 27 Sep 2023 08:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzin=FL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qlQ1K-0003wa-0r
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:35:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d86c8f82-5d10-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 10:35:43 +0200 (CEST)
Received: from DU2PR04CA0357.eurprd04.prod.outlook.com (2603:10a6:10:2b4::32)
 by PR3PR08MB5643.eurprd08.prod.outlook.com (2603:10a6:102:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 08:35:40 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::8a) by DU2PR04CA0357.outlook.office365.com
 (2603:10a6:10:2b4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Wed, 27 Sep 2023 08:35:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21 via Frontend Transport; Wed, 27 Sep 2023 08:35:39 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Wed, 27 Sep 2023 08:35:39 +0000
Received: from 33b2da8bef87.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B859A5BE-61B9-4D66-8844-D2FDA0194BA0.1; 
 Wed, 27 Sep 2023 08:35:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 33b2da8bef87.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 08:35:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6321.eurprd08.prod.outlook.com (2603:10a6:20b:366::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 08:35:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 08:35:30 +0000
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
X-Inumbo-ID: d86c8f82-5d10-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86OamnCMVa5pJ00d/xp8aesPGroyMFzkrPYMH5PwLE0=;
 b=qh/XCtzzAzc8xOIywblW4W378UwezmzmlsQsro5gYdXtRMPokVHUnt0ZQ4o5DaTn9noT47UBok1QdDwOaS7F7OBuuQfIB6r4J1BCACO23uik5lgmKRHmqcNVlE2lNR1lxC0qzJk06RNLB7q5E2x47sGYaIY0+vANbju6zIaCc8I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b673784065c41747
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cb3xczLXXaJ2/4V6ADJN7/68ZLKY2ovWdCLmgpWvD/t7mJ7c8tKXGfFfUgEi+X11APAFswTNmOXlG4p6qOwOdfwhihshn8kPGOG0sbf8/Tn4tKZEJwHCGZPfDn4O/iMeXWfpIBeJknDgba5eKGTyrPijwStAqqwOd3MWfKWC2PiigMcJkqvAQKziBOIy2n2sQWCA1Mgf/o8gTZGhdY+7tCUcvT+3lBNKcD2whSTyoH3brxKNwM6gE4iNZ/e77H1BK6VWNzLlvfQVYI7Qkze68LLaCg9Vz/Dp/eV0CwJG3mE4aaA04GX259RECchwn8KrgyAlomB9DcwMPp/qPA0GVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86OamnCMVa5pJ00d/xp8aesPGroyMFzkrPYMH5PwLE0=;
 b=CWghVJYeKrDHflYxj+oIqGFzyO7bWz7r4HH5VgJqLMIbvZoJdmySEC4XCDQ2cRoF41uVEzj1mqYRlfWU7J8coWJznsn0h4DZQ3GXsDnU3jkTaid5u4Uzz2GSTZFvgv98yLQ5bXcP+FB0/EOXvWNia8VZ0EB1rN57v/AabjFXvF8OR6fEvJPsk6vrIwbyDs4DQxeB6bgLsdE5SwPmUL4+38yWQzUrlX48IHuC95SayGYpQbjhK8S/JWdLfuf8Iqrqlk0Jl+TWRDK7HxPIZG9HsRQaG/uzv4wuoC+aJbJqHcLi21pLU9aAJnbl6nriRhSPHnf5vv0NPiVUcoOwxBSKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86OamnCMVa5pJ00d/xp8aesPGroyMFzkrPYMH5PwLE0=;
 b=qh/XCtzzAzc8xOIywblW4W378UwezmzmlsQsro5gYdXtRMPokVHUnt0ZQ4o5DaTn9noT47UBok1QdDwOaS7F7OBuuQfIB6r4J1BCACO23uik5lgmKRHmqcNVlE2lNR1lxC0qzJk06RNLB7q5E2x47sGYaIY0+vANbju6zIaCc8I=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, "julien@xen.org" <julien@xen.org>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Topic: [PATCH v3] docs/misra: add rule 2.1 exceptions
Thread-Index:
 AQHZ4qiwUwH3koR9JUa91LeAyizAArAVxOqAgACZsICAGAuKgIAABdgAgAAClICAAAM2gA==
Date: Wed, 27 Sep 2023 08:35:30 +0000
Message-ID: <971283B6-65BB-4D5F-BB04-E1C8A2AC0826@arm.com>
References: <20230908230318.1719290-1-sstabellini@kernel.org>
 <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
 <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop>
 <156fac1ee8e37cddac95813f72a108e0@bugseng.com>
 <BEAF1369-C1FE-4B81-A0A1-5A4F39426E9E@arm.com>
 <3002e10a-29d9-45f0-c3c2-ef79ec775934@suse.com>
In-Reply-To: <3002e10a-29d9-45f0-c3c2-ef79ec775934@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB6321:EE_|DBAEUR03FT015:EE_|PR3PR08MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ddf8fb-b9b3-4180-2396-08dbbf34baf2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Rwx+b7IXu3iv+EPFfay/UjKTkFSryk2ZWD7K2hbtK+hoyIxRoKu8EcsnnBdIv1IhYXbaKOrut+Tk1vR3GGSYvCFq2krIXuFHCGt+22Fd6k2ec+IFh6g3P0mTgybFTmRomHjY5YtTobfbB4bhkoGcQlm8F4tLUORAg6NZRttMX8qRzXld5Ln0nlk0j2sO/ZHtFIav1TL6tefw07it1eVk3EVnJPXPR8Ynaf8++u9/efGKBFXLhmDYLpDRWlUWEe/fY6OOb5jsvJUJlY8devwbkKJsSG6bnFtgHfPzTvmnkZEl8lB81Uo/6vMJBU5reGbFIzdvKfJQDuayM0rMEMLv12OUG/UThpvufHmQlR3JtYBtDrQ7L5hx2hEYKxQdYjGPW8N8VwD4eipdtztwIer7F47j87OYnJVOeFJ3H/yGhEvfRpHXmprBPJRYO5uJKwy3/vGIrcoRn4ChPaZmrL4q20s35h2vQxWt7TJiLX1A574Vgvc9w6nO/AvwBc9NLIfdRBM2hoKVbhbaJJ9TQBbUqoI/zNl6sUpZQobMFGlB+D0PfEtu3+gvtX5fXhlOfGFtSngPg5zys6Ft5pgif20YJLnG7jow8jMbzM9MpHOo6jgjb9jciX4Yh5I3yEgtZlPl7bGF1huMNnbNMr1VBvlLNA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(2616005)(53546011)(6512007)(38070700005)(122000001)(33656002)(36756003)(86362001)(38100700002)(76116006)(91956017)(110136005)(4744005)(2906002)(7416002)(316002)(54906003)(64756008)(6636002)(66946007)(66556008)(8676002)(66476007)(66446008)(41300700001)(4326008)(8936002)(5660300002)(71200400001)(6506007)(6486002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E8D69CF487A554A9BCC371B737E6EF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6321
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8fd6586-d436-4b93-0358-08dbbf34b547
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2LTh86T8C2Y4Awl6cLtvBxy40BfkwjIRZMd9NkJYHIpoNpOxBqq+O2igSfMmSotGnmCChIN1Gl/+oeukaAch8MzVS8YX8i4beB6h/90wqEgULF85Xf/lwRVB96cEeOUhHy00uTsSx12of3mX/9F/U0q69TLQQ3qFm7XNqTzSZNN4f0Seeg5XZUFDP6C1SL+GauMit8MErYwICByKz5/Lq8TrDEQxUN2SQwjgtpzjeux7F+jr2/lwim3lQ9MUsBBMt573xS6SuqH9wQjw04MeN7d8JOdgjzU/Fh0zMOeYRX1igtqCYr2r/2jCy6MNGM0Hl73ZdwkNkvcNPbjrDI3muDAjUkmeyFvmwUedwN1xTqH/WmYxYNo3bKp6PGaaFYL735t24uUb93lh7pMWN1JB0ZoChAu1MP7LfDmCw4plJid1hk5mcgzR42Tp3kAh1rJs63rHsr/F1FhqVI88fKixs1BUsIR/uGpbMKkPfEYelKlU9VcoIg34F3pZchalwRyZkxLBYvB80Biv+QMbcM4P4+Yh58TrdXXX6KAWt92OvIIq337+oRxuuhJZIMtzjlqzmV45xCyBAXXnzxWi7ZaG8iLIhUycBuYghU+mL5cw4Msqti3F2v1E2M5Ep5+6FzAcWErBdvGs815toS5vEvaBzyZZ6vwP/zAIpvpII/EhwBj07/cxo0UJNtdVNd6gX1T+lO1ax3Puz/nAB0C0hR3Fx82EQgNJXWdA6ifb02Tgl2DMopzrj5fXsAlhMVc8SXFE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(6636002)(316002)(41300700001)(336012)(40480700001)(26005)(2906002)(4744005)(8676002)(5660300002)(478600001)(8936002)(70206006)(110136005)(70586007)(4326008)(54906003)(6486002)(53546011)(6506007)(40460700003)(6512007)(36860700001)(47076005)(2616005)(36756003)(81166007)(33656002)(86362001)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:35:39.8067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ddf8fb-b9b3-4180-2396-08dbbf34baf2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5643

Hi Jan,

> On 27 Sep 2023, at 10:23, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 27.09.2023 10:14, Bertrand Marquis wrote:
>>> On 27 Sep 2023, at 09:53, Nicola Vetrini <nicola.vetrini@bugseng.com> w=
rote:
>>> My opinion is that it's far easier for this to be an eclair configurati=
on (which has the
>>> advantage not to depend on the exact definition of unreachable) and the=
n perhaps a comment
>>> above it explaining the situation.
>>=20
>> I agree here and it is easier to make an overall exception where we list=
 the cases
>> where this is acceptable (ie all flavors of unreacheable) and document t=
hat eclair
>> was configured using "xxxx" to handle this.
>=20
> What about cppcheck then, for example?

Good point we should check if cppcheck or coverity can do such things.
@Luca: any idea ?

Cheers
Bertrand

>=20
> Jan
>=20


