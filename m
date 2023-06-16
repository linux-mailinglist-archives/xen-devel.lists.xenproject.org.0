Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9C73280F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 08:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550015.858877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3On-00033U-L0; Fri, 16 Jun 2023 06:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550015.858877; Fri, 16 Jun 2023 06:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3On-00030B-IE; Fri, 16 Jun 2023 06:57:33 +0000
Received: by outflank-mailman (input) for mailman id 550015;
 Fri, 16 Jun 2023 06:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ynE=CE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qA3Ol-000303-Os
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 06:57:31 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe13::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fe04f82-0c13-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 08:57:31 +0200 (CEST)
Received: from AS8PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:20b:311::8)
 by GV2PR08MB8051.eurprd08.prod.outlook.com (2603:10a6:150:79::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 06:57:28 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::ae) by AS8PR05CA0003.outlook.office365.com
 (2603:10a6:20b:311::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29 via Frontend
 Transport; Fri, 16 Jun 2023 06:57:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.25 via Frontend Transport; Fri, 16 Jun 2023 06:57:27 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Fri, 16 Jun 2023 06:57:27 +0000
Received: from ae72e5991994.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6D0CDD4-DF73-4F2E-8C4C-8804304A0718.1; 
 Fri, 16 Jun 2023 06:57:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae72e5991994.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Jun 2023 06:57:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9598.eurprd08.prod.outlook.com (2603:10a6:20b:61a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 06:57:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 06:57:19 +0000
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
X-Inumbo-ID: 0fe04f82-0c13-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyoZ1JjqFNvCAly0Fcxmqd0FMh+/TPd9uuitzR22yKE=;
 b=WPlc7j3BjQvQ2wd04dHXo9aQU6QuWF2Gm8q58/XzXMX9ks7juTbAhCvbHcV3qdHFsV9cYzXocUJyBZJ8ejctuYMmQ7TkoBc+LdKThcvJJ2OHA+IMRs0zNjLpaUO8dbXtEZwvQl6YtDqIMzSrgcBtL9bzl3LPr5LI/7eTfQme43Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bae4f177981c73a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGKDAsxtm8Tpcp1W65wCiG/F6OxlRrCYc3XJEMiETAXvvmruZ91KEAhtyupk6AasBhSvLZk4gNPhgrYG08zCkfXmKx5i1jd2whMaEmMg+Iq09BL6Knf7PiTZGJrHAdpGKD7LgREYiiW6sU2v2/vHPoO/AbmI+xS/wEQEOwDbcpaW0ryEuGwrVW4q/zFIdKDZvSPO2s/1WciSEI1madg+MI5gXt3lpbd3d0anajq81woLP2O5RPpzF4bdHynBHcF2InJQXFFWnEQxlStwYSqRA/0TQPLNPyG/v5uZGK7ebTgoboA/k5TojzWMyK+4eKGQfirKlUsnfAB1TSXQppiamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyoZ1JjqFNvCAly0Fcxmqd0FMh+/TPd9uuitzR22yKE=;
 b=Tku1FKFu6KbNeqS1qTazLMLRzc3b3D/E5uW8IBMUJNaJ6pWQAZJ7WTPZzzP5E2xhs2oPkuIoXnXBIDwZnp3fqbCQLDKCRMGV0PJ82ixbv164ChUuAKMCxrpwY/mtzp3ZyNZPT6DaYW0PM542RoM2htUrnjsNAMe+23jl32LpgkhnUVL+Ajnmb3X7P365HZ1oDjKDJAOT+S72ZO+UFAZKaSoeOm5ebG88b+fKlmOUGxmMFTDEWJDNLeqcyNAaSi5osc4brmtq5LOPTzKTu/U2dzHpswajNd67nOcmAlUzT+LN1TkoF5Fa2wdwcMaEcB4fspff+tT/xWlLA0nfqxYNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyoZ1JjqFNvCAly0Fcxmqd0FMh+/TPd9uuitzR22yKE=;
 b=WPlc7j3BjQvQ2wd04dHXo9aQU6QuWF2Gm8q58/XzXMX9ks7juTbAhCvbHcV3qdHFsV9cYzXocUJyBZJ8ejctuYMmQ7TkoBc+LdKThcvJJ2OHA+IMRs0zNjLpaUO8dbXtEZwvQl6YtDqIMzSrgcBtL9bzl3LPr5LI/7eTfQme43Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] xen/misra: add rules 1.4 and 2.1
Thread-Topic: [PATCH v2] xen/misra: add rules 1.4 and 2.1
Thread-Index: AQHZn9A1cetUSIw+5k+zCggrDNtc/q+M/+mA
Date: Fri, 16 Jun 2023 06:57:19 +0000
Message-ID: <415F37D4-0812-4094-AB35-C304450B06BB@arm.com>
References: <20230615212716.1330929-1-sstabellini@kernel.org>
In-Reply-To: <20230615212716.1330929-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9598:EE_|AM7EUR03FT023:EE_|GV2PR08MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: db3a19f3-93d0-4e0d-d2de-08db6e36f289
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3t7KfhsVWrZQN1woscDhRIl9gEHBVBSLTzoBHjEWT/HSrAMC3d8+L5OHSPbrpLin/Y61OHWa/SA5vjNQbQfj6m9Q6suyJd2SHGGaPbqa8Ee7FRY+zc1hhTBqee2j3pWmtpuD3vSu21jjsqKjAHjOxRWMwUQKIuhpnsyaFkUq2FZ1+30kgdLeOSnEwnbuxJ1uO9jaeWJMbcfQ+d1Wii2/qVKhBekPmABZTFikBo6iPA83BZjGQuawD4hBOa5WfentpeAXmadLQEtioIQQjEW3eaZ5SMNMjW/3AfOiewlnPbqfk93S2gPngbKXQgPd4769b4WLy7aEFNlBgkdNKq7Y/u42bpCUGI5lZBUXQ7bNiIJAMtHl+zqfqo867w/XkAkt9PpL5V6FWuY1Xpo8N33/mnlMtC1tpaLzSoSMw6AdogbDxMQAScJ02b3Gca5GU1THgcvuDHJUZkore98vj5qdPxeAx7G5LAC8QECJrpXuntz4rBT7TYKMf8jgN9QZJgPAHBsDctnl7tI71EJFlBAWO4oSvoe5gHqAijIPJGBEngSDgJ8kot2jXecJyhOoqFLifBcWFMtv9AlxEeMBcmLuGB/WT1BS3R39Sk3992yi6XYMyevoZ4c1YI3uNHUIikceQe3MVNHSw7I3CMAbu3afgno+xucZs0uRyhzidZMQICg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(2906002)(91956017)(64756008)(41300700001)(5660300002)(33656002)(8676002)(8936002)(316002)(4326008)(76116006)(66446008)(66476007)(66556008)(66946007)(6916009)(36756003)(83380400001)(2616005)(71200400001)(6512007)(186003)(53546011)(6506007)(38100700002)(38070700005)(86362001)(122000001)(478600001)(54906003)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ACBAEA67D886FC4586C86DA19DBCC39B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9598
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2acec121-3c9d-4c84-219e-08db6e36edb0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fi+j5LhAn+w3q3/bBrCF3Ek1yHdd39zCH18HMV5SBdoq+EXKg77yExZpHrQ249iQ65ivgSJcDyEX7fQVzh9eoRki0RScSD8qGp6LABZRqCNrL2JtiMQhs0CZJn5BqZin8n7ObXRpEJp3g7Bs9T8guBOy3+WCkGCGokSpNMnd5JaqeSQrlzDK9W+FkRL+rnJEGCe7+Ub8RXLcjY1pPM7MK1X8/m/zhLrbcF9z+HNLF6KEbRqWtS+zAsQHpkcRIMJEaykDoYHUlGxcTgpgGtOT13kkX9rEZk2XiHJkIHHqFDWZL2UQEoUZeCm1eqUaCtdEsqg9quO1s6yN48qLpTKxsOVUUF4Ihtl59ZrURzMTDfKfxipj1KrRsaVclGIzapEsKwbMxYbbMM/1zjfDFIBxTIZfQA2Fq8rbFOVkJW17XrVs3W16ci3ZmpOSGKxRRUGN9zlTRIWfMOCPoSruJ3vitM3u1PxuldhFaoNBNREBKvcXgQyu6HfD2ajXIO02iup6fDoVedp7HsPmUSFkhizveK0uxnQlijO33fXHwaa2sl6lGhWylTLtgtK4iSGko5CHJngJ7x6g9H3gWrPITo52fY6h06gr5J5Bx0HFLMao/zr172Np7ezHeOdeDDBqFYA6FkW83hFLmAiHsuQJYKFE0f4elqdGSQcytH3q7D0lwa1mHDmM9qLD9F8Pndv7cMxYbypKCrenJ3sN7Kf5Ngtmf5Hyw8oaemIhqp3VFNQASjodR7QO2627oktaW1mubN9prWLvDFax4IlGdqMWftSYxQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(186003)(26005)(6512007)(36860700001)(53546011)(336012)(6506007)(70586007)(2906002)(4326008)(70206006)(82310400005)(47076005)(83380400001)(2616005)(33656002)(86362001)(36756003)(40460700003)(81166007)(54906003)(82740400003)(356005)(6486002)(41300700001)(6862004)(5660300002)(8676002)(8936002)(316002)(40480700001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:57:27.8527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db3a19f3-93d0-4e0d-d2de-08db6e36f289
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8051

Hi Stefano,

> On 15 Jun 2023, at 23:27, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Also add a comment at the top of the file to say rules.rst could be
> changed.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
> Changes in v2:
> - add link for 1.4
> - expand 1.4 comment to say it could be revisited
> - add comment at the top
> ---
> docs/misra/rules.rst | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index a88c284e7d..11b9c42b70 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -32,6 +32,9 @@ violations are meant to be documented as deviations, wh=
ile some others
> should be fixed. Both compliance and documenting deviations on the
> existing codebase are work-in-progress.
>=20
> +The list below might need to be updated over time. Reach out to THE REST
> +maintainers if you want to suggest a change.
> +
> .. list-table::
>    :header-rows: 1
>=20
> @@ -90,6 +93,18 @@ existing codebase are work-in-progress.
>        behaviour
>      -
>=20
> +   * - `Rule 1.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/>`_
> +     - Required
> +     - Emergent language features shall not be used
> +     - Emergent language features, such as C11 features, should not be
> +       confused with similar compiler extensions, which we use. When the
> +       time comes to adopt C11, this rule will be revisited.
> +
> +   * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_02_01_1.c>`_
> +     - Required
> +     - A project shall not contain unreachable code
> +     -
> +
>    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_02_06.c>`_
>      - Advisory
>      - A function should not contain unused label declarations
> --=20
> 2.25.1
>=20


