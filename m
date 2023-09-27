Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656687AFDC4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608713.947368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPd5-0004iY-Su; Wed, 27 Sep 2023 08:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608713.947368; Wed, 27 Sep 2023 08:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPd5-0004fh-QH; Wed, 27 Sep 2023 08:10:43 +0000
Received: by outflank-mailman (input) for mailman id 608713;
 Wed, 27 Sep 2023 08:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzin=FL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qlPd4-0004fb-3d
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:10:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58f64885-5d0d-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 10:10:41 +0200 (CEST)
Received: from AM6P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::29)
 by AS1PR08MB7404.eurprd08.prod.outlook.com (2603:10a6:20b:4c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 08:10:34 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::5e) by AM6P195CA0016.outlook.office365.com
 (2603:10a6:209:81::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Wed, 27 Sep 2023 08:10:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Wed, 27 Sep 2023 08:10:33 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Wed, 27 Sep 2023 08:10:33 +0000
Received: from cf47db4c4b9c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4747FC06-7F32-4AE8-A5A6-635AB6183D4D.1; 
 Wed, 27 Sep 2023 08:10:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf47db4c4b9c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 08:10:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5443.eurprd08.prod.outlook.com (2603:10a6:208:183::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 08:10:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 08:10:22 +0000
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
X-Inumbo-ID: 58f64885-5d0d-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWCdekwgOyw2pnoC9bNUzUiBI411Sa8DBtQeBo/38i8=;
 b=Ldt3UjESY259USfISGcFblgw4pqsFHQzG/9WNz50gBOoUJC80QDM2T7xd3ci1OnUuQmuIWQVBM/sPphYZVrrsrsi/UsFJBVKZJuyrdp87w/QIJtjej0vHlCDU/oGzeg8v3XwqCuQHd0/pjfFTr10ll4C1ujMQDP4Rdrz8LkJpWo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a0e935e3b1cd976
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iljvADfzsmQGBDnEA55HHJwUZEAoN4Fa2E8Rvhc/CqDLtinurhCVSPlaV6pAiFcAx+fz/KvNZKmG+TjQBUQArNkcA+f8pCWhIG3EBFiNpt5fvL6V03ZiaWkhJVnTnoJD7xPh1HpIHTpykG0Uqgo6O3ZxMZYif2CO1NyGvJditGQPJJO4YEDdYBdX6FBIlHB/E9Ob15WmovWG4py5oGzrzOBorQo54OT0QzLBNdYAmTX1O7lbhg1QWFaB6krPVaJrZgA9dZkO/Y788mKuwuoP/JDQHHSJ/4OfQwFqcb0Rl5+Rt9RLQhKCYpjCS6R9CLTa2rcRwFnkqiNpbgr8J2VqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWCdekwgOyw2pnoC9bNUzUiBI411Sa8DBtQeBo/38i8=;
 b=J5tI6/lsC4YEI4wEkRChVM4lKjDsmnFwgrNJSkIjmMjVpMadN87xuJWnlhsUzcyk1GY0bMxxo9wzLTlfWvKAIohlGgGtyu1SOt7pgSpLivvZgu94fuUa8bIF5pnDB7z84ouiPn7OxjaU6fQnfabdU+yC3hcljperiO5dpI72gEspu37PmkNwTQ2u17nZGifZNGIUfENgY2hNWLyzeCQvT8VrOS1QupGVv6Vogsxh4wre8zKu75OOr8drT0LLyRx7Jh9PAcO6Zhwc/MqaxvNXK9+k36nvPV1Yz1rn4l5XsinV7MuLRp1NZO6doA7uBcMVAFCxhELk5TFK8qv4AxIOaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWCdekwgOyw2pnoC9bNUzUiBI411Sa8DBtQeBo/38i8=;
 b=Ldt3UjESY259USfISGcFblgw4pqsFHQzG/9WNz50gBOoUJC80QDM2T7xd3ci1OnUuQmuIWQVBM/sPphYZVrrsrsi/UsFJBVKZJuyrdp87w/QIJtjej0vHlCDU/oGzeg8v3XwqCuQHd0/pjfFTr10ll4C1ujMQDP4Rdrz8LkJpWo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>,
	"nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add 14.3
Thread-Topic: [PATCH v3] docs/misra: add 14.3
Thread-Index: AQHZ4pLyktuvAHNnhUGsSPCCOW2ABbAubugA
Date: Wed, 27 Sep 2023 08:10:19 +0000
Message-ID: <A145D22B-2BD0-4788-BC33-E4E4F936ED43@arm.com>
References: <20230908202723.1641469-1-sstabellini@kernel.org>
In-Reply-To: <20230908202723.1641469-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM0PR08MB5443:EE_|AM7EUR03FT047:EE_|AS1PR08MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 2178a791-ccc8-4d0a-294c-08dbbf31390a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 q8svTj18IW31Cp+0muV4f3UvMrvSb94/T2caroixF1LJt+eILjEW8rqrFNFlNFwqL8b9TkzbQ3qPXTmHoj1bZqA7Mpu1BizoadqSZd/Oig/jon7m0iaZuWhdqHSbsCvfjhOzGhePth5t4KOfqHb5JMw66oSksyC11QtEKvauJli8fbtEz6fl60wA85uN3ddzJYGCBr9rH2ji0XGvMZvceu3AtvHn99zyBB4zH9sz/a59ZOxUfQX6eq+/F5DsJR6GdWyDcnDEwzLjHra00O/sPSAJ8x4SWJ+FUO7cTuwTVQ930twfUDqZX1KOq3w7PqS3GvCsuUZY2iC4Ecv0DnROxbKYUq/+wHJqLux5u9l3xOloftp4FKM9hQVLVG3wAWi1SWqZkDgGvdfBgI00oZ55LPIaFXLHZl0RUkO6dqCrW3gg+dLZdRaoPHuIS675DS0CCmuMV7HE8BisOcLRvHG5jZic5mV9tloNJAPITrcYLpVRnIiR9nEDRA0I5Ndal4uJk0ywFHVN5FY8Rtk7cZ3k6LXQ0vX9paBofrxYQAe7PiZI0caipqaBHiX8AjwrVWytO1lpVvS2OBfoDF4xvf+0nDnMGD/TwLp6nxKzHopnrTGaO+G+iFLkerXLFWyEbbmHwuyShSdP65OurquN1S5kJWd16w61SLz3E6N57Lsj0Wzd5sHBZ3aJosqb3K+0hmXp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(376002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(41300700001)(5660300002)(2906002)(6486002)(7416002)(2616005)(54906003)(6916009)(316002)(8676002)(8936002)(4326008)(6512007)(478600001)(6666004)(6506007)(53546011)(71200400001)(64756008)(83380400001)(66476007)(66556008)(66446008)(66946007)(91956017)(76116006)(33656002)(36756003)(38070700005)(122000001)(38100700002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9AED7E48D1C6994EA40F023EC0A162DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5443
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1b2227f-1d7e-44a3-93a4-08dbbf3130c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Drh4jkNgQdDViztQqsgBTHFAFwEbkJKGFcppds4laxXxW4RqFJNf9VJhkiLSrnvbo8hOBgQ5TpR8RFRli6G3+bxiortpgR7M9MFHRj3groYymXm+PSA/WiL7/DVgRzYcglSkWjXzv2o9HmCP/xdS57pXLHPGrK7Yp73ndt2K89kgQ5TYn7ok15XArXzHgQ5sdT+9qeyGe8B2NJxVbW2u9tAaOeZ12iV7QSdCmY0Q6Mo/f2q/RFaRZs3bcfPHXvJ6uAeYW4pJHRUiJMBE+Xe9dYuK6OYT3RPPE+gw6KPAtTMjhWvihdMPr8YbQAW0afGao8+daRF8cBshiIf+3mJbsWAMdZklzv0Om5nA0KLQTuMiNg6mpo7lOmK7XhRHV8AMwMGeVoapVG5nGdruA268IwMnu0+Gc8WJWfYQhNr8CEKabuBFphCj2wp5lRzr6OURr+0pMW8Medj8oZJd/Yd47IMOfXabKhhooaybVqQGws1q0mzBzCtQdo0As1x94aYKMK8lcppTrogfYDljkTbXKU3a0TeaDtcqJfYoGkcW1BBsENeHWnEnmzNT0jyk3dj5TNQXP3sELgEYmC9lZroOQqTvQbHm46wp/ydwGZnmA2PzVBArjHIGt2HZA75+39pwaT2bve/sAjgXAqOZPQtdK/AlVfxT6GBt6hWKv4IzJBK7L1YtOEIT0bmvZ3SjzWOcu0a40yhTFg1637ebS0ZtUookrmylLGRZ8y0ObhkbX3vCFepbYWyuPBeoyBFxo9z4UR6FLzbNHSNRxsVQbHz1Bw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(36840700001)(46966006)(40470700004)(40460700003)(2616005)(53546011)(26005)(336012)(6506007)(478600001)(6512007)(5660300002)(47076005)(6486002)(6666004)(2906002)(83380400001)(8936002)(6862004)(4326008)(8676002)(70586007)(54906003)(70206006)(316002)(41300700001)(36860700001)(356005)(86362001)(81166007)(33656002)(40480700001)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:10:33.3702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2178a791-ccc8-4d0a-294c-08dbbf31390a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7404

Hi Stefano,

> On 8 Sep 2023, at 22:27, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Add 14.3, with project-wide deviations.
>=20
> Also take the opportunity to clarify that parameters of function pointer
> types are expected to have names (Rule 8.2).
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

I am still not quite sure if we should accept a rule if we are deviating
on so much cases but as we can revisit anyway:

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v3:
> - add ,
> - add switch(sizeof(...)) and switch(offsetof(...))
> ---
> docs/misra/rules.rst | 15 ++++++++++++++-
> 1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 34916e266a..ac76e20a9c 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -234,7 +234,8 @@ maintainers if you want to suggest a change.
>    * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_08_02.c>`_
>      - Required
>      - Function types shall be in prototype form with named parameters
> -     -
> +     - Clarification: both function and function pointers types shall
> +       have named parameters.
>=20
>    * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_08_03.c>`_
>      - Required
> @@ -385,6 +386,18 @@ maintainers if you want to suggest a change.
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
> +       a project-wide deviation on if, ?:, switch(sizeof(...)), and
> +       switch(offsetof(...)) statements.
> +
> +       while(0) and while(1) and alike are allowed.
> +
>    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_16_07.c>`_
>      - Required
>      - A switch-expression shall not have essentially Boolean type
> --=20
> 2.25.1
>=20


