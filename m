Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72777425EF1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 23:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204044.359246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYaxm-0001PR-32; Thu, 07 Oct 2021 21:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204044.359246; Thu, 07 Oct 2021 21:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYaxl-0001Lv-Vz; Thu, 07 Oct 2021 21:30:01 +0000
Received: by outflank-mailman (input) for mailman id 204044;
 Thu, 07 Oct 2021 21:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/ki=O3=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mYaxk-0001Ee-Hu
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 21:30:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::616])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dc09697-4e54-42f9-8c9d-1ea43bce6f23;
 Thu, 07 Oct 2021 21:29:57 +0000 (UTC)
Received: from AM6P191CA0077.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::18)
 by AM6PR08MB3048.eurprd08.prod.outlook.com (2603:10a6:209:46::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 21:29:53 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::d3) by AM6P191CA0077.outlook.office365.com
 (2603:10a6:209:8a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 21:29:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 21:29:53 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Thu, 07 Oct 2021 21:29:52 +0000
Received: from 4ecda216ea39.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 25994354-538F-4BEA-93F2-FB8BB6EE5402.1; 
 Thu, 07 Oct 2021 21:29:46 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ecda216ea39.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Oct 2021 21:29:46 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3046.eurprd08.prod.outlook.com (2603:10a6:209:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 7 Oct
 2021 21:29:44 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 21:29:44 +0000
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
X-Inumbo-ID: 2dc09697-4e54-42f9-8c9d-1ea43bce6f23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JURL/W6EG3nj3WleGQmL6icSqqBC7/0f1R47fa07m3U=;
 b=cIppaf6hu8iMbCjAuXvnMUFRZQshxIihhF4YW3bJUzBU9oiYxz0GV3rCAEiw3RQ48y/+E8s5Yl9aKQUJpH/QFxUjI2+y42GD7B+x0PyNiC43lJxupx3NfkMMrAjnA9SZLxa3YBt/rPgxsaFkC8d7urZHii3rGYGjQY3x83ZEfU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 709cdd73aa103954
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhM8LYIfmLcbWmoXlXP/M1juBnxkYQsxuChtivlToGVuI/1xP6fx7xs2ECFABAEyYq8GhekXOVdgjOJcPn0ET3rsSi3MAuy2X1fPMCXtB4YNmDIavwsEmATof9bNKMHs3moqZ4A6kDzKbSjD6RC2njNvtq29bd4BWF8LxrzuKYbPix4ILLPwbxXy9gIkdimICJ0MIZdUFnKs9+ajESsn6PIHyiK2Chhq095iRXnvtdXCLjNb21IIzCuAZfjKi0zCSWiZRT+8ep03DoSGco4Rwa4eA5Rmx8ysdiauKiR5OwPRTW4kBQpUhdzZWEqt1uMNjklVyZvc2rj/KrNUur55ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JURL/W6EG3nj3WleGQmL6icSqqBC7/0f1R47fa07m3U=;
 b=CUdp1D6sHUWEwzrY7/scJilobtjzqArd39XwQkNtdxzjVhgwj/JuV/IWG3BNSXbQgLMMw+7MPdd6hJRxm1vpqumYOaXv19FyJ7U5Ja6jr7t3ji+iKtGtM00v1bBqnh3MknXltRapJYFqkGfGg3suiN+BkNRuwM7Q7zUTsM6SY/FlUYUk6wr7rF4WL7ksc5nwD49mQIR8l3lgfVl9+lLvD07792VO7CfnKtp0o9LiQR7JmlMLUka0TNBMGj+geAMGcB8o2O1Q15ZEpV++bwAzyw+/we7nVfTSUktrOVNpzPidu3lf6A6Rr45G3urI9d0B7z6KB+1j+whxuLkkvzHV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JURL/W6EG3nj3WleGQmL6icSqqBC7/0f1R47fa07m3U=;
 b=cIppaf6hu8iMbCjAuXvnMUFRZQshxIihhF4YW3bJUzBU9oiYxz0GV3rCAEiw3RQ48y/+E8s5Yl9aKQUJpH/QFxUjI2+y42GD7B+x0PyNiC43lJxupx3NfkMMrAjnA9SZLxa3YBt/rPgxsaFkC8d7urZHii3rGYGjQY3x83ZEfU0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Paul Durrant
	<paul@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 00/11] PCI devices passthrough on Arm
Thread-Topic: [PATCH v5 00/11] PCI devices passthrough on Arm
Thread-Index: AQHXutlceeUNYF1AYk+Z54KWyB0oI6vH9LCAgAAafgA=
Date: Thu, 7 Oct 2021 21:29:42 +0000
Message-ID: <8052B229-D572-476F-BCF3-C8F44EA38129@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2110071251530.414@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110071251530.414@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a10850d6-81c5-4d8d-632f-08d989d999e8
x-ms-traffictypediagnostic: AM6PR08MB3046:|AM6PR08MB3048:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB30486E9EB1D266936A8F0BF9FCB19@AM6PR08MB3048.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WAnH6Iu7BNufBOLdCQG1akvff6aTdVEKbBgAOCrgZApjAr77cniqd8AuSHMLEqa7YkMHBbGOdDz+s9wdIH6e4ytrVpfFiO7+I81YXe+K0K5xZ1CSq7ZUpHNL3m5+5o/YKBVCtHND4s6EhJaQ2m+7dsXSyRAU74eeUumLKzwPm+/b1So+6rZuu4j7Z/IuC7AmbAxruiI84xYoUHDYVpi4lcH6vaw+Eh1mTLZ1rk03y9SIeq6pvJOiB4cq2xBp/qKGNVFWa5BqX4HR2G5FbLqYBRG3GVxCi0DxmTHDeEZ8AmYWByIazLliJ0P3vobGd0ialXBRKaz+2T7b7XKx2iwfPzeUVLzWFNhQULDIjcwNzy94YLHCv+KR3Gefeorz9u3+ga92Rz2QH+FlzWAk86h2fHlGYhnlp2pkiGha0aHeL809Sdprlbp7M56o/+EBEoxrYzdh7W0sNM2C5PqGC4yTyJy73yBFwC+Pi9U/1c+QK0+tSlwHFGdrlMyxNK0M/dlmRjTJ6IJajThUfIJ1/9SsClfVW9DCBVs6DEo7wpLkaAhrWC+Re+Qq4uGHhLirUch2GCJNkYOhZv2I/b9a4/IAm0QpEkB5gkdXt8eehMVojv0WbbATxI6RU8z97nacx9RqA3n0VJ0iEcteZyxelmPqH96iHY4TPX+0n0sOAcpdX+qbA9DKu7bT+v8VTMGZO/7pm/HzblUM6ebTWIDbE1GOrcKNXpcqmnz72Dn+eISddfzNCf30s3PyC5lx9kV0Bt28Vrof/XYJ51HJX6CBKM+vu22KC4fjl0yJyGXsCAG40Ssr4TViwq/DjXiKUhUMgfuyZp81Hf6UW/W2K++MPZgZB+da1yLXjUMCsg0KL/cRPcI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(66446008)(54906003)(33656002)(64756008)(86362001)(53546011)(6486002)(38100700002)(122000001)(26005)(2906002)(966005)(316002)(4326008)(6512007)(508600001)(2616005)(71200400001)(83380400001)(8676002)(5660300002)(8936002)(6506007)(7416002)(66476007)(66556008)(91956017)(76116006)(66946007)(36756003)(38070700005)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5138C444C653D143868C6320084D02A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3046
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	adf60360-32e3-451a-e979-08d989d99465
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	shkc8oqQNetKU2FnEEsM5DQ9Jy7Jng16+RILjYYKPU8cT1v1Ykpf3J1d5eIiBO6jAKAbK5VlKZLzUSk/KqFfe8dnLhsLilsjIAXdFqqLkG+QoBlYbSTPtAhJvT6VJA1SfKNJasIpK/A/uuqGqqKgTBqf1+h3BVtRzoJ0n3NtIcj9XVVNYYRraPzZewAx253FDwo10pcw0TNQdilyCuLxkYc8WM8eNxu5kyi0Pu0NC3A2x8sVmNDnhu7SoPNg+B0o91ZZnuxo2Y2crh+c2RhZ0VR/c+Pnyh/0eanmcZOMVvkLxSVq7FofwDysA4lYv5dt2/oGb1rBelVLesiBRT3i5m7aaJijKUEwObTKyKLYhYUd2urUviKr+HpwzM4RQyr2iAeo+uYru1mM7R89ZMOIhFb0RMRsoLahcJCCqbzFNUou9efbuX1wlhhmnlmzQ9rWPmaNpLM05p3D7UBpRlLTOHBx6y1YuU6313J6WH6/RB3psV6BJl0rXzkYYb62ZyYPU+Y5nJSARZbrooUoWG3+P23hLBjuMVPtDa3z2gBsVT38GDzvB6+9My9pkB/CiLnVwLYEWof/Y5x06ihP7zbuyCz/1KVsiCcO2x/hIA+tABiwWnEKU3X0rXmsN445MEXHiS+Z1NCVlgDFk9iMwYYS9q3FyldrZKRcrjx11caVlpJGJbYZ5INZ5KqmKOoGv0rTYCaXR++NpXSypArlTDEavsQXcM/oBhDjPzWtLiaRRNXnpt8w7oBd6qwxPWhsrYkVDCFFK168h4f5UXWK08k2ZF4IKuQH52s0P6eXsynobMOkFzxMH5eogzUwbxb9WBpw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(8936002)(6486002)(336012)(81166007)(33656002)(8676002)(966005)(186003)(6512007)(316002)(508600001)(107886003)(47076005)(54906003)(83380400001)(4326008)(6862004)(26005)(36860700001)(5660300002)(36756003)(2906002)(82310400003)(6506007)(86362001)(2616005)(356005)(70206006)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 21:29:53.1948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a10850d6-81c5-4d8d-632f-08d989d999e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3048

Hi Stefano,

> On 7 Oct 2021, at 8:54 pm, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> I committed patches 2-7.
>=20
> I made two small adjustments on commit:
> - patch #3: bool_t/bool
> - patch #7: drop _XEN_DOMCTL_CDF_vpci

Thank you very much. I will be on leave from tomorrow. Someone from my=20
team will take care of the rest of the patch and reply to the comments.

Regards,
Rahul
>=20
> Cheers,
>=20
> Stefano
>=20
>=20
> On Wed, 6 Oct 2021, Rahul Singh wrote:
>> Hello All,
>>=20
>> The purpose of this patch series is to add PCI passthrough support to Xe=
n on
>> Arm. PCI passthrough support on ARM is the collaboration work between EP=
AM and
>> ARM. ARM submitted the partial RFC [1][2] last year to get early feedbac=
k. We
>> tried to fix all the comments and added more features to this patch seri=
es.
>>=20
>> Working POC with all the features can be found at [3]. Working POC is te=
sted
>> on x86 so that there will be no regression on x86. Design presentation c=
an be
>> found at [4]
>>=20
>> PCI passthrough support is divided into different patches. This patch se=
ries
>> includes following features:=20
>>=20
>> Preparatory work to implement the PCI passthrough support for the ARM:
>> - Refactor MSI code.
>> - Fixed compilation error when HAS_PCI enabled for ARM.
>>=20
>> Discovering PCI Host Bridge in XEN:
>> - PCI init to initialize the PCI driver.
>> - PCI host bridge discovery in XEN and map the PCI ECAM configuration sp=
ace to
>>  the XEN memory.
>> - PCI access functions.
>>=20
>> Discovering PCI devices:
>> - To support the PCI passthrough, XEN should be aware of the PCI
>>  devices.
>> - Hardware domain is in charge of doing the PCI enumeration and will dis=
cover
>>  the PCI devices and then communicate to the XEN via a hypercall to add =
the
>>  PCI devices in XEN.
>>=20
>> Enable the existing x86 virtual PCI support for ARM:
>> - Add VPCI trap handler for each of the PCI device added for config spac=
e
>>  access.
>> - Register the trap handler in XEN for each of the host bridge PCI ECAM =
config
>>  space access.
>>=20
>> Emulated PCI device tree node in libxl:
>> - Create a virtual PCI device tree node in libxl to enable the guest OS =
to
>>  discover the virtual PCI during guest boot.
>>=20
>> This patch series does not inlcude the following features. Following fea=
tures
>> will be send for review in the next version of the patch series once ini=
tial
>> patch series merged.
>>=20
>> - VPCI support for DOMU guests (Non-identity mappings guest view of the =
BARs)
>> - Virtual bus topology implementation
>> - IOMMU related changes (generic, SMMUv2, SMMUv3)
>> - MSI support for DOMU guests.
>> - Virual ITS support for DOMU guests
>>=20
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg0118=
4.html
>> [2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads=
.html#01184
>> [3] https://gitlab.com/rahsingh/xen-integration/-/tree/arm_pci_v4_integr=
ate
>> [4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthro=
ugh_On_Arm.pdf
>>=20
>> Oleksandr Andrushchenko (1):
>>  xen/arm: Add support for Xilinx ZynqMP PCI host controller
>>=20
>> Rahul Singh (10):
>>  xen/arm: xc_domain_ioport_permission(..) not supported on ARM.
>>  xen/arm: Add PHYSDEVOP_pci_device_(*add/remove) support for ARM
>>  xen/arm: Add cmdline boot option "pci-passthrough =3D <boolean>"
>>  xen/arm: PCI host bridge discovery within XEN on ARM
>>  xen/arm: Implement pci access functions
>>  xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
>>  xen/arm: Enable the existing x86 virtual PCI support for ARM.
>>  xen/arm: Transitional change to build HAS_VPCI on ARM.
>>  arm/libxl: Emulated PCI device tree node in libxl
>>  xen/arm: Add linux,pci-domain property for hwdom if not available.
>>=20
>> docs/misc/xen-command-line.pandoc   |   7 +
>> tools/include/libxl.h               |   6 +
>> tools/libs/ctrl/xc_domain.c         |   9 +
>> tools/libs/light/libxl_arm.c        | 111 +++++++++++
>> tools/libs/light/libxl_types.idl    |   1 +
>> tools/ocaml/libs/xc/xenctrl.ml      |   1 +
>> tools/ocaml/libs/xc/xenctrl.mli     |   1 +
>> xen/arch/arm/Makefile               |   1 +
>> xen/arch/arm/domain.c               |   8 +-
>> xen/arch/arm/domain_build.c         |  19 ++
>> xen/arch/arm/pci/Makefile           |   5 +
>> xen/arch/arm/pci/ecam.c             |  61 ++++++
>> xen/arch/arm/pci/pci-access.c       | 140 ++++++++++++++
>> xen/arch/arm/pci/pci-host-common.c  | 287 ++++++++++++++++++++++++++++
>> xen/arch/arm/pci/pci-host-generic.c |  48 +++++
>> xen/arch/arm/pci/pci-host-zynqmp.c  |  65 +++++++
>> xen/arch/arm/pci/pci.c              |  12 ++
>> xen/arch/arm/physdev.c              |   6 +-
>> xen/arch/arm/vpci.c                 | 102 ++++++++++
>> xen/arch/arm/vpci.h                 |  36 ++++
>> xen/arch/x86/domain.c               |   6 +
>> xen/arch/x86/physdev.c              |  52 +----
>> xen/arch/x86/x86_64/physdev.c       |   2 +-
>> xen/common/domain.c                 |   2 +-
>> xen/drivers/passthrough/pci.c       |  18 ++
>> xen/drivers/pci/Makefile            |   1 +
>> xen/drivers/pci/physdev.c           |  86 +++++++++
>> xen/drivers/vpci/Makefile           |   3 +-
>> xen/drivers/vpci/header.c           |   2 +
>> xen/include/asm-arm/domain.h        |   7 +-
>> xen/include/asm-arm/pci.h           |  85 ++++++++
>> xen/include/asm-x86/pci.h           |   8 +-
>> xen/include/public/arch-arm.h       |  21 +-
>> xen/include/public/domctl.h         |   4 +-
>> xen/include/xen/hypercall.h         |   4 +
>> xen/include/xen/pci.h               |   2 +
>> 36 files changed, 1168 insertions(+), 61 deletions(-)
>> create mode 100644 xen/arch/arm/pci/ecam.c
>> create mode 100644 xen/arch/arm/pci/pci-access.c
>> create mode 100644 xen/arch/arm/pci/pci-host-common.c
>> create mode 100644 xen/arch/arm/pci/pci-host-generic.c
>> create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
>> create mode 100644 xen/arch/arm/vpci.c
>> create mode 100644 xen/arch/arm/vpci.h
>> create mode 100644 xen/drivers/pci/physdev.c
>>=20
>> --=20
>> 2.25.1
>>=20


