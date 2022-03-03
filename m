Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABBD4CC15A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 16:32:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283462.482477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnRA-0004vW-CU; Thu, 03 Mar 2022 15:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283462.482477; Thu, 03 Mar 2022 15:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnRA-0004tc-9J; Thu, 03 Mar 2022 15:32:16 +0000
Received: by outflank-mailman (input) for mailman id 283462;
 Thu, 03 Mar 2022 15:32:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uwof=TO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nPnR8-0004L9-Hp
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 15:32:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1980bfc8-9b07-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 16:32:14 +0100 (CET)
Received: from AS9PR05CA0038.eurprd05.prod.outlook.com (2603:10a6:20b:489::25)
 by PAXPR08MB7381.eurprd08.prod.outlook.com (2603:10a6:102:22b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:32:11 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::69) by AS9PR05CA0038.outlook.office365.com
 (2603:10a6:20b:489::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 15:32:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 3 Mar 2022 15:32:10 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 03 Mar 2022 15:32:10 +0000
Received: from 7433e747225c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D649CA3C-611F-4A98-8F68-DAADD5677E6A.1; 
 Thu, 03 Mar 2022 15:32:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7433e747225c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Mar 2022 15:32:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB4904.eurprd08.prod.outlook.com (2603:10a6:10:f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Thu, 3 Mar
 2022 15:32:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c84a:82d0:c7fd:fc7c]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c84a:82d0:c7fd:fc7c%7]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 15:32:00 +0000
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
X-Inumbo-ID: 1980bfc8-9b07-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l76gNqxQ+cyuvRF9gid7gNknHabccxBApiAem7IOqA4=;
 b=AgYGqSdTIVIQDpW8i8nrdKwAdOnVTOZRWV7zCt3QJy4DsUJ6CvET+7qTZwfkjtHIFhpj4eoFsX6uG2ZMKIAoIcpH93BYq1g+Pr7+Wxy8zdpVa26ABbawSbgVXn7ICMz5x12pPv+zJUSykH+omw0/201Nzlir3haxHuaXqaITc8s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 92b28d371f2eb621
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7+qzeqN05IbQgXTQNbfDcMbcS5O5mYIKeS11Vh5sZq+N/ZWxkAjCCsyhiowqIGURDl2eDSD6VWL+0ukLJ53ZCz9i0yMTZmaNEEDkJMysFezXvCTLaLmX/K0iu9IAGOjEsEgpaPcPM0wwTrez0pblnwncpx/dpb1XdkpWDgLNUBUXDfsg1iN7QG2QuMd/UB73hRmYzd9zwR+t1TbVH3XqzIts6rbVVpmK9mqIc2XUK94sfVeSQr0pDwCxXZCW4OqPK+zlecZ5M6iG/1RyJniJQlDl45xbqVbOYG5cLAQTgUpjz8/0DouGU3P3got82QelWsi//B5jKjUAgza5qszVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l76gNqxQ+cyuvRF9gid7gNknHabccxBApiAem7IOqA4=;
 b=bvlwuUnhkvMNw3OcSdb+jkfaSrP6glw4Kfrn27A4KYPusu8qGR+AAsrzVUrUt9+mPUwhfpoTGAuvXffeaNIBohaYGD8PE7HnyJ0H7k6dTG1UGqjtkElwvYd45khWnDkksP/DvHgbs1baMCKbIHE4iWb9u4Z+qsvKnBgqzMJCkPJaSOstLy8LGKBylKlQhNRo0Wp2qEN3UTWyBFCmiLuhji6/q4S/auwbzHhr08Hha6Koz6EavhYtyke36ibSNtx6xxPN1CZGm+76rG4ZD/Wu0XZRxhyqNc0NRf9UN0CS+CR0aFYUIqnFGSJFIXfLTE9J4fEvhYtyauIBBVAv7TAMtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l76gNqxQ+cyuvRF9gid7gNknHabccxBApiAem7IOqA4=;
 b=AgYGqSdTIVIQDpW8i8nrdKwAdOnVTOZRWV7zCt3QJy4DsUJ6CvET+7qTZwfkjtHIFhpj4eoFsX6uG2ZMKIAoIcpH93BYq1g+Pr7+Wxy8zdpVa26ABbawSbgVXn7ICMz5x12pPv+zJUSykH+omw0/201Nzlir3haxHuaXqaITc8s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: export potentially overridden tool chain
 components
Thread-Topic: [PATCH] build: export potentially overridden tool chain
 components
Thread-Index: AQHYLL39jNFocJHI00Sb4SF85xOtp6ytzimA
Date: Thu, 3 Mar 2022 15:32:00 +0000
Message-ID: <A821D7FD-F434-4BAE-AA3B-80E683E22727@arm.com>
References: <ff363631-bf5c-83a8-ccc4-15ddd1eb1d3c@suse.com>
In-Reply-To: <ff363631-bf5c-83a8-ccc4-15ddd1eb1d3c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3f0315ef-5e8e-4331-9a34-08d9fd2afc14
x-ms-traffictypediagnostic:
	DBBPR08MB4904:EE_|AM5EUR03FT057:EE_|PAXPR08MB7381:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB73815D15375804C12B0010449D049@PAXPR08MB7381.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CQqdCLb+MZ/dacRDuAIqg7oOiDQVAxed+1vVQZbkI+1bnTllXw5rzmSyN3RiHNU3rFLdZG5RtL0yiS4kqTalLO9sdNQD5zcclH9fDSobXLD1vyQIhHu5Nw7BxtqovglVB87WSJl4IFk+DEXYZdX8QPmqtHYD+oecrvLzhdZLveMQES5zYemy0V+0bPU+Z0+ENxkzrGYxKkNCRkY84JLWRzuXQqcNMsI8XhqPv1zoMGbNCrjLx0MVeRYdEnophWuC+AKCewhCosBDRoeFq0d6cCcV5esxw4vFRYyZ65G2laDQ7xklOu/GDBLfBVrIUaTp5j98Ll3H7fCNUBq01SuhujRufjx9Usxsa1RDLIc2kl+TSAO6klZtdlDAg7u2apxiIKP9PbO59jFgIsjdw24OcgrWL98Xyv4cr9f2e5EHQ9d6HRmXAwKC0x/lkxLKKLxA2gnc7MF63o2nSmgIUmQUcV7/TimMkHFjqXWOiJus0AsSTlwahTiE2yW9DcbShHhXTFPHa4PUVSoIqFy9y0MuaP2WNQ7txB2lCQ8EXYkjocOPUsQqdi5wzmZNHAuvA5/v6+M4uu+KXjMpPNRq37uXcpu4h0YSVnz2QeQGtgnoIknlAmXf2gT2YZdzE3mhrymZbJ199KoAK2cTLLHaw9475hWVoA63ffGM+R0PjhSw1k0Rjk8pN2RsnOtrHzWCfZDS9d/U5RazvoUvXi1U7nGnMgKDZQCu2YLfkj/hBgUtQ0M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(38100700002)(2616005)(4744005)(6506007)(53546011)(2906002)(86362001)(6512007)(83380400001)(4326008)(316002)(8676002)(91956017)(66476007)(66446008)(66556008)(64756008)(122000001)(66946007)(76116006)(54906003)(5660300002)(186003)(26005)(8936002)(6916009)(508600001)(33656002)(36756003)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E4CD9A6BC8BCB469671635A3F809FAF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ba545d1-aa68-4aab-d566-08d9fd2af5c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4jmqvZhFSknatZMVV6f8LxyImFAVmUUSJqcwrAK3WWtBwkybacEedk8mSoUJwdDW6cZnAJE/1yNfVWFAm6eiLqqN7oRAIXDHxWGGsWpfVVcNfiQLxrqbVJxw/T2cOeqnk0qYMKdlPuu3yi1fnTeLXL/V4q36nmB3WjuiI9MoY37P+egUg8qnYQgct/m4d1h9j23z05azKNe2QJONpgWzYry9CZ81k07kLRY8xP+OVmG/O5BL4XtPY/UrhNwLBaQ4YdlmfC7DIakzBknsqP8R6x9/DFTLblRSlHor3QD+xLa5eJxIrxQ4LsKZqWcb3DdPG/R/QlnRHJ1up+K02tlVPP8pR3hVlKusmaOgUJY4sq7825ZaDqddmQ71uhZLkBjnosR/7gc05pndABtGTZzoDTr7B5C9xPNJ3Q0Q481DM9oL015OlebKS6iy2f/kjBqi9xw8oJDcASIRiBnCzKyIinDkf9mBC7efPpIJ3F9JkGX5iGUHIR5Oo7ug0GxenGBcO9isGn9Kp81/HEcz65JBMC970OVtK5vDp7WpZ4Q0JHHg/Ko2gY7SL3HEHRF/xLEfdcQ69LDZNACjWsZpJlHOfIcO9k04V0ZxoNWb3Fvj1KsDGxXDLP3txhHM7ggfqDm5lUhDrIROBZh/xTzAf6oHnvFX0m7JqSzmMhp8xlevCWvUJs+66LuqPHZL6rHH80SF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(508600001)(86362001)(8676002)(6506007)(70586007)(70206006)(2616005)(81166007)(316002)(356005)(6486002)(54906003)(36756003)(336012)(26005)(36860700001)(186003)(6512007)(53546011)(82310400004)(2906002)(40460700003)(33656002)(5660300002)(8936002)(47076005)(83380400001)(6862004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:32:10.8829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0315ef-5e8e-4331-9a34-08d9fd2afc14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7381

Hi Jan,

> On 28 Feb 2022, at 16:11, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> When overriding the tool chain via CROSS_COMPILE, the resulting
> components need to be made available to, in particular (but not limited
> to) the check-endbr.sh script. Note that we don't allow overriding
> ADDR2LINE yet; this would first require additions to some config/*.mk
> before it would make sense to export the resulting variable as well.
>=20
> The lack of NM exporting was apparently not a problem so far, but add it
> at this occasion as well - we're using the tool, after all.
>=20
> Fixes: 4d037425dccf ("x86: Build check for embedded endbr64 instructions"=
)
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -55,7 +55,7 @@ export TARGET_ARCH     :=3D $(shell echo $
> # Allow someone to change their config file
> export KCONFIG_CONFIG ?=3D .config
>=20
> -export CC CXX LD
> +export CC CXX LD NM OBJCOPY OBJDUMP
>=20
> export TARGET :=3D xen
>=20
>=20
>=20


