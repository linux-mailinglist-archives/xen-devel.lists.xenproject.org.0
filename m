Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3F97C55B7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 15:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615524.956810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqZTV-0004js-Kv; Wed, 11 Oct 2023 13:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615524.956810; Wed, 11 Oct 2023 13:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqZTV-0004i0-I7; Wed, 11 Oct 2023 13:42:09 +0000
Received: by outflank-mailman (input) for mailman id 615524;
 Wed, 11 Oct 2023 13:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRUZ=FZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qqZTT-0004hP-HM
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 13:42:07 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2075.outbound.protection.outlook.com [40.107.13.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f74c1d1d-683b-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 15:42:05 +0200 (CEST)
Received: from AS9PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::29) by PA4PR08MB5983.eurprd08.prod.outlook.com
 (2603:10a6:102:e7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 13:41:35 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::f2) by AS9PR01CA0024.outlook.office365.com
 (2603:10a6:20b:540::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37 via Frontend
 Transport; Wed, 11 Oct 2023 13:41:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.27 via Frontend Transport; Wed, 11 Oct 2023 13:41:33 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Wed, 11 Oct 2023 13:41:33 +0000
Received: from c3d73aea3d8e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C80CB99A-CA8E-415E-82FF-1433EFBD7FD5.1; 
 Wed, 11 Oct 2023 13:41:27 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3d73aea3d8e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Oct 2023 13:41:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7533.eurprd08.prod.outlook.com (2603:10a6:10:301::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Wed, 11 Oct
 2023 13:41:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 13:41:22 +0000
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
X-Inumbo-ID: f74c1d1d-683b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFUmOvOQrIMCfnKWS26Mjn70ytbwShNwwo3vXlyUw38=;
 b=urGPMbpytqXZXOVYYWltFXRURv6J/G/pMx6p2/BtcCyqRxcx2A1Q5A62lR7VSUE951ULnp3Gf8ikUdZhrze5yf8PqoPWE7m1wBiX28JRvidhfPRgByAR1Wc3duQBeRhFqH6ywlFotlRYjG6yLoXJb6T4X7Iwqe69xkchAAC4qII=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36d8ad0d09cb5dd7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcCA+kKUnesFRraSMhLGZSs0/x3XFntNSaU8vRelWBQj7TCUnEPKJMJasJZf7oWyZszKw6ME8MpG7TZ5563q5RDhiMFpZcNTD2G8ZS+rfzYMm8CeMIjtrO4Tp7JKVnhyjAWRBjh9FlRNwZcG2DW60VD9HoO7u40MJddLB6oFvUMrsHTnyrQxHCjbyd1Du6L+68zV8k1Qr2RFq040rMYnf228Bf0QrfiZQK0nYzsPFIHVSbYtr6H3NKgz6QkCOqx9Mmdifikb/pcBUy7P3uQ5ZlbmndcoQHb1baVWpaRkpga2CjrS3BvV+kDWlz9XPxJx6l2iRvNxG/GB+rmEs9ka9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFUmOvOQrIMCfnKWS26Mjn70ytbwShNwwo3vXlyUw38=;
 b=hkBD/MNgxtfB73DyOmPAgIWIPyUXJGi1s83vm5Fw+tWvmThW08Ufrbg13qDcgw15lzJHIIjC5h9hEz/W7y+PvmtYG9U3fbkSkpjl1OpyIKr6F9oA2qUvTWqMYSA7TtW1ekQm6ClEr8uZ/U/WspvbNjd7uJ6ib547PnQ+6YxeAy4ID270/LOuXsKvIyo89p49IFGLFnMmT9KFdiPXTkT9/7fct20U8DnIGXsNfhXL3Kw1vj4TM8zWZTOIZVV7elPz2L5OQ1IWOpowBc5whekrvP6deDDBqQ7RUzQPtYgAKlwBsND3q1h/hVUdhC6XnMjdAlJ2Aq/JzhxYiJWn8usvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFUmOvOQrIMCfnKWS26Mjn70ytbwShNwwo3vXlyUw38=;
 b=urGPMbpytqXZXOVYYWltFXRURv6J/G/pMx6p2/BtcCyqRxcx2A1Q5A62lR7VSUE951ULnp3Gf8ikUdZhrze5yf8PqoPWE7m1wBiX28JRvidhfPRgByAR1Wc3duQBeRhFqH6ywlFotlRYjG6yLoXJb6T4X7Iwqe69xkchAAC4qII=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.18] tools/pygrub: Fix pygrub's --entry flag for
 python3
Thread-Topic: [PATCH for-4.18] tools/pygrub: Fix pygrub's --entry flag for
 python3
Thread-Index: AQHZ/EhwoShlUm8+hUyEFVohORc7NbBEmKCA
Date: Wed, 11 Oct 2023 13:41:21 +0000
Message-ID: <BA1AB165-F01B-40B1-A565-2B239E3FD6C1@arm.com>
References: <20231011122520.1826-1-alejandro.vallejo@cloud.com>
 <d5507808-fb01-43b8-9393-ba287fcbb240@citrix.com>
In-Reply-To: <d5507808-fb01-43b8-9393-ba287fcbb240@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB7533:EE_|AM7EUR03FT026:EE_|PA4PR08MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc79fde-6744-4e30-1720-08dbca5fc87a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +UqVdE1fuR9p3cckf/5nvPw+LFaBTZFKqDAyqPtLFQvNreq4uosa5xWM8WBlsjP1kpRMxB2y7JCSTFmL04TBMiIYBrD+mv9WEg9f/XdCH+CEXD/ftC59M5Y5Xk0cbAL+Y58QtFAbnVTrR7Ocnm+buHhHUH/V6YYniRH6ZGZXQS7GiBG8+2H123Jac71S7BCr9Ztx1pDQ6pttHsDI1sWUWkI+FSly3uUkK8/Z+BERusKuRVf/IGZYoRvAPCUdes3qecSTRTYW5dmtnHLQyXNZasGbHqyz2jWwmB/3ndVEDXHA/hZpoPr2gw5zdY7gEwgk2o2LCpIeg+4gsjN8GlTBeR/chyxNZXdSWmVzRSVY1xrenMyV4VdM/HUqk/cZ/jl+53YKadi3vsqH8PpF81HcJ/2qdjLe3v0ykmsws9Wdico5J7Kqnfdm4U+uSfb78WgIb7rdGpYDorBvuBTfEHEzgP/Zfrejta9ru3uU5nM7meCH3GXJFsA1ZhzfN4gK8mcwvKta7bkVNjlB+tBy68D7siTOkr6/iMQaGxY1a3iEnLCbhaqu2qs+Z+UhchKC/OHbXeJcN6YNg++WfwhZmj7N68vN7BaNiY7IDXaxyI3bWg/j5Ehr13hdw8kpSlmcbDNc/5R2gj0A96bvd3WpeEu/Ww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(396003)(376002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2616005)(83380400001)(71200400001)(33656002)(6486002)(478600001)(38070700005)(53546011)(122000001)(26005)(6506007)(966005)(6512007)(38100700002)(66476007)(64756008)(66946007)(76116006)(91956017)(54906003)(66446008)(66556008)(41300700001)(4326008)(8676002)(8936002)(6916009)(316002)(86362001)(2906002)(36756003)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9709B0FE361A7342A86607000D97E83D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7533
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80c3ba9c-b347-4b15-48f0-08dbca5fc168
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XU9WHa6b1ZeYafreVUivOf7Q9TI1kuypWKhWV68BQQGqZAGbQajT5bcsoIF3jgZ53+PCNlt5zRtLwWvnD2bZ7cHF4VsQ1GAJI86Trp1ogA/Hm50ePqs9gn/SRJWRAoGT7Mk6J4oW3JKOWXyonG+nK4R6lLOKFI5YiLnIM5BZP/PXdlqTf+o4M9+RJ8cy4S1/Qp7bnRUZbdpBZPhe+sTC2C1zNyAs66nqXN3HSz+aGlcYg94Yk8XJ3uL5bc45AAY9Psf+6F+WJCfRK/dZtSgk7XKLzy3cZnIaKTX0ujZcFrBE9B/aduWGt2VnFxcTRZ+aEo4OfHEbF88UVXaK9Jl/QwmeDFLJjDdgKQ33UrfmTYwbicdOeVGypVApUBlUYAi/Jory2BQ/KkWDYywD0JjE+oTr85aIlD79mpD0nPNtKq4pwTKD+U+lZx+NsbIL+mYNReTZM7R7Y95TcUvCrme6XFVDTAJ3bLhC/tohRZ3VbazKVHQB9+RWcyVY1l+7O3vYc7t+UaUYUKNOvPeC1mhHYQAOwKD15Tos2iTHyC9asRpg9vGwLT99Ps99PX85nCdfoA1CEtFuLRQAu9xhguWO5mJY6MH0GRjrW11vrlHMMLvGXMc3inc9wfMmLGrEv/Iv1Q/1t09CuV17LcCvVSjO2bwUdi2dLPwC9Woq+dRM4VNXm38Or1duQvbkK4881XTefzUIZdwTNlvOxy3fE8k5dMf+ZfJaXmeuqjpCQia4DWk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(8936002)(40460700003)(8676002)(5660300002)(6862004)(316002)(41300700001)(36756003)(4326008)(2906002)(2616005)(336012)(26005)(36860700001)(47076005)(83380400001)(86362001)(6512007)(6506007)(107886003)(53546011)(356005)(81166007)(82740400003)(478600001)(966005)(6486002)(33656002)(70206006)(54906003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 13:41:33.6580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc79fde-6744-4e30-1720-08dbca5fc87a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5983

Hi Andrew, Alejandro,

> On Oct 11, 2023, at 21:39, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> On 11/10/2023 8:25 pm, Alejandro Vallejo wrote:
>> string.atoi() has been deprecated since Python 2.0, has a big scary warn=
ing
>> in the python2.7 docs and is absent from python3 altogether. int() does =
the
>> same thing and is compatible with both.
>>=20
>> See https://docs.python.org/2/library/string.html#string.atoi:
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> tools/pygrub/src/pygrub | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
>> index dcdfc04ff0..541e562327 100755
>> --- a/tools/pygrub/src/pygrub
>> +++ b/tools/pygrub/src/pygrub
>> @@ -731,7 +731,7 @@ class Grub:
>> def get_entry_idx(cf, entry):
>>     # first, see if the given entry is numeric
>>     try:
>> -        idx =3D string.atoi(entry)
>> +        idx =3D int(entry)
>>         return idx
>>     except ValueError:
>>         pass
>=20
> CC Henry for 4.18.  This was discovered late in the XSA-443 work and is
> one small extra bit of Python3 work.

Thanks.

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>=20
> Thanks,
>=20
> ~Andrew


