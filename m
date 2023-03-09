Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D06B280A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 16:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508306.782870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paHkc-0001JM-LI; Thu, 09 Mar 2023 15:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508306.782870; Thu, 09 Mar 2023 15:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paHkc-0001GY-IT; Thu, 09 Mar 2023 15:00:14 +0000
Received: by outflank-mailman (input) for mailman id 508306;
 Thu, 09 Mar 2023 15:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3pJ=7B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1paHkb-0001Ev-C0
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 15:00:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16210c5f-be8b-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 16:00:10 +0100 (CET)
Received: from DB7PR02CA0029.eurprd02.prod.outlook.com (2603:10a6:10:52::42)
 by DB9PR08MB9491.eurprd08.prod.outlook.com (2603:10a6:10:45a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Thu, 9 Mar
 2023 14:59:55 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::b4) by DB7PR02CA0029.outlook.office365.com
 (2603:10a6:10:52::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Thu, 9 Mar 2023 14:59:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19 via Frontend Transport; Thu, 9 Mar 2023 14:59:55 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Thu, 09 Mar 2023 14:59:54 +0000
Received: from fb41381b7d96.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7242CF2-3CC5-458E-BE64-DF7962F7B22E.1; 
 Thu, 09 Mar 2023 14:59:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb41381b7d96.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Mar 2023 14:59:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8352.eurprd08.prod.outlook.com (2603:10a6:20b:56a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 14:59:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 14:59:40 +0000
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
X-Inumbo-ID: 16210c5f-be8b-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjaLvVTnjgvv8v+khnbXvIzBExXHsDbEJL+g/kTRklA=;
 b=J4g+N8a6AqO/T/Be9E3hQne2cLmNHjeR/spvc0xatVKAjG8ckiLN3vz4cZ4GYFDt2q1TIZvS9/flxkGM8AwyETZeB/LkYoYmi6aAiWn0JLUeD1kszc+06rUrTIveZT6Ajk/0pyFLbpd4lPYh0VrfHR/Lj+EQo48GbefBPrJrNRM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ac0121d1705305d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcDkuI4/pyRYKvo68LDRlFHQ9JfD6W8nG/7wbZdieEXzk7Q5/+Rkc4ZfKqHkfELHKPnAYKmgbtuOvXbcB8Kt680ja7jnhAEQtmybTv5nSfmjYKSPtT02HM7yvOmDn5oWNfV/tvKreEQJJdtOy3lQiHu+rrR9MjCqy864jgwfY4nGWvhHc505PgrwAHcznm2NaUV6dlv9X/zVSDOVDYRKKe9rGrwQloSTSat+34uwBqKGFDRkbQKy/tPcl8R/v4d6q0nMPBMaGH9MO8T1fcNcONVr6GOkQipoozKJg/e8lJP8120fpJsKOSr4Bk/fbyDHQf2itdW53h6Q7NTCr8Hgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjaLvVTnjgvv8v+khnbXvIzBExXHsDbEJL+g/kTRklA=;
 b=m6tiG6GQ1C/SmFUdg88uHCW1Es+bOGIgkdNFYO+FY/G973sP93MKFvOJfy6dDP5tqN7FxSwg2cpqzdFibM/pX6mLqRfb7qIHLVxwtapKz3gzphE4CDJRgRi1mB1UgIfvALqmcdVvxI8cfndSBJQFw6Ke6qTFb98UVHw79f1hdPzhnHn2zlQ+m5F+W2+nyA/SPTUDVQ7zUNgDT143k7DhzJ0KLgbeqSV4RGxjgV86/bgt0b0E7fJHpu/hwWDDKrZ0s9uOdOgvZ5fvT/RpLUD8uHcGXk2L8MJW4QGOUOo3ZWzqKPu24G8DVL6/yx76CZ6YNOzkJGCYqxqz3s+ijjIU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjaLvVTnjgvv8v+khnbXvIzBExXHsDbEJL+g/kTRklA=;
 b=J4g+N8a6AqO/T/Be9E3hQne2cLmNHjeR/spvc0xatVKAjG8ckiLN3vz4cZ4GYFDt2q1TIZvS9/flxkGM8AwyETZeB/LkYoYmi6aAiWn0JLUeD1kszc+06rUrTIveZT6Ajk/0pyFLbpd4lPYh0VrfHR/Lj+EQo48GbefBPrJrNRM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, Andrei
 Cherechesu <andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Thread-Topic: [PATCH v1 2/2] arch/arm: time: Add support for parsing
 interrupts by names
Thread-Index:
 AQHZUN0sbGmRWBiDtEmQnPFLsz5lVK7vc/8AgABafACAAkqcgIAAIo2AgAAJfwCAAA/CAIAADAKAgAAGfwCAAAD0AIAAEPgAgAAN94CAAAZ7gA==
Date: Thu, 9 Mar 2023 14:59:40 +0000
Message-ID: <C85576C2-C41A-461D-B22A-415DFAEA1866@arm.com>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
 <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
 <7a0734e9-a980-3dc1-026d-0c96a89c4d5c@amd.com>
 <0932C0EB-F90A-45D4-87F4-3594E6E74C64@arm.com>
 <3c0a6e88-2a1a-f06a-cac1-59801b1acfd6@amd.com>
 <D0D43830-5F75-4284-86E5-967E2059B377@arm.com>
 <df481924-6fa9-cac3-f822-9ff51b0824fe@amd.com>
 <CA41DB66-DB7E-4EDD-9A34-38328A2A8C9E@arm.com>
 <93cefcfc-1cfe-bb79-0f6d-5e578ad153fa@amd.com>
 <70209e22-c52b-597a-81a2-750e2ca9aefa@oss.nxp.com>
In-Reply-To: <70209e22-c52b-597a-81a2-750e2ca9aefa@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8352:EE_|DBAEUR03FT021:EE_|DB9PR08MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb27593-8b79-4f41-3c4b-08db20aef181
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RFKaxm9KeIYeY9iPNxIJsY6V5o/865fvQP243EEY0//B3adiDz+b3wB7s5KOA5pxzHFHkG14RykTG8ZyJ8AeBo8FxBTHbCuaCbdmUPjMncZGGLsTWYEmnzZexwbXWzAuifQTXRGiGj1FgiRdKurlCoPGusFfoRrlwYAVvahR4N1nKIF9j4HSCQefpDW2C1dt/xtzAiwU3msU9y5Hiz60XmR4Yk/8HXgOtSP8s18pz9rjjElXV7nWcG/q/8q2x4S4cgcuBvTGz2fJJ8284DwKh2SxZy8zuNJ0WdASlnt1ySgjP4PDqCC9kuvhAMMf9UZYtkJiuWnnXmsOeMw821G5j10CsLWCYoBEtRcIcujPnAJKUT793VfBL5OpIg3YhVhySS0p/6zkhiAb/22fRTIHOyc24v5lT23N7Ajidhj2Wmyv24KL1O7agCVH8V5ARjVY6bYTvyN2CcNt2YfqqguekHkWS6bl4Z5UcAHRJkOhtw3Net/Q6vL1vGdoOxS/wT+l3iLuVDQr/CGBCdbSFYnNp5n95opHz/97/PuBQp45yEW6yOfewlPNlpUD+cUZ8g4Kq+dbM+IIwdEOl4FdMYCO9SYZrjy6kgTzN5k59KxIi+ltje6Ci9BwuSs7wP02HTHrc7xCHcyaT1H/Zme2mMxlUnVeY7QhsZUchxeyd/LSI5ZHJr0rugyR2NcXWPhZVS7tgYYxQuKAXzxh8gTG7S/8XQMEPrG4/JPxlcCyMz2UTDE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(38100700002)(86362001)(33656002)(66446008)(41300700001)(8936002)(38070700005)(36756003)(6916009)(122000001)(4326008)(64756008)(5660300002)(2906002)(76116006)(66556008)(66476007)(8676002)(66946007)(186003)(53546011)(2616005)(83380400001)(91956017)(54906003)(316002)(478600001)(6486002)(71200400001)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CD872275AA7716498813D4901178D36C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8352
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	976c6d93-c2a0-4a82-5d8d-08db20aee898
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0+jKc2WeI5/ij6POkNVDsBFOJIcTb9L2b+PBqK9NEXoub6ONhRiQVQrjva5zXTGIZySU54grQ4Y/topFH/WVZ/Bkxhpfxr65A2mkbYTpW40vw8YUraegQN9V8t3l8cm6yEkDWDVxH7U4RpB2NqH/l9eeejXEx+YfrZZmKP+F2PiavKBHSpHajH1EZWZQkkQDeHLJkrcE75j74+Q3iLjrITPcwURNfOJxgZ1pAlej219GNiOHWfdEvQjvxzi6AL2MFuGnxKl2XGCxQ+43/ImV4vkLcSjrFxOS2kic0ggvdVmbPD6uifG+NtB6yf47MFC1sZEJ6gNPFhQafmL9WF2I/MxonczylLlAAn5upjEY7uxavf1nV/hKV0nyArFvEfGU+1vgI8S7VMFdkkMdKM38ij0rmf+bmzw59yO1B6Ej6Ax4ciSv92F/QoPSFxcr81pNZ71yORb3mKQge7Bs3mCgi6Es0EI4LjBvBskDF5VL9mqSFRnQoVAZbJlf93jt8i64YsZqa48kLJxrBEjV7rKv+iWJsySdiFjKhumwAGTQLlTOFk2ILl9p1nvQ1Qn8AdPEsZ8UnET1TiCbzSJno76yk5N0fXCXbf/MD53OnjVqFwGTq8dybIUwuqkYg+lQIVXtVgYtaiTIMd1AnIZj2X18qcdS5dGywxlX09xhyjFlGt9pdTS+ai/7qSduCRpy4nxYNhfT1ql2bGLdKxKDkZekuQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199018)(36840700001)(46966006)(40470700004)(54906003)(82310400005)(316002)(36756003)(86362001)(40480700001)(33656002)(83380400001)(6506007)(336012)(6486002)(186003)(40460700003)(2906002)(8676002)(82740400003)(70206006)(36860700001)(41300700001)(70586007)(6862004)(2616005)(6512007)(26005)(478600001)(53546011)(47076005)(8936002)(4326008)(81166007)(5660300002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 14:59:55.0609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb27593-8b79-4f41-3c4b-08db20aef181
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9491

Hi,

> On 9 Mar 2023, at 15:36, Andrei Cherechesu <andrei.cherechesu@oss.nxp.com=
> wrote:
>=20
>=20
>=20
> On 09/03/2023 15:46, Michal Orzel wrote:
>>=20
>>=20
>> On 09/03/2023 13:45, Bertrand Marquis wrote:
>>>=20
>>>=20
>>> Hi Michal,
>>>=20
>>>> On 9 Mar 2023, at 13:42, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>=20
>>>> Hi Bertrand,
>>>>=20
>>>> On 09/03/2023 13:19, Bertrand Marquis wrote:
>>>>>=20
>>>>>=20
>>>>> Hi Michal,
>>>>>=20
>>>>>> On 9 Mar 2023, at 12:35, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>> On 09/03/2023 11:39, Bertrand Marquis wrote:
>>>>>>>=20
>>>>>>>=20
>>>>>>> Hi Michal,
>>>>>>>=20
>>>>>>>> On 9 Mar 2023, at 11:05, Michal Orzel <michal.orzel@amd.com> wrote=
:
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>> On 09/03/2023 09:02, Bertrand Marquis wrote:
>>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> Hi Stefano,
>>>>>>>>>=20
>>>>>>>>>> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.=
org> wrote:
>>>>>>>>>>=20
>>>>>>>>>> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>>>>>>>>>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.chere=
chesu@oss.nxp.com> wrote:
>>>>>>>>>>>>=20
>>>>>>>>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>>>>>>=20
>>>>>>>>>>>> Added support for parsing the ARM generic timer interrupts DT
>>>>>>>>>>>> node by the "interrupt-names" property, if it is available.
>>>>>>>>>>>>=20
>>>>>>>>>>>> If not available, the usual parsing based on the expected
>>>>>>>>>>>> IRQ order is performed.
>>>>>>>>>>>>=20
>>>>>>>>>>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>>>>>>>>>>> though it's currently not in use. If the "hyp-virt" PPI is
>>>>>>>>>>>> not found, the hypervisor won't panic.
>>>>>>>>>>>>=20
>>>>>>>>>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>>>>>>>>>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++---=
-
>>>>>>>>>>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>>>>>>>>>>=20
>>>>>>>>>>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/in=
clude/asm/time.h
>>>>>>>>>>>> index 4b401c1110..49ad8c1a6d 100644
>>>>>>>>>>>> --- a/xen/arch/arm/include/asm/time.h
>>>>>>>>>>>> +++ b/xen/arch/arm/include/asm/time.h
>>>>>>>>>>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>>>>>>>>>> TIMER_PHYS_NONSECURE_PPI =3D 1,
>>>>>>>>>>>> TIMER_VIRT_PPI =3D 2,
>>>>>>>>>>>> TIMER_HYP_PPI =3D 3,
>>>>>>>>>>>> -    MAX_TIMER_PPI =3D 4,
>>>>>>>>>>>> +    TIMER_HYP_VIRT_PPI =3D 4,
>>>>>>>>>>>> +    MAX_TIMER_PPI =3D 5,
>>>>>>>>>>>> };
>>>>>>>>>>>>=20
>>>>>>>>>>>> /*
>>>>>>>>>>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>>>>>>>>>>> index 433d7be909..794da646d6 100644
>>>>>>>>>>>> --- a/xen/arch/arm/time.c
>>>>>>>>>>>> +++ b/xen/arch/arm/time.c
>>>>>>>>>>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequ=
ency;
>>>>>>>>>>>>=20
>>>>>>>>>>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>>>>>>>>>>=20
>>>>>>>>>>>> +static const char *timer_irq_names[MAX_TIMER_PPI] =3D {
>>>>>>>>>>>> +    [TIMER_PHYS_SECURE_PPI] =3D "sec-phys",
>>>>>>>>>>>> +    [TIMER_PHYS_NONSECURE_PPI] =3D "phys",
>>>>>>>>>>>> +    [TIMER_VIRT_PPI] =3D "virt",
>>>>>>>>>>>> +    [TIMER_HYP_PPI] =3D "hyp-phys",
>>>>>>>>>>>> +    [TIMER_HYP_VIRT_PPI] =3D "hyp-virt",
>>>>>>>>>>>> +};
>>>>>>>>>>>> +
>>>>>>>>>>>=20
>>>>>>>>>>> I would need some reference or a pointer to some doc to check t=
hose.
>>>>>>>>>>>=20
>>>>>>>>>>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>>>>>>>>>>> {
>>>>>>>>>>>> ASSERT(ppi >=3D TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>>>>>>>>>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void=
)
>>>>>>>>>>>> {
>>>>>>>>>>>> int res;
>>>>>>>>>>>> unsigned int i;
>>>>>>>>>>>> +    bool has_names;
>>>>>>>>>>>> +
>>>>>>>>>>>> +    has_names =3D dt_property_read_bool(timer, "interrupt-nam=
es");
>>>>>>>>>>>>=20
>>>>>>>>>>>> /* Retrieve all IRQs for the timer */
>>>>>>>>>>>> for ( i =3D TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>>>>>>>>>> {
>>>>>>>>>>>> -        res =3D platform_get_irq(timer, i);
>>>>>>>>>>>> -
>>>>>>>>>>>> -        if ( res < 0 )
>>>>>>>>>>>> +        if ( has_names )
>>>>>>>>>>>> +            res =3D platform_get_irq_byname(timer, timer_irq_=
names[i]);
>>>>>>>>>>>> +        else
>>>>>>>>>>>> +            res =3D platform_get_irq(timer, i);
>>>>>>>>>>>> +
>>>>>>>>>>>> +        if ( res > 0 )
>>>>>>>>>>>=20
>>>>>>>>>>> The behaviour of the code is changed here compared to the curre=
nt
>>>>>>>>>>> version as res =3D 0 will now generate a panic.
>>>>>>>>>>>=20
>>>>>>>>>>> Some device tree might not specify an interrupt number and just=
 put
>>>>>>>>>>> 0 and Xen will now panic on those systems.
>>>>>>>>>>> As I have no idea if such systems exists and the behaviour is m=
odified
>>>>>>>>>>> you should justify this and mention it in the commit message or=
 keep
>>>>>>>>>>> the old behaviour and let 0 go through without a panic.
>>>>>>>>>>>=20
>>>>>>>>>>> @stefano, julien any idea here ? should just keep the old behav=
iour ?
>>>>>>>>>>=20
>>>>>>>>>> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 =
because
>>>>>>>>>> 0 is reserved for SGIs, not PPIs. So I think it is OK to conside=
r 0 an
>>>>>>>>>> error.
>>>>>>>>>=20
>>>>>>>>> Problem here is that a DTB might not specify all interrupts and j=
ust put
>>>>>>>>> 0 for the one not used (or not available for example if you have =
no secure
>>>>>>>>> world).
>>>>>>>> Xen requires presence of EL3,EL2 and on such system, at least the =
following timers needs to be there
>>>>>>>> according to Arm ARM:
>>>>>>>> - EL3 phys (if EL3 is there)
>>>>>>>=20
>>>>>>> This might be needed by EL3 but not by Xen.
>>>>>> Xen requires system with EL3 and if there is EL3, both Arm spec and =
dt bindings requires sec-phys timer to be there.
>>>>>> So it would be very strange to see a fake interrupt with IRQ being 0=
. But if we relly want to only care about
>>>>>> what Xen needs, then we could live with that (although it is difficu=
lt for me to find justification for 0 there).
>>>>>> Device trees are created per system and if system has EL3, then why =
forcing 0 to be listed for sec-phys timer?
>>>>>>=20
>>>>>=20
>>>>> Let's see that on the other angle: why should Xen check stuff that it=
 does not need ?
>>>> Because apart from what it needs or not, there is a matter of a failur=
e in Xen.
>>>> Xen exposes timer IRQs to dom0 as they were taken from dtb and allowin=
g 0 for any of the timer IRQ would result
>>>> in a Xen failure when reserving such IRQ. Xen presets SGI IRQs, meanin=
g bits 0:15 in allocated_irqs bitmap are set.
>>>> This is why when calling vgic_reserve_virq and passing SGI always resu=
lts in calling a BUG().
>>>>=20
>>>> So we have two options:
>>>> - panic earlier with a meaningful message when IRQ is 0
>>>> - let Xen continue and reach BUG which would be not that obvious for p=
eople using but not knowing Xen
>>>=20
>>> So you are saying that in the current state 0 would be ignored during s=
can and create a bug later.
>> Yes, provided platform_get_irq() returns 0. This is however only theory =
because IMO it is impossible at the moment.
>> Both GICs, do not allow specifying SGIs in dt bindings and require at le=
ast 3 cells where 1st one specifies type.
>> So if we have a fake IRQ 0 as PPI, platform_get_irq will return 16 and f=
or SPI - 32.
>> Therefore I cannot see how it would return 0.
>>=20
>> ~Michal
>>=20
>=20
>=20
> This was my original thought process as well when I initially
> implemented this fix. Thus, I figured 0 should also be an error case.
>=20
> Extending this, all SGI possible return values (0 to 15) should be
> errors here, right? But I'm not sure if we should also treat those extra
> cases here (1 to 15).
>=20
> So, to make sure we all aligned, the only change to be made in a v2 for
> this patch is the coding style for the added comment? Or do you also
> think a more specific check for valid PPI IDs returned (16 <=3D id <=3D 3=
1)
> would be beneficial?
>=20

No i think we should not check more.
Just add something in the commit message to mention this change and why it =
is ok.


Cheers
Bertrand

> Regards,
> Andrei


