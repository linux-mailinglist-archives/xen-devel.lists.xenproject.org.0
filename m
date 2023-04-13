Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8339F6E0DA2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 14:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520698.808583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwMM-0004Vz-Uq; Thu, 13 Apr 2023 12:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520698.808583; Thu, 13 Apr 2023 12:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwMM-0004SZ-Pr; Thu, 13 Apr 2023 12:47:30 +0000
Received: by outflank-mailman (input) for mailman id 520698;
 Thu, 13 Apr 2023 12:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73wY=AE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pmwMK-0003wO-TA
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 12:47:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58fe0859-d9f9-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 14:47:28 +0200 (CEST)
Received: from AM8P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::25)
 by DU0PR08MB10365.eurprd08.prod.outlook.com (2603:10a6:10:40b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:47:25 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21b:cafe::7b) by AM8P251CA0020.outlook.office365.com
 (2603:10a6:20b:21b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 12:47:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 12:47:25 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Thu, 13 Apr 2023 12:47:25 +0000
Received: from c0ea31a0b597.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BE3E619E-DE64-4BA1-ACF0-87A088E72251.1; 
 Thu, 13 Apr 2023 12:47:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0ea31a0b597.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 12:47:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB9303.eurprd08.prod.outlook.com (2603:10a6:150:d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:47:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 12:47:11 +0000
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
X-Inumbo-ID: 58fe0859-d9f9-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNNA5Fs2ECk9W1QxRKusEU1FI9146iq0S4uPgQ9X4p4=;
 b=qPJpbpTU5aILNCwtzCg1/HJiplJXKfymVlgW5Tnbglmwy/TjkqF2QMbvR9+dFtClmMAI0Z/HuD37KzNgP9WhZ2pauLOH9GXR8VwczVYJBQ4PZWc0ii70y1G/DkUYm9ltACVe2o6/eHuG4/w5rUUz02MsZ3FomUSglHV7JkHGyEg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc6176764ed79353
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8kOLa0CoF0sajb3xxWz98uzFRyIz1fUTjOgb7oIlc+9sBg6O+cTx93N8jvWgYAuaQ1csg4dpc3oGZ9L5aRpOq2TX0sV1YyDmJKBMai+spUtaAr6tnTNuboyLu97w+dQzlH8iotN/H2RgJHuhsJQ7bT5nPM24P1AJ0lg+H4Y6y1I2vcNrZT6sayke1PUxd/9GuvdUQUemtOUGOQw22CE7GF/5EHX3NGheJ760C9upd/PIc+pR7DZx5C6Y21x9/xOblKzU6GJzaY/7nkHECSbLhsAeEu6N1NB5IN8Tb9fKD2DaiinWhZ0Rzx3zKu64YS3SpyMIA1eyeyw8HoGUIbDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNNA5Fs2ECk9W1QxRKusEU1FI9146iq0S4uPgQ9X4p4=;
 b=arapsL8xJNiNzwU+7hkRQ3kdnSeQMrW9mU4wwmuQNiXEfmzi8bZK0BFKcnJIrrWf8l8TAUASSnNg728u5+mjUxee9yoTG4ABVjfiQhyvy7u8kNNlxxNMjxLlHhKDg17yf7ZJzuxL/UFbaSjITkcT1tq8xxWU2A2TKKdlh3zJm0gZm3KAKWaE3xvC7Ff4J4/AtPaOG0JGgFPrkQjEw468+X/Gwn290/FCvjHWBKV/lkCLDDhqluP+WXyT305NYhVOhT9wpVdhpDYwFyulHkHJSeym5y4/IUhwmHFqJ/Uf34rDchFm6FYbfYJ6SiM/2pJcTEMoy/R2Agr4QtdJhmkQdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNNA5Fs2ECk9W1QxRKusEU1FI9146iq0S4uPgQ9X4p4=;
 b=qPJpbpTU5aILNCwtzCg1/HJiplJXKfymVlgW5Tnbglmwy/TjkqF2QMbvR9+dFtClmMAI0Z/HuD37KzNgP9WhZ2pauLOH9GXR8VwczVYJBQ4PZWc0ii70y1G/DkUYm9ltACVe2o6/eHuG4/w5rUUz02MsZ3FomUSglHV7JkHGyEg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Topic: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Index: AQHZbSQrDABwD/+it0m8/HJNYINaK68pMcyA
Date: Thu, 13 Apr 2023 12:47:11 +0000
Message-ID: <9486E559-879E-49AF-9145-B929A8EE9301@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-3-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-3-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB9303:EE_|AM7EUR03FT045:EE_|DU0PR08MB10365:EE_
X-MS-Office365-Filtering-Correlation-Id: 235f773e-a398-4c4b-704c-08db3c1d3bac
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qtpnxEsJglGJtaVJS1gd0+NAc2h/fDA7anNR0lRTLNdnQxZS6wnxT8sS+SeEjsi6dJJFOCx0t3w4t23blFlbzXbCIldPwEQ8e66O/0/Lj4U6lNQxeLiJp7J+PmgAwl6m34GhP677CxwbLXcO+Dxay8YpzVQtTZvEx4KyETTcLu/IE5Mb3I843TWz8bkPFejTaVAa3QjN8qhnR+/K7wbwrhNvVF1prtBVh6ztG2S9V0kW0L9mCdYAmV9ZBu7eKFwAvclEOEHxMIXVCtZIJhkYy9C6uinUnznTjXwrR3J/Lqb4RfJpW6rStRcIj6Xsm48WTN8xX89NV/oGIseyfmdiGn3/fDaQOn+o+m4HjoXRSNirff5ClOj03ZJnV7BLkZQsjMeao8ruTU47KvYwVEWKq/xyaOQlv1OwzYtHuLdVv3hD8JQE+Ujzvk2MSopRw5BZm4Mkzm3lmxDmLYu0tahlpVGomAvZ+Z0bpMrmsC5IVw8U2fdxfJqzf7tlXCsuKfEB+F1Dhqnav04nGKC7+xBMcNkT5sQkU608l2Q9AdsfpbQ47G6AtgzPhiJ8MunEFuZiS7zkNIh2VVINm8PL35bhAZgB9C5GH3OD/hqdrCBD3H1qq3NxskQkCgq8mO+EDVWW5H/QOwPkWUgWcc9NtwyjBw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(71200400001)(6486002)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(36756003)(76116006)(91956017)(37006003)(2906002)(38070700005)(86362001)(122000001)(41300700001)(33656002)(5660300002)(8676002)(8936002)(6862004)(316002)(38100700002)(478600001)(54906003)(6636002)(53546011)(6512007)(6506007)(26005)(2616005)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E5F57B3FF502044E8FC0B670546A37D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9303
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	67c33dcd-4937-410a-dae4-08db3c1d3353
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F9LRtjO4DVq56VTr+Tuyy8SAg4pQfZTYyUsFaManOQpsCQg1F3kYVIINKfz8gx1Thp4VeuBnRBDoVuPeZFbLDxE8x1hIb42M3vTfRqgbEXzeJQ9O3xvJED9tkRfvDcFMqHn70jdDmmoTRT0XomSh+y7AOAG/1QBeqiE+M8F1E+LSCUFinGUhcmNpxzEZe7YxLNbaa+R2AEuM/BDel8WiHOS3b3mheG7pLUGArlEMUaZmAZEMy8bCtrcAlxsMoWxVbUprs4udrKuVcdHNU3QsQiQR+FyKUW9RydfQlC5+aYzhfwl7/oPIGPNW+Df0SArMDhzNM4JPdXr1wOazo8nWNaChCn8g+xjnP3lkuIsPuA6KuBSHg2ZXr3h4AUN5hsBdjRaOgmgWdWFiHGyi2yzraUIJoO9Udi8zdSnwsyLfdLf3mAcmZ7OCuSvqa/a2+12/sDyZba8llbltcOFqn/zhUzJonW9Ro/vYLPswpphnxvDCozr3Rh6Jyd2pQlqYezLWvsW+hVRYGTv/5KRKNZx/X+REYAU5hXKMTnaAsOR1RCSc4XAuKsaStdXjM5tNYloi/WffTRidgUFlZvsoUFuCi9WJLjW3PB6LguTWrmJyS9YIcDTy8vS5A0rhAkEg6xxjCj7V7tBDXfuQAZGEaYXsplux5oK5jJnxZv0m3BK0VueKfvMvBuMtknbxni4gLYmrwu7EVVbFrLK5KK6PPVjIig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(40480700001)(82740400003)(2616005)(336012)(47076005)(53546011)(40460700003)(6506007)(6512007)(2906002)(26005)(33656002)(186003)(82310400005)(81166007)(356005)(8936002)(83380400001)(70206006)(70586007)(86362001)(6486002)(478600001)(36756003)(6636002)(5660300002)(6862004)(316002)(4326008)(8676002)(54906003)(41300700001)(37006003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 12:47:25.5150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 235f773e-a398-4c4b-704c-08db3c1d3bac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10365

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Add sve_vl field to arch_domain and xen_arch_domainconfig struct,
> to allow the domain to have an information about the SVE feature
> and the number of SVE register bits that are allowed for this
> domain.
>=20

Please mention in the commit message that you are bumping
domctl interface version.

> sve_vl field is the vector length in bits divided by 128, this
> allows to use less space in the structures.
>=20
> The field is used also to allow or forbid a domain to use SVE,
> because a value equal to zero means the guest is not allowed to
> use the feature.
>=20
> Check that the requested vector length is lower or equal to the
> platform supported vector length, otherwise fail on domain
> creation.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

With the commit message fixed:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from v4:
> - Return 0 in get_sys_vl_len() if sve is not supported, code style fix,
>   removed else if since the conditions can't fallthrough, removed not
>   needed condition checking for VL bits validity because it's already
>   covered, so delete is_vl_valid() function. (Jan)
> Changes from v3:
> - don't use fixed types when not needed, use encoded value also in
>   arch_domain so rename sve_vl_bits in sve_vl. (Jan)
> - rename domainconfig_decode_vl to sve_decode_vl because it will now
>   be used also to decode from arch_domain value
> - change sve_vl from uint16_t to uint8_t and move it after "type" field
>   to optimize space.
> Changes from v2:
> - rename field in xen_arch_domainconfig from "sve_vl_bits" to
>   "sve_vl" and use the implicit padding after gic_version to
>   store it, now this field is the VL/128. (Jan)
> - Created domainconfig_decode_vl() function to decode the sve_vl
>   field and use it as plain bits value inside arch_domain.
> - Changed commit message reflecting the changes
> Changes from v1:
> - no changes
> Changes from RFC:
> - restore zcr_el2 in sve_restore_state, that will be introduced
>   later in this serie, so remove zcr_el2 related code from this
>   patch and move everything to the later patch (Julien)
> - add explicit padding into struct xen_arch_domainconfig (Julien)
> - Don't lower down the vector length, just fail to create the
>   domain. (Julien)
> ---
> xen/arch/arm/arm64/sve.c             | 12 ++++++++++++
> xen/arch/arm/domain.c                | 27 +++++++++++++++++++++++++++
> xen/arch/arm/include/asm/arm64/sve.h | 12 ++++++++++++
> xen/arch/arm/include/asm/domain.h    |  5 +++++
> xen/include/public/arch-arm.h        |  2 ++
> xen/include/public/domctl.h          |  2 +-
> 6 files changed, 59 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
> index 6f3fb368c59b..78f7482619da 100644
> --- a/xen/arch/arm/arm64/sve.c
> +++ b/xen/arch/arm/arm64/sve.c
> @@ -6,6 +6,7 @@
>  */
>=20
> #include <xen/types.h>
> +#include <asm/cpufeature.h>
> #include <asm/arm64/sve.h>
> #include <asm/arm64/sysregs.h>
> #include <asm/processor.h>
> @@ -48,3 +49,14 @@ register_t vl_to_zcr(unsigned int vl)
>     ASSERT(vl > 0);
>     return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
> }
> +
> +/* Get the system sanitized value for VL in bits */
> +unsigned int get_sys_vl_len(void)
> +{
> +    if ( !cpu_has_sve )
> +        return 0;
> +
> +    /* ZCR_ELx len field is ((len+1) * 128) =3D vector bits length */
> +    return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
> +            SVE_VL_MULTIPLE_VAL;
> +}
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index adb6ace2e24d..769fae8fe25e 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -13,6 +13,7 @@
> #include <xen/wait.h>
>=20
> #include <asm/alternative.h>
> +#include <asm/arm64/sve.h>
> #include <asm/cpuerrata.h>
> #include <asm/cpufeature.h>
> #include <asm/current.h>
> @@ -550,6 +551,8 @@ int arch_vcpu_create(struct vcpu *v)
>     v->arch.vmpidr =3D MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);
>=20
>     v->arch.cptr_el2 =3D get_default_cptr_flags();
> +    if ( is_sve_domain(v->domain) )
> +        v->arch.cptr_el2 &=3D ~HCPTR_CP(8);
>=20
>     v->arch.hcr_el2 =3D get_default_hcr_flags();
>=20
> @@ -594,6 +597,7 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
>     unsigned int max_vcpus;
>     unsigned int flags_required =3D (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_=
hap);
>     unsigned int flags_optional =3D (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CD=
F_vpmu);
> +    unsigned int sve_vl_bits =3D sve_decode_vl(config->arch.sve_vl);
>=20
>     if ( (config->flags & ~flags_optional) !=3D flags_required )
>     {
> @@ -602,6 +606,26 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
>         return -EINVAL;
>     }
>=20
> +    /* Check feature flags */
> +    if ( sve_vl_bits > 0 )
> +    {
> +        unsigned int zcr_max_bits =3D get_sys_vl_len();
> +
> +        if ( !zcr_max_bits )
> +        {
> +            dprintk(XENLOG_INFO, "SVE is unsupported on this machine.\n"=
);
> +            return -EINVAL;
> +        }
> +
> +        if ( sve_vl_bits > zcr_max_bits )
> +        {
> +            dprintk(XENLOG_INFO,
> +                    "Requested SVE vector length (%u) > supported length=
 (%u)\n",
> +                    sve_vl_bits, zcr_max_bits);
> +            return -EINVAL;
> +        }
> +    }
> +
>     /* The P2M table must always be shared between the CPU and the IOMMU =
*/
>     if ( config->iommu_opts & XEN_DOMCTL_IOMMU_no_sharept )
>     {
> @@ -744,6 +768,9 @@ int arch_domain_create(struct domain *d,
>     if ( (rc =3D domain_vpci_init(d)) !=3D 0 )
>         goto fail;
>=20
> +    /* Copy the encoded vector length sve_vl from the domain configurati=
on */
> +    d->arch.sve_vl =3D config->arch.sve_vl;
> +
>     return 0;
>=20
> fail:
> diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/=
asm/arm64/sve.h
> index 144d2b1cc485..a4c53e3e8e2e 100644
> --- a/xen/arch/arm/include/asm/arm64/sve.h
> +++ b/xen/arch/arm/include/asm/arm64/sve.h
> @@ -13,10 +13,17 @@
> /* Vector length must be multiple of 128 */
> #define SVE_VL_MULTIPLE_VAL (128U)
>=20
> +static inline unsigned int sve_decode_vl(unsigned int sve_vl)
> +{
> +    /* SVE vector length is stored as VL/128 in xen_arch_domainconfig */
> +    return sve_vl * SVE_VL_MULTIPLE_VAL;
> +}
> +
> #ifdef CONFIG_ARM64_SVE
>=20
> register_t compute_max_zcr(void);
> register_t vl_to_zcr(unsigned int vl);
> +unsigned int get_sys_vl_len(void);
>=20
> #else /* !CONFIG_ARM64_SVE */
>=20
> @@ -30,6 +37,11 @@ static inline register_t vl_to_zcr(unsigned int vl)
>     return 0;
> }
>=20
> +static inline unsigned int get_sys_vl_len(void)
> +{
> +    return 0;
> +}
> +
> #endif /* CONFIG_ARM64_SVE */
>=20
> #endif /* _ARM_ARM64_SVE_H */
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index e776ee704b7d..78cc2da3d4e5 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -31,6 +31,8 @@ enum domain_type {
>=20
> #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>=20
> +#define is_sve_domain(d) ((d)->arch.sve_vl > 0)
> +
> /*
>  * Is the domain using the host memory layout?
>  *
> @@ -67,6 +69,9 @@ struct arch_domain
>     enum domain_type type;
> #endif
>=20
> +    /* max SVE encoded vector length */
> +    uint8_t sve_vl;
> +
>     /* Virtual MMU */
>     struct p2m_domain p2m;
>=20
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index 1528ced5097a..38311f559581 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -300,6 +300,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> struct xen_arch_domainconfig {
>     /* IN/OUT */
>     uint8_t gic_version;
> +    /* IN - Contains SVE vector length divided by 128 */
> +    uint8_t sve_vl;
>     /* IN */
>     uint16_t tee_type;
>     /* IN */
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 529801c89ba3..e2e22cb534d6 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -21,7 +21,7 @@
> #include "hvm/save.h"
> #include "memory.h"
>=20
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
>=20
> /*
>  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> --=20
> 2.34.1
>=20


