Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387C74846E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 14:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559177.873917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1zw-0005Wj-GS; Wed, 05 Jul 2023 12:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559177.873917; Wed, 05 Jul 2023 12:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1zw-0005UY-Df; Wed, 05 Jul 2023 12:52:44 +0000
Received: by outflank-mailman (input) for mailman id 559177;
 Wed, 05 Jul 2023 12:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cLSs=CX=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qH1zu-0005UQ-6m
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 12:52:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3920fac-1b32-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 14:52:41 +0200 (CEST)
Received: from AM6P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::20)
 by DB3PR08MB9086.eurprd08.prod.outlook.com (2603:10a6:10:430::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 5 Jul
 2023 12:52:37 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::34) by AM6P191CA0043.outlook.office365.com
 (2603:10a6:209:7f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 12:52:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Wed, 5 Jul 2023 12:52:37 +0000
Received: ("Tessian outbound 546d04a74417:v142");
 Wed, 05 Jul 2023 12:52:37 +0000
Received: from ed63330c8289.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3910A205-1919-4859-83A0-F1F41B4BEB0A.1; 
 Wed, 05 Jul 2023 12:51:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed63330c8289.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 12:51:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 12:51:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8f61:5b01:4db1:8363]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8f61:5b01:4db1:8363%6]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 12:51:37 +0000
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
X-Inumbo-ID: d3920fac-1b32-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj1W+bkzJHz01I0MRE3nVj2CGpAeYUaqX+hFXrc6Eug=;
 b=Ily2BCQV36u0SqMvrcgySVG3/H2SgL7THOWj5EsTkGSA+eZDzcS+n2MtN/HxP2GONoSvAyMlOJYXWNoBQVjGX759ubPFOdfMqd83J6mo42h2sY9ktlfqAVHBl0cq2HqUUMeK9STZs0kwIUMALM2+cfp8PUzHd2GV4sAqI4vV4b0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 923ca02a12a65704
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhZyVQl7VZpIf9mQsC1neuD17za21HHng246E4iQO+5YnkmiMwIk1NgA5pIc0y9I5REYCANhNgNQpCMhgLg+nt2bwZL2Tzh1Z5qKLs3wX2rRLy+0l1KympivbCFRngCpJYIlzQE+0ubbr7bQW7VEuDb1YUzR8ELoe1PNneat9z0V+M/aa8OQP4eD5zYuT3eprlKzkEcXtbd3BwzKgGfEr9p9pEFHD+oiq/3dp0A8ZJVCX8sY3WCKssNcJgJEoC9XkPDyvFzrC8RBioP6yynih6zQnwH67V5oMJDXxdCE+YW3b2iK6F0vl8XAuSfnY2hmP4dNO6fZ4BdVzqwkf87jTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oj1W+bkzJHz01I0MRE3nVj2CGpAeYUaqX+hFXrc6Eug=;
 b=nvIQdd0KzhO0LYD96rYDYEObHeP2ECb527Zw96yXan4nTag0OCHjIkQW/c/V4zHOVvbtORwOb39xO8ISeJmROlmwT/c3UoLXUo1Ntl2aRZCEu8YGFORqj60q9ldw9QsnxVtbaD9waEiRgPcwJpDQPxciPqKE+jbr8PBMt7R/JWRiDGmwX2wae7kmPp+HYIdNhr0sBkWq9PTUDxSLPXHsgtAkw9fcKednpYhGM0HQB1+Lss1/qR2hSpJAior9K9NjmmDUpp2mO6XhNPk8L/5szdT963bgOWfMl9FWd3lmDeSZdfEA1nxttpzH4KQlF6Q2aK890F1hufZIpeI+x3Tdhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj1W+bkzJHz01I0MRE3nVj2CGpAeYUaqX+hFXrc6Eug=;
 b=Ily2BCQV36u0SqMvrcgySVG3/H2SgL7THOWj5EsTkGSA+eZDzcS+n2MtN/HxP2GONoSvAyMlOJYXWNoBQVjGX759ubPFOdfMqd83J6mo42h2sY9ktlfqAVHBl0cq2HqUUMeK9STZs0kwIUMALM2+cfp8PUzHd2GV4sAqI4vV4b0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Thread-Topic: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Thread-Index: AQHZrzemFhjMGQXcTkKAEu+0mA/HSq+rE0UAgAAM0ACAAABNAA==
Date: Wed, 5 Jul 2023 12:51:37 +0000
Message-ID: <A6830B87-B202-42BE-A2E5-095B197F6678@arm.com>
References: <20230705115534.26004-1-julien@xen.org>
 <2761ae84-113d-c230-ad50-e9cfb0ae434b@suse.com>
 <3C9C10E5-D5E0-4B4E-935D-80832BB795C4@arm.com>
In-Reply-To: <3C9C10E5-D5E0-4B4E-935D-80832BB795C4@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6588:EE_|AM7EUR03FT023:EE_|DB3PR08MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 588e6456-437b-4541-47df-08db7d56b5d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5llzmBfHfoilQK5lMXpaTPnnReHnYkvmvBsf+P3odQQLPOKvLfhWJBtJbLyxkeni4RNb8yhoBpYbZVRh5N9gyLolenKzUuXDfjFNeKZXAQ48dLqR2KJwDEVsdqI3glo8KY50Yy+akvMdrzuFkSSYxWTqq4o1yCYtPVlJeHxkxMuUlhEYZZ+pzu2TTiv7mxqIvZk9vxh37U60h9ueHfs2HeIgXDZjSeLUSgzLZQqGVk0+SRAbdSg2d6VckftgiWWyrdSqpvSTQgSPMisyIwBOcpVFa85JLNzshZ2FtwFes1oC+rb2nVVROuv9rXjAC8jGVN0twBBuSyAzSNfvOK05y6uII4d2E2fpaDosZQ2yeXqhB9CbbNhFj14kl9skjZXyNz2NYg1iQtfQQlpv26ntTJn2X4fCr64FBP3aPaAl+EtJnbeaoLxvOKzyg7AA3oIpe1ab4zaXyyf5XwL2tWAUrdI5QDfngYbdYgL9BIwZst1DiRbk+Aao6pfRGx1ozy1dpWaY1FM1EXR4K3lP2ucwIIH66r8HQiYH16WqbAfxFNZZTFPgrZuJki+WFzhj+TTEh6pZiddfun7m+w6kc+WV4x8eGlY6IgG+tIsB8bSfcFSxwgrOUd//uhgZKltEAmTl0bNw4fM4r0BHba2Cm0HicA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(36756003)(4744005)(38070700005)(86362001)(33656002)(2906002)(5660300002)(6512007)(186003)(6506007)(53546011)(91956017)(54906003)(6486002)(122000001)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(38100700002)(316002)(2616005)(66946007)(76116006)(478600001)(71200400001)(8936002)(8676002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A5DCBE915CEF1C4780923C40F3DD6C48@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6588
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e0202b2-03ff-4f75-38ed-08db7d5691e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gZmDGsC3jnYSaC27LvzfbnKag59RkdhoAkVeu+RE4TMzGonllWqdWio4JaHWekf5p7uEQ1lbk6os4M2Rky78XCaAQUpaD95KVJXzf1iJSOfxQ6+tIJx2s2vMe2qxthc2iPSYuXZ1LXiIQ0iJ/6YAJcZpXYqCuPMuGSskM9ldB3STf8gZLQr64KqIZMUmovQ4un+D9jlAEDE410vtnQJvQOW0ManqEYiBrRClDe7P1KyvlpSLQ/KbYCneyHbeFZHzdHnMxxE2abUTjGkAuvgbLxF2YSS180AhpTPussrGDuV3riVTA/yhXo3KVWClMVnqKJtGKkR8Sempx9HBXXoobx/Uo//mpQ9AEm/OCdvetE7eGBXbpYqNDjNY8+RYJJkPQrxQIZOxLCHja0k3nqH1T6ndxMHCuXR5EV20JK1eDvH48Jc0iqva0GmavR4eJyBSvJfis4aklKNkwFbn3hSdJq2ZTfzCgz2kERwvJVPJl5957Kh9HMtAhQkggOoc76wYmJjcUZ92+98VrtzNrgCvnp0su3+0Ccr4VdcikDlVi4/E63p93dlZa0QPKcaF31IkxFB/WJBeRvL+Azba0jCv+yWta6ULAVMtVQnX+TEzr+JzNiLBygHPH0v/1hwcy4qzfsLfoHfk7BNPHPYfClOupr3ynioq1t26l2jZzENlO1R9EAe5eFPjrIAZlaHGl8e9icmU5U50wM+DrgLHNPtLygEPWy4IgoaEML9DSv+llZQ0el2ZaUcA0eZEN7STIQff
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(40470700004)(36840700001)(46966006)(4744005)(2906002)(41300700001)(40460700003)(6486002)(82310400005)(81166007)(356005)(82740400003)(2616005)(6512007)(47076005)(336012)(53546011)(6506007)(26005)(186003)(36860700001)(40480700001)(54906003)(86362001)(478600001)(33656002)(4326008)(70206006)(316002)(70586007)(5660300002)(8676002)(36756003)(8936002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 12:52:37.3654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 588e6456-437b-4541-47df-08db7d56b5d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9086



> On 5 Jul 2023, at 14:50, Bertrand Marquis <bertrand.marquis@arm.com> wrot=
e:
>=20
> Hi Jan,
>=20
>> On 5 Jul 2023, at 14:04, Jan Beulich <jbeulich@suse.com> wrote:
>>=20
>> On 05.07.2023 13:55, Julien Grall wrote:
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -63,11 +63,11 @@ source "arch/Kconfig"
>>>=20
>>> config ACPI
>>> bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPP=
ORTED)" if UNSUPPORTED
>>> - depends on ARM_64
>>> + depends on ARM_64 && ARM_EFI
>>=20
>> Wouldn't it make sense to drop the ARM_64 dependency then? It's now
>> redundant, and it seems quite likely that if EFI was ever support
>> for 32-bit, ACPI could then be supported there as well.
>=20
> I think we need to keep it.
> If we add one day EFI support on arm32, we will probably not add ACPI sup=
port anyway.

Sorry Julien I answered Jan before seeing your mail but I said the same :-)

Cheers
Bertrand

>=20
> Cheers
> Bertrand
>=20
>>=20
>> Jan



