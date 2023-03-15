Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C95C6BAD26
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 11:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510007.786903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcO5J-0007BK-MM; Wed, 15 Mar 2023 10:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510007.786903; Wed, 15 Mar 2023 10:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcO5J-00078k-J8; Wed, 15 Mar 2023 10:10:17 +0000
Received: by outflank-mailman (input) for mailman id 510007;
 Wed, 15 Mar 2023 10:10:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsHm=7H=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pcO5I-00078e-NT
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 10:10:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91763cbc-c319-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 11:10:10 +0100 (CET)
Received: from DB7PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:10:36::33)
 by AS8PR08MB6743.eurprd08.prod.outlook.com (2603:10a6:20b:399::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 10:10:07 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::4b) by DB7PR05CA0020.outlook.office365.com
 (2603:10a6:10:36::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Wed, 15 Mar 2023 10:10:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.16 via Frontend Transport; Wed, 15 Mar 2023 10:10:06 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Wed, 15 Mar 2023 10:10:06 +0000
Received: from bfe09aa73a41.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 86E370D3-1F18-4448-B284-A29863388F7B.1; 
 Wed, 15 Mar 2023 10:09:59 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bfe09aa73a41.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Mar 2023 10:09:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB5989.eurprd08.prod.outlook.com (2603:10a6:20b:297::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 10:09:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 10:09:57 +0000
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
X-Inumbo-ID: 91763cbc-c319-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTcTviUQsmE5ow7vwaoTn7NXz4tA6GhwGMHQRYIaWOU=;
 b=HIjEGrKorHYEId0KzsjQ2sUijRYFBqNe3krUlfPrWaalj22+Em1/NpUGKnnaF+hooBCaB/QYSly+R97RRBlZZaTat1M5XbH36nkS7EVhiiLv7xlCHytWeISQv9ztjdbF4zfRUWmGNmmvnaiXRlKZlhoLMug77cp84XEfjp0Pwzg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fac7e597c9abdc3b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCTGZTdkF8l/hgVnHF5lK1gK8/5I1H2Hfqw7oSBOOQqJ18zYGmVW0P5gkIJ0JIXjBB//lnINGIfcLESk2tYdBuS2OTXGsHNUNo5bz8eeStr7UCwttZAUuP4R9HJgxL7CoWkVPZuZugsGY3LG3RfVDpQfMqIyDrlUYaNmsxgqS0vK2JaJkWnTlo9b7Cw47jPLmsP9LZwKKNDo2a+lFfNio9u6PrGZMhnHvAk7tac7E8C7Cjh8VAocmvzf/O1cPSXkGJ9rO5zU0HvEVYZtK2Hp+VOH0ojje18aZ5X1TSR4JMG9icSkNqtVlXVpO29jN4SaLquX5JC+jJxYWWp7cjcFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTcTviUQsmE5ow7vwaoTn7NXz4tA6GhwGMHQRYIaWOU=;
 b=Oq+CinB24yT4Ljv8TukN4nVp1gJ0Y8zBrLAX5s6g5vdx04ZUffCBCdsaJWMkedJleiNINnpKQ0rVV6FPwR9cZEidNAZkJp9WaLXSfXlgkWtOE/WylSgvK35L2cmV4ZUo7vljTIVe+8TojYFc+NrQVMHy3IPxv7aMr5nJ5ARt36cpfuPuJ97fQTNwa5LpGgdj0fd2+XT1+NtHJiJDR/GCfpEu3Xo/s5vviAnh818ZxvUJLWFrf58o3UEizPF2O3sFhUaIprfW8qYZsRN0gA9hhGibrCfUzWRoMT59+aRUQtiSRlUIADzqCDgcg6XQJ5407zM0lwAin+KdmjLe56HgwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTcTviUQsmE5ow7vwaoTn7NXz4tA6GhwGMHQRYIaWOU=;
 b=HIjEGrKorHYEId0KzsjQ2sUijRYFBqNe3krUlfPrWaalj22+Em1/NpUGKnnaF+hooBCaB/QYSly+R97RRBlZZaTat1M5XbH36nkS7EVhiiLv7xlCHytWeISQv9ztjdbF4zfRUWmGNmmvnaiXRlKZlhoLMug77cp84XEfjp0Pwzg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 02/10] xen/arm: add sve_vl_bits field to domain
Thread-Topic: [PATCH v2 02/10] xen/arm: add sve_vl_bits field to domain
Thread-Index: AQHZVx16ntfU6z6LhESDHGZZuH/Oa677kqEAgAALroA=
Date: Wed, 15 Mar 2023 10:09:57 +0000
Message-ID: <C0BF2738-9D1C-467F-A767-BEA4C914EC9D@arm.com>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
 <20230315090558.731029-3-luca.fancellu@arm.com>
 <a8dabea2-0903-6d3c-350f-127dd9f726ca@suse.com>
In-Reply-To: <a8dabea2-0903-6d3c-350f-127dd9f726ca@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB5989:EE_|DBAEUR03FT027:EE_|AS8PR08MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef10c5b-f0b3-4e03-a760-08db253d739a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SFNQ54abrdIysqxM+seaQw3kxe0jHoVeQmpQQGS3DxSypzHOolZv1OYo065hj9tcck74bDgI4WtGxDfFG7zK4W/CGm3v7Ig7GZqVmw/FYmB5lfpggrDF35uAlruagoR4KuhARacc3XCXIYlHBXYqRjsgp8j6saadhhnkW+fQmgxc3GQWEB7SWfMc/PzVQcytqJYDCbQjWmDge5ZkRrN8anowLuq64HCb1CL7zIHFkbhUHR+lFpOlugWkVR1MXOSu2WigJGzWxY6qBEk3CPWUpPQvvhL+36ihO0hjhMrdK20FDVjsXNOabfk6tUfY3DMwgvyH+1nemPqmCihy23NOn/v9oGgXck9goB3b99c84J4XMv9NfSdDv8/keIsz2accvXGibHIZBXfF1qc2anlyCK4zn1nghis/TOq/t0UlnCtSEZv8GRCwd9bAtfcow5AQ++5RbtgKaIwX4J91AU6OiKpEH5PoxKIOeBesG6h/GU0cyv8Ppy+rZl2m/ppldwY0lvimWE0qawwHlHRpo8TZq50ZjbLW0EDB8g7Xo1tq2bd3QzVcTnGI/i2QYfZQwIoOEXO0k40L5Ca40E2xF5BnroIcUn/S/SAh+0qPp0a8qKUlk/cnCnB9s8zUFXVAS8vvfjufU6ld+T34Edu+mYQ2MiuW/2HG0zZRYUQs6vD/Ge8xF8oyofGsWTP6+2wXYNRbNypXhHXhiu8aGiQYwPzwP6tniyGUb7895/fbazKOvB0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199018)(316002)(33656002)(36756003)(54906003)(122000001)(38070700005)(38100700002)(186003)(26005)(53546011)(6512007)(2616005)(6506007)(86362001)(5660300002)(478600001)(6486002)(8676002)(71200400001)(66446008)(6916009)(41300700001)(76116006)(66476007)(8936002)(91956017)(64756008)(66946007)(66556008)(2906002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <202412DF08E6304DB64EAE9541FBCC1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5989
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c012896-7f1c-4cee-114c-08db253d6e50
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	moUlc7jCp6gfetBcSeD5hSxH2FCO2XQWH6dnZOwPJw21+yAOkG3qrtv8xHzN1EhsewrBZILNVd17JjtFl0bzfZ5vTJXcQJZitXmvXeci3cq1zI/uLtOGk849nhHiU4szJu5XhxuOEdiP+Gy7zQMLgjlgUBCggqVmg5I30yCf339RanoGngZ+VGk7GszHKMpYApfQ4Q2Ai5TwdwkamioU9OPhOs3s6OPmPj7J3kF7EVNv6cbssusu+fGu5n3qHK8A837hEbKYDrtse8AtPiuI5km8XcG2NGaBID+u+3f+Onk5B/Jfjnp42Qls6dKJnqIgfaTCCBWKKbQTx8d+9FmNo2eQy5WyDZlI9U9TMfakV0RiWpP+bfFeCyUwSOB7uRYebX45jIP1iRbxNtnDLnV96cJT7K0oHD85WzyDzAp30rbJOKFy8zwzqTz68W7rYIPaZRgoe4lorQx3ZwmOpmp3wHqKXb5+7Ac/A0/5knd06JQz1R6DHHMfrCxl4EN28PuImRVpPISO+ObkHu3m9f7Wj5SXgMsmPY1c2iuWniFB0XJLO0zBCj3v7VElghRYJeAvfBuKNo+12uPoVCm6DEIQzRuZdj05IqGfAgdx1F26YGYT29qFZhHwb4GKY9amc1cFBbi8CpwMLMzNPPflM7l2KDjRGqNnIzQ3TF4zQEceCQJy72xlEHTC866tlCbrxi6Fmth6KrmTmoon6ONxQuo3MA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199018)(40470700004)(46966006)(36840700001)(8936002)(36756003)(33656002)(478600001)(54906003)(316002)(70206006)(4326008)(8676002)(70586007)(41300700001)(2906002)(6862004)(5660300002)(40460700003)(86362001)(356005)(336012)(6486002)(53546011)(6506007)(81166007)(6512007)(26005)(82740400003)(40480700001)(186003)(2616005)(47076005)(82310400005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 10:10:06.5648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef10c5b-f0b3-4e03-a760-08db253d739a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6743



> On 15 Mar 2023, at 09:27, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 15.03.2023 10:05, Luca Fancellu wrote:
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -304,6 +304,9 @@ struct xen_arch_domainconfig {
>>     uint16_t tee_type;
>>     /* IN */
>>     uint32_t nr_spis;
>> +    /* IN */
>> +    uint16_t sve_vl_bits;
>> +    uint16_t _pad1;
>=20
> Can register sizes be a non-power-of-2 in size? If not, by representing
> the value here as log2(bits) the existing 8-bit padding field could be
> used instead. Sadly, because of it not having been checked to be zero,
> that wouldn't avoid ...
>=20
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -21,7 +21,7 @@
>> #include "hvm/save.h"
>> #include "memory.h"
>>=20
>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
>=20
> ... the need for the bump here. Yet you want to avoid repeating that
> mistake and hence check that the new padding field you introduce (if
> the value needs to remain 16 bits wide) is zero on input.

Hi Jan,

Thank you for your suggestion, just to be sure we are on the same page:

I can store the vector length as VL/128, doing that I can use just 8 bits, =
so
I can do this:

struct xen_arch_domainconfig {
/* IN/OUT */
uint8_t gic_version;
/* IN */
uint16_t tee_type;
/* IN */
uint8_t sve_vl_bits_enc;
/* IN */
uint32_t nr_spis;
[...]

To take advantage of the existing not explicit padding.

Is that what you meant?=20


>=20
> Jan


