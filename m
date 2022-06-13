Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094B548315
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 11:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347915.574246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0gGf-0005FC-Fo; Mon, 13 Jun 2022 09:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347915.574246; Mon, 13 Jun 2022 09:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0gGf-0005CJ-CA; Mon, 13 Jun 2022 09:21:53 +0000
Received: by outflank-mailman (input) for mailman id 347915;
 Mon, 13 Jun 2022 09:21:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7/M=WU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o0gGd-0005CD-Bo
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 09:21:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41816b39-eafa-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 11:21:50 +0200 (CEST)
Received: from AS8PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:20b:312::15)
 by AM5PR0802MB2483.eurprd08.prod.outlook.com (2603:10a6:203:9b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 09:21:48 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::f8) by AS8PR04CA0040.outlook.office365.com
 (2603:10a6:20b:312::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20 via Frontend
 Transport; Mon, 13 Jun 2022 09:21:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 09:21:46 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Mon, 13 Jun 2022 09:21:44 +0000
Received: from 195176ecd504.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2DBC8566-744C-4808-B0A3-2FEDD99A28D3.1; 
 Mon, 13 Jun 2022 09:21:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 195176ecd504.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Jun 2022 09:21:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5252.eurprd08.prod.outlook.com (2603:10a6:208:15a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Mon, 13 Jun
 2022 09:21:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 09:21:35 +0000
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
X-Inumbo-ID: 41816b39-eafa-11ec-8901-93a377f238d6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=U6Nn1Kh72CbT3ihVGJKs+OE0bLsQwInt8jlJu8BCud2uGmkJnHJN/E8xv4KzKfnxFfo4VRaFMYIJb4pBV+XlQQ14MNCquSJYm+0ioaktkCOdu1RofmeqVzuQySQFgbGwxARvw0yUmD0W0V7Gpk8YENDlGq4lf276yD26xAv8kXEWMKOgs31uHyG4kqzXISBgZW/UJXPZeKUrAH71R/MEAgoYu0nnc11ZaoLmdzvb4Q1I+LWzyZUUQwvdwIUExb33Tz8jpCrp2lqCmNNAoFC5WrDqo9hgFKl3SfosFown+oTykw3OoqeYOJNzgIHbXw1zQMhDdZ9xHNLyLWzGR5ygbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSP+kWOvCT2oPppvmrxVsk7nj8Q3bIMzMKru9D1AXAU=;
 b=IiNUn1WLnkuL7arK36EkfhQou3g2Z6sbS5Y9gTXTVqWxhBG5s126Qw/uv+JTs1v6Z8LueL6GrnVTyfXWYSm4lt2cUw4OL/Hpt/mQa4i/yY9MUbH8gsb/+nrbYFib7HyLAtxZIj8c9MBi7wk5qsqarhyy61E+Bjgi8XSNeRikFSmdj+NaLYVp6Fu+g753jAkuZH9aI1Wjy74cmDtxJHcHYzNOusy1gCEsHhI0Moz7Z6VUDA8rH7zuaeHShkGFFdyZIVMPio2Yubw3DCNq0e55qn5p7WE6ElQ1eDgoRucfzGFY6t4a2Ozv36JFzJd5ZZ3PEMgYaJqcBK5LDYEbJ9zhqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSP+kWOvCT2oPppvmrxVsk7nj8Q3bIMzMKru9D1AXAU=;
 b=MF71QuxmALXWbhDNy9RE9PPg2Irg735/kGcw/D2SREDoSBzsisjIyQ2XvbxKNQJtoWUSo/V60nDfWuzfA7MLrZk/5f19W2B8rD7PTue7M40mGi2T1mLJ6uulcEEs5scMioogE5Z5jrg93+1z3QPYjO5bSu/ZZxkapyLqpwRBh+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4bc66be626ea6af
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUEJt2STraIB/UD/OsElEcfYfng6/lDuZ/RuZdABkdDkwCWLoqwGUiDY9+JvqSYm8hSW9kwRfy2aHImKcGzhoteT8X2x386bFlacGsLyOaMJctSf2zYgCaH/ZPlFBpNh0pYKvDfjLj8X1ZfMv1Tq/LuiJrhQJ9Ep4HafYNLV7YpVSh1qBL0Y5DXasS61/ir2KNkylAz1WWF7LS9YxS02rGmiFvkJg/epQH+VB0pvlfbpzv5lca9wnJthpzj6ivf++oYzzDESqwrcDl7+7gtucLPYGdfmSFQvYZLvwAreNmMCQXrGiSUjwBYGZX5kXjB+xmTAO3Y6++E0hpayKf+SNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSP+kWOvCT2oPppvmrxVsk7nj8Q3bIMzMKru9D1AXAU=;
 b=AJ+uPkXxM/s7czpzwOu60bmKRqghpNn+5YS8ECe5GsKnTS8MhPv9e7sj11NrCyAKnhJerLb8oLdb21ii5QzPIi4+JBu0TEVUDjz/+Aumg3dpc3NRgn/iY6QPpn1BOgvsfjK6xRuo0ToS9jvkHTCujVgHFqRXn5DKDFRLL1tfOWLCCx5jaXbLx93K4HPEupfEpo7d4NZMvaaHgQdsjOy11UpyumzEffofEUE8Y10iax53VIUIjcST30VZRwv11Wi81roy6JBdLUPsszmNnAQC6nudDGPsU2cAMekaLXRbLJ3z/XNGfJLvrfcgYk8Mm/AYGxmvqQrNUuEGIrbyomoLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSP+kWOvCT2oPppvmrxVsk7nj8Q3bIMzMKru9D1AXAU=;
 b=MF71QuxmALXWbhDNy9RE9PPg2Irg735/kGcw/D2SREDoSBzsisjIyQ2XvbxKNQJtoWUSo/V60nDfWuzfA7MLrZk/5f19W2B8rD7PTue7M40mGi2T1mLJ6uulcEEs5scMioogE5Z5jrg93+1z3QPYjO5bSu/ZZxkapyLqpwRBh+A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/4] xen/arm: Add sb instruction support
Thread-Topic: [PATCH v2 2/4] xen/arm: Add sb instruction support
Thread-Index: AQHYdNtJOQ4Z/Aud7ESpo3y4E38gSK1JA+qAgAQgUgA=
Date: Mon, 13 Jun 2022 09:21:35 +0000
Message-ID: <E3444FA6-7CDD-4E7F-8454-80D279C21CB1@arm.com>
References: <cover.1653993431.git.bertrand.marquis@arm.com>
 <efc2f01da9f9dfc0f678eaf7d8fe81f9b3d0cbc3.1653993431.git.bertrand.marquis@arm.com>
 <25cfe471-8e82-97cd-7a47-b5e85c849eae@xen.org>
In-Reply-To: <25cfe471-8e82-97cd-7a47-b5e85c849eae@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: eb19188a-98ad-42f4-2f60-08da4d1e238a
x-ms-traffictypediagnostic:
	AM0PR08MB5252:EE_|VE1EUR03FT009:EE_|AM5PR0802MB2483:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2483BA95581370335F7B65EC9DAB9@AM5PR0802MB2483.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eVRxiaWuM2FPxBd/ew2ncAi8pqs3j8TJvqwMWxb0lR4HrdjWA7W8+GY4FWZnBF/mnrVBQCOzI/4uX78yyGdVCUVCWttDQ2JnMe4PSnwvTHRYXD+eimrG93cIv7xacagT9E2kxrDTehMfp4ByGF1j1y9vr/IXR7dtsq0KmC5viHBYDv4L77TUiGmE71ZmoXo6fOfm9XVRxvyarw1/rCVXJ0RG1IXF1GGReAlc4z+lzKI/VsgISWeeoa6xTNWPdb9Ur7RHzowgVm6qqJZyQJVr0srlsyQn28B62Yqn4YUNyIYyhImYSTjRBJ6VTYlGqsRr+8abSLtbUPpFzKhxCrpVm5FItigttXmF1/sE4ZU80gRo7jl3weY8P7Ekb19m5jXnBUudFyxXgxZZtkF86DBlj6Hmi9K8h4k404pSlaJmoIonp9e/RveqKDw3++CQ9USrMozABc1WFDXxyRr16IrDx4iOcCbjsF7zz1BIbQYItSWAvEDuxwmHhqETqjuL0SUwumNxIt0npzuKcYS1YgIn4C/zdLkDycz1fdmJM/lFouSiKagMVW6dKpFO+rE433CV3PPxJvyMsFMYsuV0+s68vaUSVvCCP3BpJb9CBRwDPG/NYPqzoW7/+MD22/d9C7OW19na1q0i8lIjgAKYZ0n7EuJoiVuOgY0IRPZKe6B4i1pSFGH9P74TQXjmTguMmIWpAtNbEJOGmBveozBPBPHRTmLonZwDj9KnKtdsLhq4aUpeevVFCACSpOmUHGeDkdHXPrCXj5pDDwng1nuhlrN12g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(8936002)(54906003)(66446008)(4326008)(91956017)(71200400001)(8676002)(76116006)(2906002)(33656002)(36756003)(86362001)(316002)(38100700002)(64756008)(5660300002)(508600001)(6506007)(6512007)(26005)(2616005)(6916009)(53546011)(66946007)(186003)(122000001)(66476007)(6486002)(83380400001)(38070700005)(66556008)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <733CB81908BBBF4196672301BCEB31C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5252
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d65b4e15-d6bc-476d-b9d9-08da4d1e1cd6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w6CVhg83i4dgqDMLgmfFGLtB8qOtAzxaTd5rbcIvWIylimGmy55fjacZHVDfed+2t1QDpLKM2Rfd2IwJFh1BQS4wV2ufAahGb3KvClYd1tXt5ntk2JYm3MjLV1ctrmYL0cVROLNxmkmFZmpvtgrIWI4XPkCILZ0YGgRswKCOkU8Rndo5OYRDURtK0eY5ZBilwySRlEUkm384dIaJOONOvqyN4ifuUNatFBivkAPS7VqIBdNyDew7AdQgbvjUKQnKf5O3pcwWmnI7/xMKZwk9cmneU2nvWAMoA1hyAfFhVp10pJw/H9/GuAmgUODBwaGYvAedmdxsPoSdwz9Cblc2c0YBorNfyh5JGMrk17JcfUm1FS7t0FhfQEREF1DX62IsKkKq8MQwtTFV8Lk5TlNzVHM19mCGH4sfPWo6o4U/FpSznfpO4S3pP1TGNCXhcac/fONGxJdryfDR2P6j8CtW22ykhSVkUQZcGH7t8v+IlKFMc8KXFIrqo3f/N6134RfE3x0pi4ehnjmPdFM6umLYNn9hDLxCfV9E7+JMIpOAHq2IadQt1PAPjvTfA4Y6H8bPmsrgcw8pNroYkPxm78N0fI7cKXUHJLEK/VN0AOHbMmmUHMBDLNDNNIV3zGoBEx21JUandX9zG8dpmFRCzMufjgDzljKmzlsx4JkxEmx8q3cnVzQ6Hzivgh29Iz7WkndnXN/eNh/N9AC0o+z5qxLMgw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(36756003)(82310400005)(316002)(81166007)(54906003)(4326008)(83380400001)(40460700003)(8676002)(36860700001)(336012)(47076005)(86362001)(186003)(107886003)(2906002)(33656002)(356005)(70586007)(70206006)(2616005)(6486002)(508600001)(8936002)(6862004)(6506007)(26005)(53546011)(5660300002)(6512007)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 09:21:46.5400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb19188a-98ad-42f4-2f60-08da4d1e238a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2483

Hi Julien,

> On 10 Jun 2022, at 19:20, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 31/05/2022 11:43, Bertrand Marquis wrote:
>> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/includ=
e/asm/cpufeature.h
>> index f7368766c0..9649a7afee 100644
>> --- a/xen/arch/arm/include/asm/cpufeature.h
>> +++ b/xen/arch/arm/include/asm/cpufeature.h
>> @@ -67,8 +67,9 @@
>>  #define ARM_WORKAROUND_BHB_LOOP_24 13
>>  #define ARM_WORKAROUND_BHB_LOOP_32 14
>>  #define ARM_WORKAROUND_BHB_SMCC_3 15
>> +#define ARM64_HAS_SB 16
>=20
> The feature is for both 32-bit and 64-bit. So I would prefer if it is cal=
led ARM_HAS_SB.

Right make sense.

>=20
>>  -#define ARM_NCAPS           16
>> +#define ARM_NCAPS           17
>>    #ifndef __ASSEMBLY__
>>  @@ -78,6 +79,9 @@
>>    extern DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>>  +void check_local_cpu_features(void);
>> +void enable_cpu_features(void);
>> +
>>  static inline bool cpus_have_cap(unsigned int num)
>>  {
>>      if ( num >=3D ARM_NCAPS )
>> diff --git a/xen/arch/arm/include/asm/macros.h b/xen/arch/arm/include/as=
m/macros.h
>> index 1aa373760f..33e863d982 100644
>> --- a/xen/arch/arm/include/asm/macros.h
>> +++ b/xen/arch/arm/include/asm/macros.h
>> @@ -5,14 +5,7 @@
>>  # error "This file should only be included in assembly file"
>>  #endif
>>  -    /*
>> -     * Speculative barrier
>> -     * XXX: Add support for the 'sb' instruction
>> -     */
>> -    .macro sb
>> -    dsb nsh
>> -    isb
>> -    .endm
>=20
> Looking at the patch bcab2ac84931 "xen/arm64: Place a speculation barrier=
 following an ret instruction", the macro was defined before including <asm=
/arm*/macros.h> so 'sb' could be used in macros defined by the headers.
>=20
> I can't remember whether I chose the order because I had a failure on som=
e compilers. However, I couldn't find anything in the assembler documentati=
on suggesting that a macro A could use B before it is used.
>=20
> So I would rather avoid to move the macro if there are no strong argument=
 for it.

Sure I will put it back where it was.

Cheers
Bertrand


