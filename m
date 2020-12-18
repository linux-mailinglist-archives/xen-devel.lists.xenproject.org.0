Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2254E2DE0D3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 11:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56447.98839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqCmQ-0003XY-SF; Fri, 18 Dec 2020 10:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56447.98839; Fri, 18 Dec 2020 10:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqCmQ-0003X9-Og; Fri, 18 Dec 2020 10:14:34 +0000
Received: by outflank-mailman (input) for mailman id 56447;
 Fri, 18 Dec 2020 10:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z90k=FW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kqCmO-0003X3-Hn
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 10:14:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1e9557d-83ec-4913-aa89-d660f6046418;
 Fri, 18 Dec 2020 10:14:30 +0000 (UTC)
Received: from MR2P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::20) by
 AM6PR08MB4357.eurprd08.prod.outlook.com (2603:10a6:20b:74::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.25; Fri, 18 Dec 2020 10:14:28 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::ba) by MR2P264CA0008.outlook.office365.com
 (2603:10a6:500:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17 via Frontend
 Transport; Fri, 18 Dec 2020 10:14:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Fri, 18 Dec 2020 10:14:27 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Fri, 18 Dec 2020 10:14:27 +0000
Received: from 814ae69dcf5a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A97CDD4-D1E9-40D8-AC71-E246FB69767B.1; 
 Fri, 18 Dec 2020 10:14:12 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 814ae69dcf5a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Dec 2020 10:14:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3692.eurprd08.prod.outlook.com (2603:10a6:10:30::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Fri, 18 Dec
 2020 10:14:05 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 10:14:05 +0000
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
X-Inumbo-ID: b1e9557d-83ec-4913-aa89-d660f6046418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8/aC1Gwa1XmOgO0/yE6MwJASl+YoIUVsLPJX7X+98g=;
 b=eMztrPU/sdKiADRKKzjazfLMJID70tPWBWsY34TwuZFJc6FQLyN0DBsRSCGRFUDg239hD05MgG76itmKf+UkNb2nwg6q8zZ7RR2URc3VSjGQ7moqQTVuPAhM3utPxdeJuiqF/jFAanHzZ/ZtpOzP+58uxzLR81zca9KNDU+RDXg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0401cc23b942d9c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYnVcL6TcecoTPJZ2Yt4+y9uTKGzzR1xHK9QOewHmtBe+5oS04MHLSTSrICNza/H1ADl2sW4h6JNE4wXiiYoVi/NUrg6x2DpOy+LWJ8PmnyzGTl8tZqBEthmrkpzFJKKsl7Gjq8F2d7HzNq6+EHsBKn+jloTc61n2ifrvBN91Su4uYcVT+rnrrKtUG46UatKgUfDeT+gLWkRd0AAwVRHNq719w4CqtT39elB5APN0DNx7FvQ2yuGG+bITrt/PXOpArj8T9J5BF7SF2FSFoHdtI60ut2mGSAQdbcY9faKM8xcjvtdd9GzdAwX5nyS4WutwVuokEEEkIUyEL9xUbns2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8/aC1Gwa1XmOgO0/yE6MwJASl+YoIUVsLPJX7X+98g=;
 b=YrH/xBtEvdVpYiYNhO6byyN9kp33fV6fK+/kR3FTsgQc/SaU8CR5Y2PDZ8f7kF/x2KXlYNMBk4fh8tUueW3Mhka15/CoJYUmEoZ1CQuIGv67wRNSl8ZVnpc0K5uHSZzpHx+muuuLeZcQp27PBLFGTKZMrEPyJHiQ9sg5i0kk9D4sKIW62VrTKd9i6SNhFlz/kzT5uL4GKD8xy0KqusdHzVVnTyYrDaRdByAjhOookt1r3eQi1rgAyhALnRmtqi0Qr/m/Ps/w/Y8sUW5Ig48HpS9geM7RA0ydfi6dDJ5IhaU1C5WdFFxbDL2RLxVAHqJrwXUCsfhkor8HbisJJYbfHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8/aC1Gwa1XmOgO0/yE6MwJASl+YoIUVsLPJX7X+98g=;
 b=eMztrPU/sdKiADRKKzjazfLMJID70tPWBWsY34TwuZFJc6FQLyN0DBsRSCGRFUDg239hD05MgG76itmKf+UkNb2nwg6q8zZ7RR2URc3VSjGQ7moqQTVuPAhM3utPxdeJuiqF/jFAanHzZ/ZtpOzP+58uxzLR81zca9KNDU+RDXg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 6/8] xen/arm: Add handler for cp15 ID registers
Thread-Topic: [PATCH v4 6/8] xen/arm: Add handler for cp15 ID registers
Thread-Index: AQHW1IteiuLr9xa1TUaHJbPfJMFoB6n78jeAgACxuAA=
Date: Fri, 18 Dec 2020 10:14:05 +0000
Message-ID: <26DC10F4-E4E5-4091-AFEC-DE1DEA0A1796@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
 <c1c68e89683913dbf71a8f370dc6fd896a9e8cce.1608214355.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2012171533410.4040@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012171533410.4040@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f6fd1c1a-f8d2-491f-b646-08d8a33db3db
x-ms-traffictypediagnostic: DB7PR08MB3692:|AM6PR08MB4357:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4357D2FEB637AD983FE8E71E9DC30@AM6PR08MB4357.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +UVasQ8wX3Jo1PeXl7Ora85u2Gvq/0Pg01OfM9M0gQjkL9EOLgwXI5adHuCfw7vgF/w/LuadXGx3C45/VjHzXwk48WN5qU1VoZcbO6Q67XzdKR47D7vtjXvwtrsRja168r1lFPzUB8SHe7yPKRjsO+Ud1hItVPv2i+7eCDvZejF7sDIl/APdNvICwmZzsX/qdIKTBMy7dGTuN95VAW9t/w3kWOKUTYIEcsb3GJWJXxMNZScB04/Kr2qslycVpqpyjVSs8DPXH+OHLXmaz3L61J2MB+0Kby1t380bzLhlZD9kmMMpBfY22SPjrafnaTfyk+68vZAiGu+MG6nfB9UKnsscmyUmuhUtlVhkq5Jx2yFbLMJDvL1oJya301LGAFg8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(8676002)(71200400001)(2616005)(66476007)(6486002)(6512007)(33656002)(478600001)(64756008)(36756003)(8936002)(76116006)(66946007)(91956017)(53546011)(4326008)(26005)(5660300002)(54906003)(66446008)(86362001)(6506007)(2906002)(66556008)(6916009)(316002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?uBRRDxZtygeXCgqDhxyOpzkBct2djwQ6FAQA4X3jc1iprYQbwfTlhpfhsMx/?=
 =?us-ascii?Q?TpI1h888CH4sB1rvKFfE3AC6xcjf/FWYXeuE5BYurBjCvPtdUQGXuyD9BUyn?=
 =?us-ascii?Q?6tzs+mNPQZK4x7FnzD9LR8GD3GAeVFuAq9j5FcY8RQ0wIkQZq2Rw449q8qlH?=
 =?us-ascii?Q?lNQ1N362ZWCTyMyp5BhLoLT2iz2KtSI7e7PIP5ExPqM9Ep91YoXQ2lLFQqHc?=
 =?us-ascii?Q?OyboTGp7Z1FhHPn5QdmVJfU/PI3zawPOYUrs9ZaXIxAfz34TvIUcKN/kCosC?=
 =?us-ascii?Q?TldD5+/vnrEu4z7c6OWA19Q6fPgz6gS55vEq60tWIk4ZBS8Et23O/ZHW35u6?=
 =?us-ascii?Q?HahRhHoaTw6Qq0PFvoTADagRRfsw80p63hxoTvjNFdNtxe1xeN8f2f+nLyGd?=
 =?us-ascii?Q?YNCYUeX5JrmvV2SQDTOCGhHyWaLKk4DbDBAt974eOK76/ZS3SQPfrV/FCAPK?=
 =?us-ascii?Q?8q3zmb4mn1n6tU0UoN3I607mQ39QGNsBNtndudUMyZit0YVZBWO1qWhtVDTD?=
 =?us-ascii?Q?xXuT1TlTbTFwWBm1zBKBVU14+4W2CL+5w7VbxZUbNmzndN3TeA9UDUahebaC?=
 =?us-ascii?Q?RR6N/Lhjk0TV6tyn5JUHKRyiObMDO6svZRE8gyovRw6pR6i/UAPBrQ0M9jU9?=
 =?us-ascii?Q?a1DSDvaTQsh/q7/4cuduaxeDnJvUExqN8MA7xQ6WT4wtquvWLpkUOmau75A+?=
 =?us-ascii?Q?bm58i65R7VdMU6ADweNk1IkU+tOOH30BmMjKOMOEGOS7jVcdMHn/sTqf5hcu?=
 =?us-ascii?Q?GhoIZwbTsmwhokhKwhcl9kCE2WAMduNfXZof8EaTRDRPp4vZxLnWv07vli8O?=
 =?us-ascii?Q?xAkg5nwhrQs+fjTn8wGdyCGkAfLJFZ5ejTpmZdM1xk6q5iFUptlkVrzWxBP7?=
 =?us-ascii?Q?+AOQKhREkqBk9El2Xk38vscWzLt377SXzvtJb3Q9JqrSGCFHJFht4XOdIYym?=
 =?us-ascii?Q?l7X9s2parJKxhWZAOGRJHHyUxsRSuT9NuVilB0q+nLEJf3Qf2DMZoAsvXotI?=
 =?us-ascii?Q?Eq+i?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FF61B097AAB9F640BC5988465018A5D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3692
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ecb05847-d17c-4e7f-7595-08d8a33da660
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A9JdETaBjH7c3JCrUy0dobI4BeKJnqjNPTRAGAIaThf8p3XDOTTtLzB7EFKfxY+aWj8TfhP7Z82tEBjg24uyAeRXSw58RhdwkqSTixSRg+Kijipw04z6aZxDHf4k1Q2MJg9B7zg1Yfh2/6UJl9yfao6T4jW9p552EmnZIufhIKQqINfW0paklZkET0hYcyoLIKKh0PMZME/sWtdKetrnClefxNYbmJpD9m4WwYx6g+gwv031G8zlS2vnnVBtj3zJe4RIU1BdxB9tPrOUuujSCsNsSRHaAxvMB3icbmXZxQCN5bGn+lAdYtF6WlEQ1piHzvicrxhAzD++6KnYjLPhTFnmKTZFdxB06hdRcpARyf9MMZw4AGfDh4o1EwXZBRqoNdBRZEDZPZjDkscL9wbRo8jNSc+iuXfLsLn677w4t1ba+CV487I+QDXeTUc5icJOH7BFmK1ZJXf09mHxVUJYmg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(46966005)(36756003)(86362001)(6862004)(5660300002)(54906003)(8936002)(82740400003)(6486002)(478600001)(356005)(4326008)(81166007)(6512007)(33656002)(70586007)(26005)(316002)(2906002)(47076004)(8676002)(70206006)(186003)(82310400003)(53546011)(107886003)(2616005)(6506007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 10:14:27.7519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fd1c1a-f8d2-491f-b646-08d8a33db3db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4357

Hi Stefano,

> On 17 Dec 2020, at 23:37, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 17 Dec 2020, Bertrand Marquis wrote:
>> Add support for emulation of cp15 based ID registers (on arm32 or when
>> running a 32bit guest on arm64).
>> The handlers are returning the values stored in the guest_cpuinfo
>> structure for known registers and RAZ for all reserved registers.
>> In the current status the MVFR registers are no supported.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: Rebase
>> Changes in V3:
>>  Add case definition for reserved registers
>>  Add handling of reserved registers as RAZ.
>>  Fix code style in GENERATE_TID3_INFO declaration
>> Changes in V4:
>>  Fix comment for missing t (no to not)
>>  Put cases for reserved registers directly in the code instead of using
>>  a define in the cpregs.h header.
>>=20
>> ---
>> xen/arch/arm/vcpreg.c | 65 +++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 65 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>> index cdc91cdf5b..1fe07fe02a 100644
>> --- a/xen/arch/arm/vcpreg.c
>> +++ b/xen/arch/arm/vcpreg.c
>> @@ -155,6 +155,24 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
>>         break;                                                      \
>>     }
>>=20
>> +/* Macro to generate easily case for ID co-processor emulation */
>> +#define GENERATE_TID3_INFO(reg, field, offset)                      \
>> +    case HSR_CPREG32(reg):                                          \
>> +    {                                                               \
>> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr,     \
>> +                          1, guest_cpuinfo.field.bits[offset]);     \
>=20
> This line is misaligned, but it can be adjusted on commit

Oh yes this was spotted by Julien on the previous serie and I forgot to fix=
 it.

>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20

Thanks
Bertrand

>=20
>=20
>> +    }
>> +
>> +/* helper to define cases for all registers for one CRm value */
>> +#define HSR_CPREG32_TID3_CASES(REG)     case HSR_CPREG32(p15,0,c0,REG,0=
): \
>> +                                        case HSR_CPREG32(p15,0,c0,REG,1=
): \
>> +                                        case HSR_CPREG32(p15,0,c0,REG,2=
): \
>> +                                        case HSR_CPREG32(p15,0,c0,REG,3=
): \
>> +                                        case HSR_CPREG32(p15,0,c0,REG,4=
): \
>> +                                        case HSR_CPREG32(p15,0,c0,REG,5=
): \
>> +                                        case HSR_CPREG32(p15,0,c0,REG,6=
): \
>> +                                        case HSR_CPREG32(p15,0,c0,REG,7=
)
>> +
>> void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>> {
>>     const struct hsr_cp32 cp32 =3D hsr.cp32;
>> @@ -286,6 +304,53 @@ void do_cp15_32(struct cpu_user_regs *regs, const u=
nion hsr hsr)
>>          */
>>         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
>>=20
>> +    /*
>> +     * HCR_EL2.TID3
>> +     *
>> +     * This is trapping most Identification registers used by a guest
>> +     * to identify the processor features
>> +     */
>> +    GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
>> +    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
>> +    GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
>> +    GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
>> +    GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
>> +    GENERATE_TID3_INFO(ID_AFR0, aux32, 0)
>> +    GENERATE_TID3_INFO(ID_MMFR0, mm32, 0)
>> +    GENERATE_TID3_INFO(ID_MMFR1, mm32, 1)
>> +    GENERATE_TID3_INFO(ID_MMFR2, mm32, 2)
>> +    GENERATE_TID3_INFO(ID_MMFR3, mm32, 3)
>> +    GENERATE_TID3_INFO(ID_MMFR4, mm32, 4)
>> +    GENERATE_TID3_INFO(ID_MMFR5, mm32, 5)
>> +    GENERATE_TID3_INFO(ID_ISAR0, isa32, 0)
>> +    GENERATE_TID3_INFO(ID_ISAR1, isa32, 1)
>> +    GENERATE_TID3_INFO(ID_ISAR2, isa32, 2)
>> +    GENERATE_TID3_INFO(ID_ISAR3, isa32, 3)
>> +    GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
>> +    GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
>> +    GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
>> +    /* MVFR registers are in cp10 not cp15 */
>> +
>> +    /*
>> +     * Those cases are catching all Reserved registers trapped by TID3 =
which
>> +     * currently have no assignment.
>> +     * HCR.TID3 is trapping all registers in the group 3:
>> +     * coproc =3D=3D p15, opc1 =3D=3D 0, CRn =3D=3D c0, CRm =3D=3D {c2-=
c7}, opc2 =3D=3D {0-7}.
>> +     * Those registers are defined as being RO in the Arm Architecture
>> +     * Reference manual Armv8 (Chapter D12.3.2 of issue F.c) so handle =
them
>> +     * as Read-only read as zero.
>> +     */
>> +    case HSR_CPREG32(p15,0,c0,c3,0):
>> +    case HSR_CPREG32(p15,0,c0,c3,1):
>> +    case HSR_CPREG32(p15,0,c0,c3,2):
>> +    case HSR_CPREG32(p15,0,c0,c3,3):
>> +    case HSR_CPREG32(p15,0,c0,c3,7):
>> +    HSR_CPREG32_TID3_CASES(c4):
>> +    HSR_CPREG32_TID3_CASES(c5):
>> +    HSR_CPREG32_TID3_CASES(c6):
>> +    HSR_CPREG32_TID3_CASES(c7):
>> +        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
>> +
>>     /*
>>      * HCR_EL2.TIDCP
>>      *
>> --=20
>> 2.17.1


