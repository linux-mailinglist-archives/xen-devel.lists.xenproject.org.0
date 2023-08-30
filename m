Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FDF78D3C0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 09:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592734.925544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbG2j-0002dg-02; Wed, 30 Aug 2023 07:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592734.925544; Wed, 30 Aug 2023 07:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbG2i-0002az-Sk; Wed, 30 Aug 2023 07:55:12 +0000
Received: by outflank-mailman (input) for mailman id 592734;
 Wed, 30 Aug 2023 07:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TI6i=EP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qbG2i-0002at-8S
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 07:55:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7d00::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a11fa2b-470a-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 09:55:09 +0200 (CEST)
Received: from DB7PR03CA0090.eurprd03.prod.outlook.com (2603:10a6:10:72::31)
 by GV2PR08MB8075.eurprd08.prod.outlook.com (2603:10a6:150:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 07:55:00 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::f2) by DB7PR03CA0090.outlook.office365.com
 (2603:10a6:10:72::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Wed, 30 Aug 2023 07:55:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.20 via Frontend Transport; Wed, 30 Aug 2023 07:54:59 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Wed, 30 Aug 2023 07:54:59 +0000
Received: from 3d16017ffd63.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E98013F-8FFB-4343-996B-A29E52544B5D.1; 
 Wed, 30 Aug 2023 07:54:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d16017ffd63.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Aug 2023 07:54:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB9677.eurprd08.prod.outlook.com (2603:10a6:10:447::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 07:54:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 07:54:50 +0000
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
X-Inumbo-ID: 8a11fa2b-470a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yE0WOh+eiOva+bxYzrghnNv6MhootGY+gf5i0PGeYd0=;
 b=KXd8MK82ADQkaV3paJLUI9hiGyfRxktzLodeWekr7Biv2NeNQxgiWa8+a7K5QSeK7uDev5m46K2zf6v4lEpJOpdeAABJKoL2AhmK3t5McoLNMfwEzJhTCUfqaWWaDVJfU8HLAMp8amY/S4RatAz5HmlbfgbqKkJ4Wp0fVFeu60c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c22716e16b7391db
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQbgHH2BMR6WJALAadvtl8T/vUCNj5VgJAjARlcMhE3/8NV/gXN66Ue6K21cdPDY04QItDMBIfK4enX182uA/cfvcv1Bv9LCSzYHf9h/e+IYwc0Dr8yvUiCqOVSWgwpcbUbt1LDMVa+qKYHP0a+nt8GD4tP6PHZ/VpPY0D87hUkuBDd2E7AQvWm7Sw9C5MNp54ync+0ZwFrpQdDk1nfXJMzu2CYqAisK0matoySxKPCRb22prRJecftmTpyABpF/gX/U0aAvJJ8jCAF5OIL+32u6+el2tpXkl70IW0p/a7NjEfE7YQTuNDaHjx0xuPiDXRihiH/Y7cs91gqGGVyoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yE0WOh+eiOva+bxYzrghnNv6MhootGY+gf5i0PGeYd0=;
 b=eTp4Vt405r7uQjP5nuu0rSREOKji0gCihrVNJkvo6CPbGEMJRW67C4RdtYTSd6EzaxJnhLIsSrMj5maAjVzi90kht9D8q6XcmRMUxP9ha5C131IKgHHwiYy8z6Ll/igwXddDGaojo7K1NQoCi7kfdUOUf+PqJ8a/3U5P9TDynFzWVoZiU0ukA7YEFCUC832icfKI5a6J8WO9nuZV/30MjF6bp+rw1T1vSSCsxsdS9/wj50wa5a9dItT9vFajxOR8gOrQ36REYVQ1zV9vOGowwo68dVmb622poG5fLY0fz7xYmaDVcfUxqsD8JJNFSjxQ/MV1SZ1oNudo943ReJHXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yE0WOh+eiOva+bxYzrghnNv6MhootGY+gf5i0PGeYd0=;
 b=KXd8MK82ADQkaV3paJLUI9hiGyfRxktzLodeWekr7Biv2NeNQxgiWa8+a7K5QSeK7uDev5m46K2zf6v4lEpJOpdeAABJKoL2AhmK3t5McoLNMfwEzJhTCUfqaWWaDVJfU8HLAMp8amY/S4RatAz5HmlbfgbqKkJ4Wp0fVFeu60c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>,
	"roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add 14.3 and 14.4
Thread-Topic: [PATCH] docs/misra: add 14.3 and 14.4
Thread-Index: AQHZ2t1QaiF4viv/Cke+tZQgief+irACeLmA
Date: Wed, 30 Aug 2023 07:54:50 +0000
Message-ID: <C2070A06-265A-48EC-9A67-34D820B2F94E@arm.com>
References: <20230830005950.305085-1-sstabellini@kernel.org>
In-Reply-To: <20230830005950.305085-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB9677:EE_|DBAEUR03FT057:EE_|GV2PR08MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 52cc95df-2963-4185-23a6-08dba92e68ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0CdaJhkPke/hSPqO8IWcpVAnTm6jC9psyH1fKPhgB0NCPQwS2wLh26GZu8EUm+5DRn9t1R8GUwbhIf3edHZlC7r64y6qRnuZk4KbHEhULjxWBbi43NE4K77blavzwvpYlEOvBwk8Ek1N0TINkce8Zbg0pihglDQmXG16k0pupm2yi5MCwVM8Q/DTDugizX5n8QdPkhCZaeL0dwpvfpAMVZGTIL5DYQIoeseTVJD7X5CWnUpsAaytLSi4f4Jp5Q3sXwORBOaKjIKOZ33GCB2cV1bPrFoYu5rfX/RsARr5DJLtDIXDBzAj7/qmkLB0pVd5QPyF9YuOuylE5Iz8rVm6MQUZ76gjV9t0vzhP/9bYkixDlgYHkJkcs0OhV3vOcQ3dr7mZqkK6OP0j+ZvC1YKV/L/sZHcVNGLJOgHpHkt/1DqMwEQJ0PaMpHkYsnAEwUrU3EFEQ8feMbdeCm0D9j+nljSGi/LwzV/ZsXcNxSwqfv7EDeSrzspVAxWzp733w0kNGo6Ynx8RTOOUtgmvhjPVjB95tUBQiihI4Eg5Eq4EVbum+HzIuNL2SGf7gyNshaAatxcClTgHLCi9iorqUneCiIkY5p7A5m2MwrV+LI22hxftUTHBjMtxWTQCfA3RShF9h6Jy87K2BwwG0u6bOOKrxpMOnZv4K+WFoubJPrp0ffGeQ1L2hZ4fXMingcQWWcJy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(1800799009)(186009)(451199024)(8936002)(91956017)(53546011)(478600001)(76116006)(122000001)(66556008)(6506007)(66946007)(71200400001)(66476007)(64756008)(54906003)(66446008)(6486002)(6916009)(38070700005)(316002)(38100700002)(41300700001)(6512007)(5660300002)(8676002)(36756003)(83380400001)(2906002)(2616005)(86362001)(7416002)(33656002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7B574B8C6666194B925BE6348D7395EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9677
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a671e342-6c17-4cba-c8c8-08dba92e6362
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mU/cZRPvJhZRAIHkiLFKuBXOBJDESFn1zR688IA4M+g4jqrwe1L04mHdQqmu+L7w5hPrB0Ztl1a38IzcOhWeDIb3lVAwbYLRjgl8uvxbKHSEr4QsQgSB0IJzs1beWlOvokw80hs7FZ4e5b7dzCL/Hp1lBdUsXucFQO0O+VJwW5p3gajLmPPKDFuG98PBYohWLYkc0zXtF/UOV2IyFasiBiJVfgELAPgQL+wHkZJwPV0gBatkG+lus5D353KIs+bkJrE9ARbjBEg4SgMn10tqZfXHT2DWueKW5y7Mt4EmCEBxoSH54PpQy3I0mFIp2M7WhlSFcMbKH5xox7O8yMSkRYb3KyurVZ0UdRGeHYfb+/Ld3TNd02TstXiqpIU7YWW7G1djcn7VNLdQoyl2gokSUpsMKwaOr0zseAlF70xbSaxpPF/L2kC51QISzZ9q/MB/qe/iglAmbGEFxOnfz1tDH10tWsgpjFW5fdhvxOUQ98UzcIfyRA91kmpg/SFc0DKB+6LlT+lrE3u7sxEb7K98cGQ4A5bYgEp5JIAlUkOIea1ht3UKmNyRjR3nXHNfINF61Dq5VgdsVPPAaQtdQIjnzqm+BX9IRWvuKfdsxZhAatm6mFmAaqF4nL3DjetnuqM3/tXwBG8M9A0Hv2ZWFx9l0WGPQ2O10/af3GDz4Q5QA+T4B/0+UzFOetnluFGD8dFtxfjdBvmPvrQuqzo3GMQq5fKTl5Xk46N2lb19h2/jnDn+oLm0RR8P9JhNJHz/HtCn7YUjsgppK9exe8EgcuR8Rw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(186009)(82310400011)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(6506007)(6486002)(6512007)(53546011)(83380400001)(26005)(478600001)(336012)(316002)(41300700001)(70586007)(54906003)(4326008)(5660300002)(8936002)(2906002)(70206006)(6862004)(8676002)(33656002)(40460700003)(36756003)(86362001)(40480700001)(47076005)(2616005)(356005)(81166007)(36860700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 07:54:59.6796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cc95df-2963-4185-23a6-08dba92e68ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8075

Hi Stefano,

> On 30 Aug 2023, at 02:59, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Add 14.3, with a project-wide deviations on if statements.
> Add 14.4, clarifying that implicit conversions of integers, chars and
> pointers to bool are allowed.
>=20
> Also take the opportunity to clarify that parameters of function pointer
> types are expected to have names (Rule 8.2).
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> docs/misra/rules.rst | 20 +++++++++++++++++++-
> 1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index db30632b93..6cde4feeae 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -234,7 +234,7 @@ maintainers if you want to suggest a change.
>    * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_08_02.c>`_
>      - Required
>      - Function types shall be in prototype form with named parameters
> -     -
> +     - Function pointer types shall have named parameters too.


I would just modify to Function and Function pointers types shall be ...

>=20
>    * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_08_03.c>`_
>      - Required
> @@ -332,6 +332,24 @@ maintainers if you want to suggest a change.
>      - A loop counter shall not have essentially floating type
>      -
>=20
> +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_14_03.c>`_
> +     - Required
> +     - Controlling expressions shall not be invariant
> +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> +       checks, and other constructs that are detected as errors by MISRA
> +       C scanners, managing the configuration of a MISRA C scanner for
> +       this rule would be unmanageable. Thus, this rule is adopted with
> +       a project-wide deviation on 'if' statements. The rule only
> +       applies to while, for, do ... while, ?:, and switch statements.

Didn't we also said that we would accept while(0) and while(1) ?
Also i agree with Jan, ? is really the same as if so we should not treat it=
 differently.

> +
> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_14_04.c>`_
> +     - Required
> +     - The controlling expression of an if statement and the controlling
> +       expression of an iteration-statement shall have essentially
> +       Boolean type
> +     - Implicit conversions of integers, pointers, and chars to boolean
> +       are allowed

I am a bit wondering here what is remaining after this deviation.

> +
>    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_16_07.c>`_
>      - Required
>      - A switch-expression shall not have essentially Boolean type
> --=20
> 2.25.1
>=20

Cheers
Bertrand



