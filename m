Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6FE6E65BA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 15:22:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522877.812525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polHK-00024u-6Z; Tue, 18 Apr 2023 13:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522877.812525; Tue, 18 Apr 2023 13:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polHK-000226-3m; Tue, 18 Apr 2023 13:21:50 +0000
Received: by outflank-mailman (input) for mailman id 522877;
 Tue, 18 Apr 2023 13:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1polHI-000220-KF
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 13:21:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f874097d-ddeb-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 15:21:47 +0200 (CEST)
Received: from AM5PR0301CA0014.eurprd03.prod.outlook.com
 (2603:10a6:206:14::27) by AS2PR08MB9295.eurprd08.prod.outlook.com
 (2603:10a6:20b:599::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:21:45 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::8c) by AM5PR0301CA0014.outlook.office365.com
 (2603:10a6:206:14::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 13:21:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.21 via Frontend Transport; Tue, 18 Apr 2023 13:21:44 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Tue, 18 Apr 2023 13:21:44 +0000
Received: from 03b4f212f8aa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 65F6F6F3-417C-4630-85B4-892963CB7D7E.1; 
 Tue, 18 Apr 2023 13:21:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03b4f212f8aa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 13:21:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6115.eurprd08.prod.outlook.com (2603:10a6:20b:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:21:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 13:21:31 +0000
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
X-Inumbo-ID: f874097d-ddeb-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+Jl7JSPnutaULJ58g5w7OynAPuCNtNpSrzK8J4VLJo=;
 b=arfwS7BWFuTbIu9EgujLOBB4FBlwgrqIR0tsbgBWC52/lfT1EpvGirbvUQs5PJnHQVP79KHB4i+YXyO7ymU++45USPuKkiX0YV8VIfFE8XNVyu9ytN8nWo+z3ZzAqj/36PuTvWtrcDUp7No3NdMtrnqsLefWnABJ4AQcV5Jv5dI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ce952031f4f546f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwkQXWeCYeKtxw0C77FsKeqGT9WX9hX0Ebpsm+o13/U3zNJX6US20kUIZO2QbIGlcw+PQPwQ81ANNvTmZeHPnouBBPQnFHrSXVZnjAhr3zNdOcfPO+WLcLaZQCBA00CC+wqhrq0nbyU+K4FnfYDe0DFAQLT8nhHACMQ72D2JbyOe5yWduM4DzOz+kU/1eAFoBvcBBLONnM1CKkfud1DTnjMHDFzQZxRwlhYqoeHzDKXC+mrdvt0d2Soyi7ZpjlI8lY7ok+Wd6YCwW1+PyRHDrGHw+f+6zD8RkpXtisCZzXEQCQckJAaXQcnoGOFDK0eJ4jvp2tzx20OjN4v8Mc0TZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+Jl7JSPnutaULJ58g5w7OynAPuCNtNpSrzK8J4VLJo=;
 b=JtoWJLd/fndbGibM3/PVNi+Btb6yODuARo0j1cCACCQqixJu0SeZFF9bFZSEjTGozGY5YqGVWp78vx5wrSJHT8icb10gxk8twZgpL/uq6j3ZRN0oUS9PjEhFxd6vPn5++2z7QFArYb6Ilt6IGFPIAJBNFkt+dXJxB4G+XGwiyXQXU2Gy7Enyd8HvwpuiLITNICiezaoTMKAL6nmfnU7HtRpXuhpbXqeQjymlipNmO2bP6G7PefCWQ4LFAMpM18T+sFDX3UsSSX4DYYqOFvTzlrCQ7Y+uh+Hl63r2+p9mJjKqO3tV/cd6Q3TNh0pkSWz6vFHa4EaBwKBbtCcGYAvKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+Jl7JSPnutaULJ58g5w7OynAPuCNtNpSrzK8J4VLJo=;
 b=arfwS7BWFuTbIu9EgujLOBB4FBlwgrqIR0tsbgBWC52/lfT1EpvGirbvUQs5PJnHQVP79KHB4i+YXyO7ymU++45USPuKkiX0YV8VIfFE8XNVyu9ytN8nWo+z3ZzAqj/36PuTvWtrcDUp7No3NdMtrnqsLefWnABJ4AQcV5Jv5dI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 11/12] xen/arm: add sve property for dom0less domUs
Thread-Topic: [PATCH v5 11/12] xen/arm: add sve property for dom0less domUs
Thread-Index: AQHZbSQwrRQ9/UblkkiINOEljpHZc68xD8SAgAAHRwA=
Date: Tue, 18 Apr 2023 13:21:31 +0000
Message-ID: <91C846EF-CA01-4D8B-8D02-51ABA35B26E7@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-12-luca.fancellu@arm.com>
 <5DF67AEC-54FC-4742-8377-995AFB390EFD@arm.com>
In-Reply-To: <5DF67AEC-54FC-4742-8377-995AFB390EFD@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM9PR08MB6115:EE_|AM7EUR03FT047:EE_|AS2PR08MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a1ae97-f384-485f-2500-08db400fdb40
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Zu0i1ZwH0DMmhKRzawn+cBz6gyqciKq/cXa8IG97Z73IeUx1mFODit7CodOp6YNozR2YSZLeCvoLPqA90v9kBtnanoiQ3B+zc3p+ILwkPJq4DvmW/gkS766OhEEq6TJnwryFRFDcVsY2U+Etz0bWpB1P7JfmFdFf81fdij58tPCXX7qVM/j/CsaATZ3IPismh+h6LlBC8ESiqqMEeSf/1O/mWQx+EfEL7FiMIs7ko+PYR1lhVY0ZA5P+gw0JilpKcGttaaYwpu7Rq+WZCsUyt5RuvqFqQ7fhNwaBiKDHEM9UeLU5/Oe3pgFlZuAOZd8VLJdcAPTUzHhbaZRBAaTrhm8Vtct000nsROJWNJcpXoikMXW0pkpWQ29o8yv6L3V4YLyJOkmB+ZJoPndP60wHfd9vPnvJbN50cY1MqgCMemw6VaCeTwt0R+InveV4P7cy9N1QEHTnmSZwKqrwNtH7f1nb2xSE+97G6nyioAOA0WiJHjKzu+2PKjrExIWxCPYp/YpjUeC54Ytyts1ggOMuOawe++MqpNlHPt+Mjd8rKFQhRXSDX+klWwlmjU5mvjqKAReEUt4Xsv1poecHXsF0eWhvXVxnO5DmjAmwMLS99RlioTeKrr4o/BnV1kpuyrWoPu23TgqFXobf3FXunIk69uyiJ2P+rMiLRfiq9GySECY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(478600001)(86362001)(71200400001)(2616005)(36756003)(83380400001)(33656002)(6512007)(6506007)(53546011)(186003)(38070700005)(38100700002)(122000001)(64756008)(76116006)(66556008)(66946007)(66476007)(316002)(66446008)(2906002)(4326008)(91956017)(8936002)(5660300002)(8676002)(6862004)(41300700001)(37006003)(54906003)(6636002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A6353425C0BDFE4E9DA089F57BB9B25C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6115
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab856496-962d-4e43-3a50-08db400fd30c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qULi76ywHedW+x1GFSTGV+E7tbmv5Glym8rpMLh4ml/R7d1paAcYiCx0B9kflyXvc0BzAzeEfaCyUaaLOlfzRhHV9yMusJ3RwMoe7pmjK/S/IXiv1058nWeBzNT4NbJKDLJxQ6mRb8xHKqgARlibbKJXhP7EdtOw3QfltY0mn0+/Joh4RgoJ4b5dNb9U3Q6T0Fau/EAMIJRJioyoE56qMU+QwFEGla+CarT1zn7sjH5heoMD2eRP++g3o2Bg/XaFARoXb0zzxezbdTbQ/29q+3s02qZMSAex20ceDncZlSdWNOIl5SBf20o/YE2F8/Zz28XyJJlkw0Z+VW+fn2BQn//TxZOMU5erPm2zqex9p72dj/jiuOGFuCLWVUnwRSQdfcmAU/9Ful48klT54LfizMcRLFOoCs5HkCzaUk24ztAXVbPcDZLs1tuvGVfXXXH5z7ztkWr7yDbzIP6aEsqzUrSjU49qx8+EMVUfNrlcVDLkw1ythvJI43OhyTR/WpUOvxuKD01RAKRJGRcOueBJbNY8/bx62iKTP6UeE3hVBaDSf7eHLXou02D/laZh8Cp1b5EpJEMFm8INH1UOtoy6Y/byTxhe6EkMA381vtHRxBTTsMzvAHaiDZzQZ9nw81bNVCqozfS86BRxp6KgixYwaRWmDHYsvHEQntzinmxbAF0GkJeftjLJOn4XsbujQwml2hrnNCIMkiasn8seFOmESOT3TTf5w/d1No03WtkfP0g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(336012)(6486002)(478600001)(86362001)(2616005)(47076005)(36756003)(36860700001)(40480700001)(26005)(83380400001)(33656002)(107886003)(6512007)(6506007)(53546011)(186003)(40460700003)(82740400003)(356005)(70586007)(70206006)(81166007)(316002)(2906002)(4326008)(8936002)(5660300002)(8676002)(6862004)(41300700001)(82310400005)(37006003)(54906003)(6636002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:21:44.9377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a1ae97-f384-485f-2500-08db400fdb40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9295

Hi,

> On 18 Apr 2023, at 14:55, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Luca,
>=20
>> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>=20
>> Add a device tree property in the dom0less domU configuration
>> to enable the guest to use SVE.
>>=20
>> Update documentation.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

In fact the doc needs fixing as the domain creation does not fail.
@Luca thanks for mentioning that to me

So please fix that and you can keep my R-b (unless some changes are
needed after the discussion on parameter handling).

Cheers
Bertrand

>=20
> Cheers
> Bertrand
>=20
>> ---
>> Changes from v4:
>> - Now it is possible to specify the property "sve" for dom0less
>>  device tree node without any value, that means the platform
>>  supported VL will be used.
>> Changes from v3:
>> - Now domainconfig_encode_vl is named sve_encode_vl
>> Changes from v2:
>> - xen_domctl_createdomain field name has changed into sve_vl
>>  and its value is the VL/128, use domainconfig_encode_vl
>>  to encode a plain VL in bits.
>> Changes from v1:
>> - No changes
>> Changes from RFC:
>> - Changed documentation
>> ---
>> docs/misc/arm/device-tree/booting.txt | 11 +++++++++++
>> xen/arch/arm/domain_build.c           | 24 ++++++++++++++++++++++++
>> 2 files changed, 35 insertions(+)
>>=20
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 3879340b5e0a..f9d2ecdda48a 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -193,6 +193,17 @@ with the following properties:
>>    Optional. Handle to a xen,cpupool device tree node that identifies th=
e
>>    cpupool where the guest will be started at boot.
>>=20
>> +- sve
>> +
>> +    Optional. A number that, when above 0, enables SVE for this guest a=
nd sets
>> +    its maximum SVE vector length. The default value is 0, that means t=
his
>> +    guest is not allowed to use SVE, the maximum value allowed is 2048,=
 any
>> +    other value must be multiple of 128.
>> +    Please note that if the platform supports a lower value of bits, th=
en the
>> +    domain creation will fail.
>> +    Specifying this property with no value, means that the SVE vector l=
ength
>> +    will be set equal to the maximum vector length supported by the pla=
tform.
>> +
>> - xen,enhanced
>>=20
>>    A string property. Possible property values are:
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 3f30ef5c37b6..c1f0d1d78431 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -4004,6 +4004,30 @@ void __init create_domUs(void)
>>            d_cfg.max_maptrack_frames =3D val;
>>        }
>>=20
>> +        if ( dt_get_property(node, "sve", &val) )
>> +        {
>> +            unsigned int sve_vl_bits;
>> +
>> +            if ( !val )
>> +            {
>> +                /* Property found with no value, means max HW VL suppor=
ted */
>> +                rc =3D sve_sanitize_vl_param(-1, &sve_vl_bits);
>> +            }
>> +            else
>> +            {
>> +                if ( dt_property_read_u32(node, "sve", &val) )
>> +                    rc =3D sve_sanitize_vl_param(val, &sve_vl_bits);
>> +                else
>> +                    panic("Error reading 'sve' property");
>> +            }
>> +
>> +            if ( !rc )
>> +                d_cfg.arch.sve_vl =3D sve_encode_vl(sve_vl_bits);
>> +            else
>> +                printk(XENLOG_WARNING
>> +                       "SVE vector length error, disable feature for Do=
m0less DomU\n");
>> +        }
>> +
>>        /*
>>         * The variable max_init_domid is initialized with zero, so here =
it's
>>         * very important to use the pre-increment operator to call
>> --=20
>> 2.34.1
>>=20
>=20
>=20


