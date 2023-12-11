Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ECC80C541
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 10:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651576.1017285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcwG-0004rx-SI; Mon, 11 Dec 2023 09:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651576.1017285; Mon, 11 Dec 2023 09:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcwG-0004pb-NT; Mon, 11 Dec 2023 09:51:00 +0000
Received: by outflank-mailman (input) for mailman id 651576;
 Mon, 11 Dec 2023 09:50:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtRo=HW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rCcwF-0004pV-1f
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 09:50:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe02::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c83f30a2-980a-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 10:50:57 +0100 (CET)
Received: from DUZP191CA0069.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::22)
 by PAWPR08MB10133.eurprd08.prod.outlook.com (2603:10a6:102:35f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 09:50:54 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::57) by DUZP191CA0069.outlook.office365.com
 (2603:10a6:10:4fa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 09:50:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 09:50:53 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Mon, 11 Dec 2023 09:50:53 +0000
Received: from 51dfdd52b1f7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B73709A2-2E41-4F47-A730-225E06930F64.1; 
 Mon, 11 Dec 2023 09:50:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 51dfdd52b1f7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Dec 2023 09:50:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA6PR08MB10545.eurprd08.prod.outlook.com (2603:10a6:102:3d3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 09:50:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b%6]) with mapi id 15.20.7068.025; Mon, 11 Dec 2023
 09:50:40 +0000
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
X-Inumbo-ID: c83f30a2-980a-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mrbu7QblfCfXyB0h49+TtL4P969ltWKUY7ovk7JoVjWIZj1TcvGPW16FYBUQTqrcUVihQK3wWSSIvZflaFwuZeedJpg1ffA+F6GZhKiLn0SRyWz+9myAc0ZqV2ovKWftksQ/RFMeNu3lfy9ToSIX7PFJdJzoEo1/R7Xek3MHjwfguryEAVr5X/bXYneKzjDgRBJ3VZ1gKYtl229zv+R6V0o5YHow/sr/5HfLGs4n6v9YT9Sd6jHWaBfApgoet/Mz/NBUFGTlvQOju9C8tqBHTi38OTOLJwa9z77xIf4QAMVQQJGEgw2tiTF+fnlKdnqmIsx3u3nSrca0sf+0AhS2NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDEZIRSB8QzQDCY1Lte8iskgU8y6FT1MNwWndMFO5YA=;
 b=BiXkAELOKC04AHeNb3lPPbD+2FqAMBkGfW+dwCb+YbXigzJgled0fuEdIglSlTZPszhr8MolfIV7NFvBS5NPIj/mVFsD2lChEADgMtQ0Tlcr4n4PT1SBFWoU0leIZhrqB1vXC5i6rDB2HTNO0xH2JgbNUSu9HMvYnvB3euNbIOSPvTAl2kgSwDjv7RrTN+CkHDCVcrFMTwCvW0GLl1pRIriJMtYR9H0zXoZrIY6fxKJScWHHfvoCZnF4MNIOOVhosRdYUyjpCAMyLaGMMG5kNxkMQBRVph5rPMvuzEb0u5DUSaIJHU9iMqyTs+Ds16aP3WDp1J6RxvQy3aMApWTfuA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDEZIRSB8QzQDCY1Lte8iskgU8y6FT1MNwWndMFO5YA=;
 b=QI1Ij0U0Rd4Uk5NhAmplbMufaadttZMg5sKdRSeog70hakAbyokAk+NNYiq7cciCOKy/hEE3QkNBhMu/wZ4gUjv3uHY/BTkUunLKWoh5pU36+uoF4d7qi38DWVrvpCP8RpUGVaE+uBIoS5d+SdYMXWmbW77mtxrP49Q3Jbpk8y8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a501cd1593da98a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dU5lWhwIMQPZhcTljOKi01zufeV+xqKaUg6WoNEKgNxpfPNuxDkmMzCyzNfVsqpEScSVsPerqLh12jVK4l30HGt3NlK10hnmRZPfUyX3UqDdSZmHTUr4acaVxzHiYj6oGm61ushIhOZU63xFPVSjxOPVl/lW8uWaUTDvqDpJJxZX7QhoDESqZhblTvC75Ex/HKN7k4sTf9KvahULGixadPzE68rl8fn187AvVvGDo54mLat17K8yPKqp4Hrv/LfawJ5tXZqcdX29+tyOq8FdkCSPRihjyX29YOPxwy99yR0u6A7Y6hkRp76WfE+bB7QUv0gA1ybdVZD0QlHz7g3DVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDEZIRSB8QzQDCY1Lte8iskgU8y6FT1MNwWndMFO5YA=;
 b=MONCQAP/+4UdnNLeb5Twt8vS2PvoqE3OrbLjP8u4jmEUGn+JdcNaRsxDT06S+D2Xwfpx2H8paTFEcJkWJC6e4P4TLkfhAlpn1olPY4igs8R55s6VaNCyg3Yunf8HWChsougK9GB164TPDRnLOKXniLqbBphR9mOkFWjjTLgsMexNATKBkJC3Dl/oS7Bq/Bm+d+ilL5cmH9yyka4ug9oKp6bR0iNZTM7E0z6x/I2io0O8El9O2U+HHVR5Q/cY+am+L5US4+6a9iPa4I+lP0jTQsBG72b7kY6Kv17F2Xp0G09xgnQ0wrBk99AnIWn/KEwPSXIlc/f1TmDlIx4GFiDtxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDEZIRSB8QzQDCY1Lte8iskgU8y6FT1MNwWndMFO5YA=;
 b=QI1Ij0U0Rd4Uk5NhAmplbMufaadttZMg5sKdRSeog70hakAbyokAk+NNYiq7cciCOKy/hEE3QkNBhMu/wZ4gUjv3uHY/BTkUunLKWoh5pU36+uoF4d7qi38DWVrvpCP8RpUGVaE+uBIoS5d+SdYMXWmbW77mtxrP49Q3Jbpk8y8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Chen <Wei.Chen@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
Thread-Topic: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
Thread-Index: AQHaKSlq43w0Rzr+HkWA0YYLdMYRQLCfOlsAgASiRIA=
Date: Mon, 11 Dec 2023 09:50:40 +0000
Message-ID: <A0AFA862-74CD-4712-AE0C-5C1E9EC802AC@arm.com>
References: <20231207162036.1921323-1-Henry.Wang@arm.com>
 <f3c759bc-f101-4e29-b4ff-dbf53d997d15@arm.com>
In-Reply-To: <f3c759bc-f101-4e29-b4ff-dbf53d997d15@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA6PR08MB10545:EE_|DU6PEPF0000B621:EE_|PAWPR08MB10133:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e05691-8605-4982-bf88-08dbfa2eaa5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nhu4va4sOFyymE3AgOY6yfsrqrNMoJDT+UH6cTGsJ7HdISgsqiqQ4KD51I41gy4HsvvvN/i6hpc1xrfinNUQDMmUJAeuAMNfGRN3di3JVTdc6MDE7xsc13bNspCTCPaalfIQD4bhHNQB2DhqJ3nS5kDoHZnN0jvL4nrU2DvuKrcH3FsoI1s7OwTw8lnu9TvY+DFiwvuj9Wj3maRlKZoSj78/t88wo8fJATRIvRXBEC5YjuZwccoNcChyNpe1lzR7MI4LAcb+aJDPtN52UfKeJ7lfmJKvXfLqwaKpyi7f8FqMwFM//pzj02hAJVhfGE5gSn+q+vw2Q15EdcQKcpkzBrBMgq76AjlCB0POtmKA1BwCxmRdev3OtcotZZ8Q/6vZJ2119vqs6wvVgZCzRH2cbL/96Kb1OmRTYAi8KA2pCboIoDj7fip6fgN5V4qkyAvdlDMTjcLgBQYZ7YAl7MJrVRX+MD3/4Z+tccSd9oSx2PPsOXHuUgRsXiNFnKQJpzIL0P7EpWyhQKTYBziPfngEGQFL+QQKKTrQ6toAQbcZo1RKtdxzik8enC+ytBURvxPJ58dEnUGI0+/ngNU2V4IkzFayuMurARolEWO9ZTLS/Z8osia8Awib3uVFKacvrV8DC4rwYYg158NwFgeRQVec3A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(346002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2616005)(6506007)(71200400001)(6512007)(53546011)(83380400001)(5660300002)(41300700001)(2906002)(4744005)(4326008)(6862004)(478600001)(6486002)(76116006)(8676002)(8936002)(66946007)(91956017)(66556008)(6636002)(37006003)(54906003)(64756008)(66446008)(66476007)(316002)(33656002)(86362001)(38100700002)(122000001)(36756003)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <340DCC78587FBC4D9B177CD0F332BCAB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10545
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9b820cc-9cea-4c86-7c90-08dbfa2ea28b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GhWHcIc6tUH2eDanH4zxrsAJ8R7gDCszl/VzltR71sT1qjixZeB28g+vtYXMo+pgUdPy0WuF/dMLyWeMdMYvpllf5bk5dRxI49mhr6Ggd937cAPWh44Ml2OR3Ch8ESC9/E/IP+FyZKIa+TBxdc0YXfspSpTe3PoEwWPPRwx2chTtk+W7mI/gxIFHRhdtN4AP9yPOS7yXL27Jbnfp1AxCaFgnw+uRePzW+/T89P+IKBMIO1zgf6FnBgnTaSsQgSnwOabgpHqoB0obVjNDrRxbaTAYcwLRRxkZT+DbQcilwBNliyKJlmvppwiRiiPgBZmEOaMIykp06Qg9ufD63pYQUJgvhjXJINsf927p1SWAkXpbuFQBQvWBMaLw1RBAIomJ9eJkOotkKVfQBoN7lFQJfA7zBYC/cChe2xxE7qyRWyDMS1WVgiitKhQncG7DuglcWxxRX//X4d7dDhl2hwSQpXe51GquGqjSSTMQW7cRBwCUKDhB7EbGRJXKYCfBonOHCTACC0ccsHa3SGEQMC+999HTwO80qgrvi44FBvR5eLHj0hgH+C9ehMSD5j4IwoSDNSFKtgBPcE6J8GknpVkpFoov6gD2T0L3JNhr0mPEru+MuN+FOS1nAv0jfd+sanO9VJ3RxlXbOnvHPyEeEU/kKQ6gQucltJgjlipxwNC3bEf9z5zUvtpi0gtfPyDeNrxTzMhZdPjGyL5M7a9JXHUulsC2UAFy1NkwL61Pa8C5Ubo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(46966006)(40470700004)(36840700001)(6512007)(40460700003)(6506007)(53546011)(36860700001)(5660300002)(47076005)(336012)(26005)(2616005)(107886003)(33656002)(36756003)(6636002)(54906003)(70586007)(70206006)(6486002)(40480700001)(2906002)(83380400001)(81166007)(82740400003)(41300700001)(356005)(478600001)(86362001)(8676002)(8936002)(4326008)(6862004)(316002)(37006003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 09:50:53.6742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e05691-8605-4982-bf88-08dbfa2eaa5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10133



> On 8 Dec 2023, at 12:04, Wei Chen <Wei.Chen@arm.com> wrote:
>=20
> Hi Henry,
>=20
> On 2023/12/8 00:20, Henry Wang wrote:
>> I've finished the opportunity to do two releases (4.17 and 4.18)
>> and Oleksii Kurochko has volunteered to be the next release manager.
>> Hand over the role to him by changing the maintainership of the
>> CHANGELOG.md.
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0fcf5a6f36..702032cc12 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -278,7 +278,7 @@ S: Supported
>>  F: xen/drivers/passthrough/arm/smmu-v3.c
>>    Change Log
>> -M: Henry Wang <Henry.Wang@arm.com>
>> +M: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>  R: Community Manager <community.manager@xenproject.org>
>>  S: Maintained
>>  F: CHANGELOG.md
>=20
> I'm proud of your work on the last two Xen releases.
> Thanks for your works!
>=20

I am seconding that.

Thanks a lot Henry for the great work you made during those 2 releases.
Cheers
Bertrand



