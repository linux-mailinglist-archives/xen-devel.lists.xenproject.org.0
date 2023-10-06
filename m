Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251C7BB9F0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613659.954344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolPd-000199-PK; Fri, 06 Oct 2023 14:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613659.954344; Fri, 06 Oct 2023 14:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolPd-00016N-L9; Fri, 06 Oct 2023 14:02:41 +0000
Received: by outflank-mailman (input) for mailman id 613659;
 Fri, 06 Oct 2023 14:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qolPc-00013e-Ok
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:02:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe13::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02e1122a-6451-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 16:02:40 +0200 (CEST)
Received: from DU6P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::15)
 by VI1PR08MB10147.eurprd08.prod.outlook.com (2603:10a6:800:1ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 14:02:37 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:540:cafe::53) by DU6P191CA0014.outlook.office365.com
 (2603:10a6:10:540::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.30 via Frontend
 Transport; Fri, 6 Oct 2023 14:02:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Fri, 6 Oct 2023 14:02:36 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Fri, 06 Oct 2023 14:02:36 +0000
Received: from b7fdf0532ff5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 26177A3C-A08B-409A-8D7D-EF9341D6B0EF.1; 
 Fri, 06 Oct 2023 14:02:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7fdf0532ff5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 14:02:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6046.eurprd08.prod.outlook.com (2603:10a6:102:e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 14:02:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 14:02:27 +0000
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
X-Inumbo-ID: 02e1122a-6451-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOQU+dqLCag2RJFZcdSsP3klK/RUhZ7eIVUMFZp8Lsc=;
 b=yVVDrzK7C+02yc8eFU3NTbx5Al4pZlCedVlJTzpFyjuYXttyMHhareHDEKkjYS5F5diJQtqkSmAl/eLs8U49NpOafsTVWIyD73SWGAn/DAjzXLqfI3uJPKUsEK/aU2QIFIRV6h1aCIIbexwmQHcmoeGhUKFtxdkW86O/DgAA/cM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90ed3efc96c60d7b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWJMtznTV5/Oob4+k6AoQr0DQc4Z9/nMWJrlEwlGrdCqBgHihK08eo1MlJr74d/KXFGydCHfIs2NJjzW5JRFVVFjQgCWQIGexoxq1u7g8ZqSAFN9l5eeiLKU7NtwrbKJ0fyfIyB0eZmPscds1giC/IzsXL1Sy4O25tzrc0jAsIL6tM6AdTZ6MDE0FoUaVoQjxyEHEeyCDvXHosJI43BOjqqq2dMoDVwZZHRePteM60H9zX29Xh2DIn4Gd3Gxpe5tJk49DAL7NtIyv0MQx9DNl2tzRzeEL0TcNCm7fJJlgezpxSPILIy2JCsx6bDDyJJc/rPs9TXby+grq5PLedLBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOQU+dqLCag2RJFZcdSsP3klK/RUhZ7eIVUMFZp8Lsc=;
 b=Zst94xsqd0pQtk0eQlgokwkHLV5V0MGGTB4H3yITkr/b80Rt3MyL2Dcsp80wAG/afLfPHMsbbcyqjHWj6SPocxJYspxWPKyFloejv2IoHsf4QKnw/WEOnVSMXtzR3js4DQiAKBAcWwzVKFnNSmKFzItwL9k/oFQOQoHmLvAD+PZp9Umlu8OHPEgi2kAb1SKliLfM54kHSWa0KON1ZVrQOR/BU4yfcKyZ+/+QcPtdTz3hVwpT9+bPTRGigWSXTc/gCO08elYk/DqSw4Hgivd93sCve3/8HR+c2nD80vHrf3tpaVhEgZKNcDdl/rcb3PgHFlyBK4C9NlIR9D2vJh/uDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOQU+dqLCag2RJFZcdSsP3klK/RUhZ7eIVUMFZp8Lsc=;
 b=yVVDrzK7C+02yc8eFU3NTbx5Al4pZlCedVlJTzpFyjuYXttyMHhareHDEKkjYS5F5diJQtqkSmAl/eLs8U49NpOafsTVWIyD73SWGAn/DAjzXLqfI3uJPKUsEK/aU2QIFIRV6h1aCIIbexwmQHcmoeGhUKFtxdkW86O/DgAA/cM=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Thread-Topic: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Thread-Index: AQHZ+FVZUPfMale+2EmZAlhfgl1uHrA8utcAgAAP6wA=
Date: Fri, 6 Oct 2023 14:02:27 +0000
Message-ID: <7E90A084-3D08-4657-ABDB-17001FCE6E2D@arm.com>
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-3-roger.pau@citrix.com>
 <e45d0273-834b-4d7f-b158-29341845d3be@citrix.com>
In-Reply-To: <e45d0273-834b-4d7f-b158-29341845d3be@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6046:EE_|DBAEUR03FT055:EE_|VI1PR08MB10147:EE_
X-MS-Office365-Filtering-Correlation-Id: 39666263-876e-405b-686f-08dbc674e505
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NWKNe1EU2nD5Oj232p8yoCPPMHvsjSBcC9NeVw2p9JhHw836+eHx4evlcycaCx2L1a3R1mhHdyPX0ie72Qj05yoq0HPhFzs1YLlOYrXMNv85/oRFOnhLajy3wnK1ZDDcmQKqI3Y2ZXwGiwyoK5wqtf/q1efL9J0QhLKvErWIfbddTyPi/xHHFy0Llvg0RQW6Ki3f5OaY6lYtH2kjp3RLM3LtMBerZFNaNhWWdh/EpacJGeAP6lXPF6fqvd8+ceF3DD6SEb3VRRkTU6bX7AT3isMBbpqhxqXQUir1MlgaaF3YscitLbUySO+tl/uXbqbD1C5oTEcdoq8jgGo8pcAt3bkqUiM/4Fs7vY29pJ+Ev54gf3zXLVHMdDwEbgzp1Tv9vvekrsR8s1FN5pcUSr2SV+jVPEfL0DP1npHzffJlW2bkmoiXvwxNQNFirMdvT8DgZRWccy8DyaLJvTtR+EsC7zosCCL9YBD0jtjXwSQ0SNkI7UBDgSaKhyIgD60WG9JU6AzNNzN5gRWZnY1zzHqSqWEx+QXDPbHOW60vS+hBSNfIStlWnz7uIDTriRyUZaxq7FmlM6MkfQlGG5Mtt6A9sKsFhubohxVVB7KEkLh67mODk/FinTpi8wCpO3PtRc67SnDhhiN8CmS2oS9Ivmatiw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(4326008)(8676002)(8936002)(316002)(6916009)(5660300002)(41300700001)(2616005)(478600001)(26005)(6486002)(122000001)(6512007)(76116006)(83380400001)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(91956017)(2906002)(86362001)(33656002)(53546011)(71200400001)(38100700002)(38070700005)(6506007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2BD3C651CB771E42BAF06FD92365A7A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6046
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	152dec68-9c2d-40ec-abd1-08dbc674dfa5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GXoYYmxa3Y70rWj0m3Z239Zqv5MXe+k6Bz/bYXIxjGw7HxOoDXi/xzEDviOCKXROj/0L7rgTJv+mxHO0w+BLKe49SteU7jDB5oSDEfwMHpjNzDTVk64ZXRSoSCT97O1vsG48NrXxEEEB6jFXIz7M8omRdc3k4K8ExWbi6Xd3gU7x3zZx1h+40/J2HKUI+Alfg189Ytrq8dX5Ns5bDDVNMoKzeafsbJLSKe7hLvxqJfowDIvAfO2h242Zbd+rgd9SW0IaWtSyfw1SghvFWg5I7VLuq8CLDgT3NpP7z7oUyvU71ek2W1uboyrQ9u64r9U/RrOmEPEIUUNiyFzm77Sj5R56hXRmB3EdRPhIfP4j3bLAdep4yBCzC0dNtJlkx5nVrBgwjl7O/VoOVHxU4xauVE6ItkMyMQNak6MsvjqCicByljPel1F/awgJJkr1T1VUTIR/BDxcQNEMyLjpjE6LRn18k390SN5E5mlzvinFuP/jNXR9KIS//SVdOqrrTSBcgjpaIQPPE7h2K0RvgeuIiPKVqJdXHITLwh3bwHl81zWWN54ppzJ/i4SR5kXtjPMCb5OEmenZhVsPdUh89v59bhFLjzdpfzdLnvzN28tZK+k7wl6nYRexAGmGVEpLCvTARQlVOx5qf+fkd+zfIxl/cCqio+nIeNNfbQlRX9W4UtqEHDMftSVGK59fZ2q0xjEVaVibrwEJU2/RO9hXxx/Nmg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(1800799009)(82310400011)(186009)(64100799003)(451199024)(36840700001)(46966006)(47076005)(6506007)(53546011)(478600001)(6486002)(6512007)(41300700001)(2616005)(36756003)(2906002)(26005)(8676002)(70206006)(6862004)(70586007)(8936002)(4326008)(54906003)(5660300002)(316002)(33656002)(83380400001)(86362001)(36860700001)(356005)(81166007)(82740400003)(336012)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 14:02:36.3431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39666263-876e-405b-686f-08dbc674e505
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10147

Hi,

> On Oct 6, 2023, at 21:05, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 06/10/2023 2:00 pm, Roger Pau Monne wrote:
>> diff --git a/xen/include/public/features.h b/xen/include/public/features=
.h
>> index d2a9175aae67..22713a51b520 100644
>> --- a/xen/include/public/features.h
>> +++ b/xen/include/public/features.h
>> @@ -111,6 +111,15 @@
>> #define XENFEAT_not_direct_mapped         16
>> #define XENFEAT_direct_mapped             17
>>=20
>> +/*
>> + * Signal whether the domain is permitted to use the following hypercal=
ls:
>> + *
>> + * VCPUOP_register_runstate_phys_area
>> + * VCPUOP_register_vcpu_time_phys_area
>> + */
>> +#define XENFEAT_runstate_phys_area  18
>> +#define XENFEAT_vcpu_time_phys_area  19
>> +
>> #define XENFEAT_NR_SUBMAPS 1
>>=20
>> #endif /* __XEN_PUBLIC_FEATURES_H__ */
>> diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
>> index 8fb0bd1b6c03..03b031a3e557 100644
>> --- a/xen/include/public/vcpu.h
>> +++ b/xen/include/public/vcpu.h
>> @@ -236,6 +236,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_ar=
ea_t);
>>  * Note that the area registered via VCPUOP_register_runstate_memory_are=
a will
>>  * be updated in the same manner as the one registered via virtual addre=
ss PLUS
>>  * VMASST_TYPE_runstate_update_flag engaged by the domain.
>> + *
>> + * XENFEAT_{runstate,vcpu_time}_phys_area feature bits signal if the do=
main is
>> + * permitted the usage of the hypercalls.
>>  */
>> #define VCPUOP_register_runstate_phys_area      14
>> #define VCPUOP_register_vcpu_time_phys_area     15
>=20
> For both of these, I'd suggest s/permitted/able/.  For older versions of
> Xen which don't advertise the XENFEAT, it's a matter of capability, not
> permission.
>=20
> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and
> I'm happy to adjust on commit to save sending out a v3.

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> Thanks,
>=20
> ~Andrew


