Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2C2D5F6C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49438.87431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNkx-0002gm-I6; Thu, 10 Dec 2020 15:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49438.87431; Thu, 10 Dec 2020 15:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNkx-0002gN-EV; Thu, 10 Dec 2020 15:21:23 +0000
Received: by outflank-mailman (input) for mailman id 49438;
 Thu, 10 Dec 2020 15:21:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knNkw-0002gI-7X
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:21:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5527c3c9-febd-407f-a220-9ee1a4d05c6c;
 Thu, 10 Dec 2020 15:21:20 +0000 (UTC)
Received: from DB6PR07CA0193.eurprd07.prod.outlook.com (2603:10a6:6:42::23) by
 AM6PR08MB3208.eurprd08.prod.outlook.com (2603:10a6:209:4b::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Thu, 10 Dec 2020 15:21:18 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::87) by DB6PR07CA0193.outlook.office365.com
 (2603:10a6:6:42::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.5 via Frontend
 Transport; Thu, 10 Dec 2020 15:21:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:21:18 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Thu, 10 Dec 2020 15:21:18 +0000
Received: from 7d897cbad704.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A5547A75-18B0-40FA-919B-77A0108516C4.1; 
 Thu, 10 Dec 2020 15:21:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d897cbad704.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:21:12 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4776.eurprd08.prod.outlook.com (2603:10a6:10:f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 15:21:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:21:11 +0000
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
X-Inumbo-ID: 5527c3c9-febd-407f-a220-9ee1a4d05c6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jana2+yJyQvAcw+b25PWB2OhcnsKE7U72kETQClUwfc=;
 b=knGW/B3o1JcBgkRgf9no0MsieYLyDTiGUoktsSDn1chOfEISjyrgBTGxsiR3kd4Ni/KXQnuEpOG2bwS6AV6+/40ieFD0TmQT4NN7KpVkdBsm5EO82v1f3vay5sloJpLcnVfQj6K4tUYIOVhbocXlvkp/rQlBKIiilsL5hWVrnKc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84be96c1756122fa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5hBnwY6U8m1Xyvwad0WMOeVYIKG+zCvSt+TxRsLpph668oqPpXe6FFAfQIrTj3JwPAMgL+OQ8hkjJB9MG7Ko+3oFDdGwmAykl9JFnfN0QPz8CE3QYsfnAd46eLubWGokL0iqGOLcXwTF1Oe2U1xAvRmr5jkK0aO2ojCiIpqsZVlMAo2liEUZRH4aTLc3iAgZLlEQVwXt/Ft1glan0d2zPaxw8UbB0+GJgrfHCwtnPAZ0QPbhjENF8HdLVvYdW0T2jZaIVSHIky2yGZJIaNaCtVd5zB7OGLYWjgjSBfGYJagSsFYr7Hm685z/p51Dhj93VLuIv1bcM4udfZkv4tkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jana2+yJyQvAcw+b25PWB2OhcnsKE7U72kETQClUwfc=;
 b=XG+t78DEeyr6lnSIaPOqjGqP5F2GmCSMD7GW/qdgoVP8rjeVf05C66m0AutyosiuHBMiGZpt8MqKW8+6QE6LbC1SD9baACEee//bBxa5QbWRsa2nHMH2hVqg6hrENnus1WVJvYRJAc7NqbjDtLsQXT4IlKCmsYVS1qeSAeov8vw96nZqQupDgbS4zcMTJjlztyCgkg0efm30yOo8vkbYIblcq+wVN8p4/KiApsL3wN498f3mQ+4X7Oiwf0Uj5GpX/Gke7bwX4Lh8m8HLJSVYt2B5DzMj2TN+21G2ZF9Bbc2dbGIE3dPy1t7ssshv75bosRd+0s43S98G95lnpHrZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jana2+yJyQvAcw+b25PWB2OhcnsKE7U72kETQClUwfc=;
 b=knGW/B3o1JcBgkRgf9no0MsieYLyDTiGUoktsSDn1chOfEISjyrgBTGxsiR3kd4Ni/KXQnuEpOG2bwS6AV6+/40ieFD0TmQT4NN7KpVkdBsm5EO82v1f3vay5sloJpLcnVfQj6K4tUYIOVhbocXlvkp/rQlBKIiilsL5hWVrnKc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Topic: [PATCH v3 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Index: AQHWzkloLLvBmqE820eVrJEh4IHR0KnvZTWAgAEOZoA=
Date: Thu, 10 Dec 2020 15:21:11 +0000
Message-ID: <FFBCC49B-C6C6-4D95-A24E-523741592527@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <e991b05af11d00627709caf847c5de99f487cab0.1607524536.git.bertrand.marquis@arm.com>
 <8a154f7c-f700-5b6f-5645-a122fec45d19@xen.org>
In-Reply-To: <8a154f7c-f700-5b6f-5645-a122fec45d19@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b8c02bf6-99e8-40e3-fc0c-08d89d1f3e0b
x-ms-traffictypediagnostic: DBBPR08MB4776:|AM6PR08MB3208:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB32081F8DFAE6ACB4E57AEE789DCB0@AM6PR08MB3208.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O8uJITUqG5FeW7C/+Qi7mjuqY/Pkil/UV5n3YGQy4mhosN5CKe2Ya9SFl8tGwjITUF0wgp7HrCO3nnA21KtXNTDozm0nMReiA//P+n3h3hDCetO/l719pZgaI3tGHdGRkClEG7RFEpG+Mf46s8/qh87WDYfyiW6cZBAH2UCOka1r0yfT9sO5egkM4kVEL7hMViDrqMYZ+t7PoJsh/72f/49TYGl282e4q4OoSMZBAle6MEdNQEjXwB069l9u2PnaYhUu89tKMrbAlCV9w/8p0wEZ5Lm7tKFS3LQZ0LcglZOneQrfk3NrRMe5KGDhSEmVgL3X9+l2ONB2atrXPClkjKE18yvk1hwLfBqYFgxxre27v26D9r0VjQZBESQo8JR8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(66946007)(66556008)(8936002)(66446008)(2906002)(76116006)(66476007)(8676002)(6916009)(91956017)(6506007)(53546011)(4326008)(64756008)(71200400001)(33656002)(5660300002)(54906003)(316002)(478600001)(6486002)(2616005)(26005)(86362001)(83380400001)(6512007)(186003)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?9xCavrbAFyAJo7vYy6Tsq13c1tm/e37fzZr/JRc7zqceUqcNNzGzfc0werjy?=
 =?us-ascii?Q?FxgBIWEGBnI6UQHhFMK1AoI3qGOE1rq8qIOQUK79PX/C6ERmgQl5EK8eHPfK?=
 =?us-ascii?Q?swokm9FuZD0DnnKMFElquXvK6hMnmKVJFez2MOrtw48mM1vygjCpGBSgknNd?=
 =?us-ascii?Q?HYC34PwloG5G1NtyaGyTZTqOBCTdz5oKBrfpr4KWO3hvL5vnJbqxRW1dSPVz?=
 =?us-ascii?Q?cYq9hxv58beDqYPC9qruh4U6WwCIFPHihlwDNm163xQ/5mt12IRa6i03gbGh?=
 =?us-ascii?Q?nVy7a4YrQC3ABsFHDcy6bdRqFP4RCvaemqub0CUqbdQTMSQ3a4moEhc/JgI9?=
 =?us-ascii?Q?2ObGL1cD8poHxaHzOaKN9Gl+KLGWz0997WbZLa2BRcPs6FlvM+tRIYRG9Rgn?=
 =?us-ascii?Q?dDa5PYcmwf1SMzD8z6I3XfnZzAdPuspFwtDRNWB0H2uey/lplKXa6JgjSS5L?=
 =?us-ascii?Q?CGvvKlpR6vo2I4Fxa4OlIyt2BW1X44l5s1Y2rfQF49xp4yPi2WTJfnlGAVEP?=
 =?us-ascii?Q?SuSpHCk4M/NMscbclclGn93Xd4KZoxM4TzZI2t/GehLWL0jf4+Bc38fOJSBN?=
 =?us-ascii?Q?d5qtw1Gh759wTb19ZYLYE999SFwqjbXRS5nDvlQjAi+2fLAR0v4758+8efP4?=
 =?us-ascii?Q?O4K9Z525GvbEih8GsdjxMFacuexGflGbDPEI81sSSOPeaKkAASwEhmsI8Xab?=
 =?us-ascii?Q?JFaAOb0fJMcrVincviCZSuq9yDYRAA2aiLrgNF4CC1dFnRRcymnju8kQ5ud7?=
 =?us-ascii?Q?zotiFjeIi3e5wLVKRrM11DTky+DaVH8SHdRhMCJBFnKhS0na6rqyVsMY6pzv?=
 =?us-ascii?Q?OOtNfB0vaXd8tmEwNSjPg/V4w+GwuFgPEssUFeG9ZMPARu1TDaHkzF80zUIH?=
 =?us-ascii?Q?WOKGWul0ZN8gYxIR8pd31lh9mvGLamJDAiqKLf3WlUqoaGw2gDi8SGn++/ED?=
 =?us-ascii?Q?Hsiw/WufL2tq6VOD3GEtxhRL8KmBnTGIL4V0FOoZ+Ye9qo/PNa7nVZwtb8Fp?=
 =?us-ascii?Q?HC2C?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A3FDFC0216432A49A7C1078D9AFB8BDE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4776
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19618b9e-46e2-417d-cc79-08d89d1f3a04
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BLTgalOHyknaBvs4STr5nAsWzFoDg9+Ja/bKMZLKlz4vdnwXK3+7+u4w/hPa3XZfiVVhT/PQRgjY4NyLATpUH/uh+EcKQuZgfPndmGY3fkf6Elks0+B9eAgvzq0K0CWJ8MxelcTgkXxUyMD75D5k3gGUZRH0cSBXDT/HpQ9yXHnztsgP6gh+M3YvDnl4CCW/pTobq531tRdiBlGLWJ/QsS+PNn3Gu+sPLzsyc3If48R7suTYbvc2cM7DavbeizoKLLcMyy3PT7ATmhdiq+6VyOIyjIKwWo6R3DDPb9R32X2KUsQShTyRTYhgh1rOP5jkqc+qrHzYhBdKNMMYaldU497ZlL3C+8X91o0P3oqLo5v88s0lTkWSJ0oemVMprOkxzjo1k0cpWyWCat+2+O4eqQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(336012)(5660300002)(107886003)(47076004)(4326008)(2906002)(478600001)(82310400003)(86362001)(6862004)(70206006)(33656002)(70586007)(26005)(82740400003)(8676002)(6506007)(53546011)(186003)(8936002)(2616005)(356005)(36756003)(6512007)(81166007)(54906003)(316002)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:21:18.3385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c02bf6-99e8-40e3-fc0c-08d89d1f3e0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3208

Hi Julien,

> On 9 Dec 2020, at 23:13, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 09/12/2020 16:30, Bertrand Marquis wrote:
>> Add vsysreg emulation for registers trapped when TID3 bit is activated
>> in HSR.
>> The emulation is returning the value stored in cpuinfo_guest structure
>> for know registers and is handling reserved registers as RAZ.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: Rebase
>> Changes in V3:
>>   Fix commit message
>>   Fix code style for GENERATE_TID3_INFO declaration
>>   Add handling of reserved registers as RAZ.
>> ---
>>  xen/arch/arm/arm64/vsysreg.c | 53 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index 8a85507d9d..ef7a11dbdd 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
>>          break;                                                         =
 \
>>      }
>>  +/* Macro to generate easily case for ID co-processor emulation */
>> +#define GENERATE_TID3_INFO(reg, field, offset)                         =
 \
>> +    case HSR_SYSREG_##reg:                                             =
 \
>> +    {                                                                  =
 \
>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,  =
 \
>> +                          1, guest_cpuinfo.field.bits[offset]);        =
 \
>=20
> The indentation looks wrong here. The "1" should be aligned with "regs".

Right, I will fix that in v4.

Cheers
Bertrand

>=20
>> +    }
>> +
>>  void do_sysreg(struct cpu_user_regs *regs,
>>                 const union hsr hsr)
>>  {
>> @@ -259,6 +267,51 @@ void do_sysreg(struct cpu_user_regs *regs,
>>           */
>>          return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>  +    /*
>> +     * HCR_EL2.TID3
>> +     *
>> +     * This is trapping most Identification registers used by a guest
>> +     * to identify the processor features
>> +     */
>> +    GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
>> +    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
>> +    GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
>> +    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
>> +    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
>> +    GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
>> +    GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
>> +    GENERATE_TID3_INFO(ID_MMFR1_EL1, mm32, 1)
>> +    GENERATE_TID3_INFO(ID_MMFR2_EL1, mm32, 2)
>> +    GENERATE_TID3_INFO(ID_MMFR3_EL1, mm32, 3)
>> +    GENERATE_TID3_INFO(ID_MMFR4_EL1, mm32, 4)
>> +    GENERATE_TID3_INFO(ID_MMFR5_EL1, mm32, 5)
>> +    GENERATE_TID3_INFO(ID_ISAR0_EL1, isa32, 0)
>> +    GENERATE_TID3_INFO(ID_ISAR1_EL1, isa32, 1)
>> +    GENERATE_TID3_INFO(ID_ISAR2_EL1, isa32, 2)
>> +    GENERATE_TID3_INFO(ID_ISAR3_EL1, isa32, 3)
>> +    GENERATE_TID3_INFO(ID_ISAR4_EL1, isa32, 4)
>> +    GENERATE_TID3_INFO(ID_ISAR5_EL1, isa32, 5)
>> +    GENERATE_TID3_INFO(ID_ISAR6_EL1, isa32, 6)
>> +    GENERATE_TID3_INFO(MVFR0_EL1, mvfr, 0)
>> +    GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
>> +    GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
>> +    GENERATE_TID3_INFO(ID_AA64PFR0_EL1, pfr64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64MMFR0_EL1, mm64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64MMFR1_EL1, mm64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64MMFR2_EL1, mm64, 2)
>> +    GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64ZFR0_EL1, zfr64, 0)
>> +
>> +    HSR_SYSREG_TID3_RESERVED_CASE:
>> +        /* Handle all reserved registers as RAZ */
>> +        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);
>> +
>>      /*
>>       * HCR_EL2.TIDCP
>>       *
>=20
> --=20
> Julien Grall


