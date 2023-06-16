Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD958732806
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 08:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550008.858866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3N7-0002Oo-64; Fri, 16 Jun 2023 06:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550008.858866; Fri, 16 Jun 2023 06:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3N7-0002N7-2T; Fri, 16 Jun 2023 06:55:49 +0000
Received: by outflank-mailman (input) for mailman id 550008;
 Fri, 16 Jun 2023 06:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ynE=CE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qA3N5-0002N1-FA
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 06:55:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1319409-0c12-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 08:55:45 +0200 (CEST)
Received: from DUZPR01CA0133.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::28) by DU0PR08MB10359.eurprd08.prod.outlook.com
 (2603:10a6:10:416::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 06:55:42 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::f2) by DUZPR01CA0133.outlook.office365.com
 (2603:10a6:10:4bc::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29 via Frontend
 Transport; Fri, 16 Jun 2023 06:55:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.13 via Frontend Transport; Fri, 16 Jun 2023 06:55:41 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Fri, 16 Jun 2023 06:55:41 +0000
Received: from 7a5ed9365d59.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E799520-6507-45E6-88E2-C597F591228C.1; 
 Fri, 16 Jun 2023 06:55:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a5ed9365d59.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Jun 2023 06:55:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9598.eurprd08.prod.outlook.com (2603:10a6:20b:61a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 06:55:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 06:55:34 +0000
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
X-Inumbo-ID: d1319409-0c12-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXgNCGCw7cgZgp/vYzeRfsXQDIRSVG4XAafGv3kJCvQ=;
 b=G1SJz26S7HFtOZXeeGPqvQJXY5FZkvV7RYxlsjj3naTGdUm7b6D1Caom1BUTmkTzafgQiplGzQnlhyf+/fBqsNcGpA2BWkg6CldReukf5ftWWZ0NGQkDI4/u/acZ6jGh99XMgldHIQs3AfVfl+bOtLH4GByDbzbXdZUIG6TJd5A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 055f5c3854a653dd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey2I2kaGcyH/5Ix4n7w+/fA2yupOrBIkIjmdHDjUfQKSdKpDs+pHAkHf9gMkAVUpzo/bIZQMZUoyg9IHgQpPZ4D/ZjMo1MGPpm20dp+/7ic+4Ni/UeL5HlOy9X9tMJNaAp8R5pgEoWhv4q+Cf0EwHbkL7beoLH9Zs5iXVv8iw+Y9a+oWlj1vM6tlONLYNEPehXduOgVuEuJjXSM/LsSdXyNoHT6RKNrmXL3O0PhuMLSHCHaWIQOXoZNle9MTi0zluQ9qAOpXfQ2Z+UK4S+XBEx6oPbk7AageL2iz9byVTTVCcfVZJiwijpp5LJojGpC02BnZkUtF1xenWips4KR37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXgNCGCw7cgZgp/vYzeRfsXQDIRSVG4XAafGv3kJCvQ=;
 b=iexpvMOUK00eKIwCFPg/LajoQg3AEYcnU3p6ZiEXG9T2WsHe2dSvbMUaAntmiQnDWLwoHhlsV2JzS/gMx+NqTHSY1kRFan+Mesrj5gKLQNPYetjUuLeDzhLLLlY5MbHGNEj0BNqDk6zozkT6jv5WEki3zbU8d6QdAcG9vte747uunQBBl1PXS+XOL8l90pPLfjgZ2uNNFG/I5AkO7wuMKBmhgOvOLPazN6qsq/ZRxwmhZVz5+r5JJRsrxfRpjbQrQgr0rQy9vjKlj6X36Qt5A2XbFxN6xHiSTTrO8dNmPFE8S8zvpY7mfhD8BbeNRFoyTH1xzflG5GItRe87p2UX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXgNCGCw7cgZgp/vYzeRfsXQDIRSVG4XAafGv3kJCvQ=;
 b=G1SJz26S7HFtOZXeeGPqvQJXY5FZkvV7RYxlsjj3naTGdUm7b6D1Caom1BUTmkTzafgQiplGzQnlhyf+/fBqsNcGpA2BWkg6CldReukf5ftWWZ0NGQkDI4/u/acZ6jGh99XMgldHIQs3AfVfl+bOtLH4GByDbzbXdZUIG6TJd5A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5] docs/misra: new rules addition
Thread-Topic: [PATCH v5] docs/misra: new rules addition
Thread-Index: AQHZn88VmRmLP0MYHEWbK1HWPOziPK+M/22A
Date: Fri, 16 Jun 2023 06:55:34 +0000
Message-ID: <F165BEBD-E246-4A6B-AB19-0293A12AC755@arm.com>
References: <20230615211922.1328972-1-sstabellini@kernel.org>
In-Reply-To: <20230615211922.1328972-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9598:EE_|DBAEUR03FT005:EE_|DU0PR08MB10359:EE_
X-MS-Office365-Filtering-Correlation-Id: 3012a05e-c639-4f83-c1cf-08db6e36b365
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u0lE5wLW6kz2OqEOqwPvleWpiGLfImXkhAqNHGbQ67wXxZuOICzoD761fKu7KfOfeKOJWS6QQtjdfj50FCuSNucjBxn7KEKuxOHb+Obi7ErddPVhCa2hOq07AAAhD+FEaS9hvU1o92NQZUOS7i6rfHRmsPWJR6StHdsWp5XZukFUKg7oRRw/vm85CBh2h8CXF+94xg9odRa2b4qXtja0BvL/px5YiiiX8mdsrTp8SnHlKNUmc+ffeRFhbsdMVY8X6RUsAkSZrnZyo/YYVmI9CMcYBCJiTnzNEqMOb3+KmvSYmAAh1POCcZXdptO9EBmNLR7NrqpUM4ESnUOaxsVqrrs5XjKLKYqzgg4nguUcDLN2MmpEJwd0CdeQ2FFH+itOX6NptowkKJ2JgKbOCL+M0+uxoXo4d2ZI+auEjfJdd4wBSjJ8Dk3/rhviPwG5vdUI24rfdhSTkFLqTn5KHpRpWazYmrUrMolh7hc5rkGTol+DrNiA20pdgYTaAOJEfXuc5XYWuL2dP6AAEaLRSSs7F2RvZ6Zp4b7SwPl/ZXF+yJMSJ4r72QWER00N9kP+8769rWh4rAy1cXL/pHG5ImM0CUYtiFVNAlE9j7POFErLgK4/tlqPuUvPnFo3s9Cy5AR5ztw07mSK3FvFen/8ZVAaYoz8aE+h7XpXmO7DcB97Ng9qr2GHxAWlrygIguNT6Rlv
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(2906002)(91956017)(64756008)(41300700001)(5660300002)(33656002)(8676002)(8936002)(316002)(4326008)(76116006)(66446008)(66476007)(66556008)(66946007)(6916009)(36756003)(83380400001)(2616005)(71200400001)(6512007)(186003)(53546011)(6506007)(38100700002)(38070700005)(86362001)(122000001)(478600001)(54906003)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <673385E157A9DD42875A90BB7BB031BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9598
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9cfadb08-8039-4dad-3310-08db6e36aed1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZoGmi6W3mFk8SkCRywUw+pW/sm+PUimPyNZuP4C1PyCrxMukuXTCyNPGlGpmMl0t+FUIpI5Nnj8QpoQlfxc8vdxvtkU3/MMByZTo7LZ1/J+nreYRGwIZy+ccDwuUgNJh1zzHUXKK3GKl7XgQ2AjxyhEAc1dVhUIi2VQDdosfqKVMdP2Wp0LNGBMAE/uH8WIP0/THRuWDU8dMRpIMIs+AAiUAD0tFcVGzMu4nctJ/EgxN0gNvOTv+//2FzKl27uE6Qmrn0fdN4WHWE44veR5HuLdmyWHs0V1TlI7F8xnHcZbzUbwOktvoB5bW5MKJn5sW5vvmHm5l5suc6OkiTQmp4xh2j0wBOSbb7ygvEqQdCOC82dXuDxRG7BtP9ygpddTUA8dGwq5iXUlHaLHfYYT5Cx2c32uTrITgd5Hh99mOF8MS0RS7TVxsL9cj1qm75hWYhz0oOFAev6No2q5Q3zi6ltB2IbUPW0wwffI+Im9zZxeylNS6HG3nGtBI3J1mDWyYSMRjOPJ0G3iGGtaZxoL9QF05+cNYS4MuFwyvu8HShFmcL0MkLumwPffE9kZBPuYh2DI4E8q3qYHnz/Ri3aIRVsQi+pcueZpLIA6k+r3j/OI9fuF+/2JgyM5LBhce8v4APUK9qrS5XQZF4MCTPKqYj+yQGMvY8ifrNJZxUaDDPhRvKR1mbF6O013xsbqqzXkDpcd2M39x7GwD7OoXtJtyfYfdkR7gjMx6/WtJOA4uaocHxYQCmzDrefteZVS385pfA5sg4VOL2xzrM0FeoB9kwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(478600001)(86362001)(6486002)(316002)(40460700003)(82310400005)(41300700001)(83380400001)(47076005)(36860700001)(70586007)(70206006)(4326008)(81166007)(5660300002)(6862004)(8676002)(8936002)(33656002)(356005)(2906002)(82740400003)(53546011)(186003)(54906003)(6512007)(6506007)(26005)(2616005)(36756003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:55:41.9980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3012a05e-c639-4f83-c1cf-08db6e36b365
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10359

Hi Stefano,

> On 15 Jun 2023, at 23:19, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> For Dir 1.1, a document describing all implementation-defined behaviour
> (i.e. gcc-specific behavior) will be added to docs/misra, also including
> implementation-specific (gcc-specific) appropriate types for bit-field
> relevant to Rule 6.1.
>=20
> Rule 21.21 is lacking an example on gitlab but the rule is
> straightforward: we don't use stdlib at all in Xen.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v5:
> - clarify suggested approach to Rule 7.2
> - add link for 21.21
>=20
> Changes in v4:
> - improve wording of the note in 6.1
>=20
> Changes in v3:
> - add all signed integer types to the Notes of 6.1
> - clarify 7.2 in the Notes
> - not added: marking "inapplicable" rules, to be a separate patch
>=20
> Changes in v2:
> - drop 5.6
> - specify additional appropriate types for 6.1
>=20
> iii
> ---
> docs/misra/rules.rst | 50 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 50 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index d5a6ee8cb6..a88c284e7d 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -40,6 +40,12 @@ existing codebase are work-in-progress.
>      - Summary
>      - Notes
>=20
> +   * - `Dir 1.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/D_01_01.c>`_
> +     - Required
> +     - Any implementation-defined behaviour on which the output of the
> +       program depends shall be documented and understood
> +     -
> +
>    * - `Dir 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Su=
ite/-/blob/master/D_02_01.c>`_
>      - Required
>      - All source files shall compile without any compilation errors
> @@ -57,6 +63,13 @@ existing codebase are work-in-progress.
>        header file being included more than once
>      -
>=20
> +   * - `Dir 4.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/D_04_11.c>`_
> +     - Required
> +     - The validity of values passed to library functions shall be check=
ed
> +     - We do not have libraries in Xen (libfdt and others are not
> +       considered libraries from MISRA C point of view as they are
> +       imported in source form)
> +
>    * - `Dir 4.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/D_04_14.c>`_
>      - Required
>      - The validity of values received from external sources shall be
> @@ -133,6 +146,12 @@ existing codebase are work-in-progress.
>        headers (xen/include/public/) are allowed to retain longer
>        identifiers for backward compatibility.
>=20
> +   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_06_01.c>`_
> +     - Required
> +     - Bit-fields shall only be declared with an appropriate type
> +     - In addition to the C99 types, we also consider appropriate types
> +       enum and all explicitly signed / unsigned integer types.
> +
>    * - `Rule 6.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_06_02.c>`_
>      - Required
>      - Single-bit named bit fields shall not be of a signed type
> @@ -143,6 +162,32 @@ existing codebase are work-in-progress.
>      - Octal constants shall not be used
>      -
>=20
> +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_07_02.c>`_
> +     - Required
> +     - A "u" or "U" suffix shall be applied to all integer constants
> +       that are represented in an unsigned type
> +     - The rule asks that any integer literal that is implicitly
> +       unsigned is made explicitly unsigned by using one of the
> +       indicated suffixes.  As an example, on a machine where the int
> +       type is 32-bit wide, 0x77777777 is signed whereas 0x80000000 is
> +       (implicitly) unsigned. In order to comply with the rule, the
> +       latter should be rewritten as either 0x80000000u or 0x80000000U.
> +       Consistency considerations may suggest using the same suffix even
> +       when not required by the rule. For instance, if one has:
> +
> +       Original: f(0x77777777); f(0x80000000);
> +
> +       one should do
> +
> +       Solution 1: f(0x77777777U); f(0x80000000U);
> +
> +       over
> +
> +       Solution 2: f(0x77777777); f(0x80000000U);
> +
> +       after having ascertained that "Solution 1" is compatible with the
> +       intended semantics.
> +
>    * - `Rule 7.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_07_03.c>`_
>      - Required
>      - The lowercase character l shall not be used in a literal suffix
> @@ -314,6 +359,11 @@ existing codebase are work-in-progress.
>        used following a subsequent call to the same function
>      -
>=20
> +   * - `Rule 21.21 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/>`_
> +     - Required
> +     - The Standard Library function system of <stdlib.h> shall not be u=
sed
> +     -
> +
>    * - `Rule 22.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_22_02.c>`_
>      - Mandatory
>      - A block of memory shall only be freed if it was allocated by means=
 of a
> --=20
> 2.25.1
>=20


