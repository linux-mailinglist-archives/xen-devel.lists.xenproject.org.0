Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB67C4B1B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 09:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615225.956511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqTE2-0000W9-5F; Wed, 11 Oct 2023 07:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615225.956511; Wed, 11 Oct 2023 07:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqTE2-0000TA-27; Wed, 11 Oct 2023 07:01:46 +0000
Received: by outflank-mailman (input) for mailman id 615225;
 Wed, 11 Oct 2023 07:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRUZ=FZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qqTE0-0000Si-By
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 07:01:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07372e31-6804-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 09:01:40 +0200 (CEST)
Received: from AS9PR06CA0206.eurprd06.prod.outlook.com (2603:10a6:20b:45d::26)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 07:01:33 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::be) by AS9PR06CA0206.outlook.office365.com
 (2603:10a6:20b:45d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43 via Frontend
 Transport; Wed, 11 Oct 2023 07:01:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.23 via Frontend Transport; Wed, 11 Oct 2023 07:01:32 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Wed, 11 Oct 2023 07:01:32 +0000
Received: from 8e53e0ba0238.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD784555-1BDF-432B-862D-5C22333DBDA6.1; 
 Wed, 11 Oct 2023 07:01:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e53e0ba0238.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Oct 2023 07:01:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9373.eurprd08.prod.outlook.com (2603:10a6:150:da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Wed, 11 Oct
 2023 07:01:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 07:01:17 +0000
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
X-Inumbo-ID: 07372e31-6804-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI6z/DQ74miAYgZbmUPP2txDtsLvkbLOyNxeY7Ig74Y=;
 b=zhWDdnU/nmQiULQVDBFSYmp4hWHG9a0mg4kUEzZd61YNLUNM1qT31onbhsb6p0ATp1qN2+rGGIg1I5GxaP311hYNqRj7OZWosJoXwt+f0QQiw07jJsyiJwWEDrwGTgQdh0qYGmc1VqKSHiTHziD8FJUnQ0udcZCtdQdyTKqbqBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 134e2a28b93e2444
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajW1aVEvXUKz/EBR8wSbEgLU3CMwFTidLrt6oMUPFqxwDQPbOoJ/2carsRODR9NtyKt6s3r1LA/aGbe8G+nZUJ5tUQ57GqP/Hx4oF8lfaBbCgd7ct61Du5xUtZhgHAv/VcydFAtOGBT0aeFQTDnpBOzfFQIVBJIooAyBwqMIVa5E0E2C6hpfyaeAcMwrKjgofHA29zWyuRiygquxsurwcisq6MU2zwFQoLLu0cILGkGnF7zNtjo1rLYD4fJjNqPzWrUKiQyZZVSv7bcfidcnEs0c9ENmFZndKdIE41QrtADXoKN6P6lKUpBNvdK812+2WaY1JHtZiiFR9gekoU8AiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oI6z/DQ74miAYgZbmUPP2txDtsLvkbLOyNxeY7Ig74Y=;
 b=J0ENC40NsQyiouTahGn8nJvQGDhZcRrCbVAzAYv+WFm7FSBkGyBHtffR4uSw4P09QgUnOti2Cc6W2k3orP9d4qwdSI68lmj5wfrlT4E/Q2hdnL7/hGjvnQiOz98ee9SfmynRnKq8Mn7RHqRQLDv/qvotG2C4wrEW85uO2e8D0tbkKrG0fVvpUqw80Yez2d7F6f09k/Ft4/IvnhY6hqjLifM/AZpwXJOJTze0eULP2HGlxJpwoupp6kiCFKg3/HxtDF7skvLuQcgN6WPiEL0Ziz6jbLcpH9dohpZex6rivNwRt+oZgSJWOLD6sNNqZm5iscuUmLwukfAhnOSydrrcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI6z/DQ74miAYgZbmUPP2txDtsLvkbLOyNxeY7Ig74Y=;
 b=zhWDdnU/nmQiULQVDBFSYmp4hWHG9a0mg4kUEzZd61YNLUNM1qT31onbhsb6p0ATp1qN2+rGGIg1I5GxaP311hYNqRj7OZWosJoXwt+f0QQiw07jJsyiJwWEDrwGTgQdh0qYGmc1VqKSHiTHziD8FJUnQ0udcZCtdQdyTKqbqBY=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Validate generic timer frequency
Thread-Topic: [PATCH] xen/arm: Validate generic timer frequency
Thread-Index: AQHZ8ghhUxpPHXka0EK/1dVmmxa3crAxa7iAgBHBwACAAQ3zgIAAAegA
Date: Wed, 11 Oct 2023 07:01:17 +0000
Message-ID: <B95911BA-5965-4100-A1FD-0E687424020B@arm.com>
References: <20230928123435.2802-1-michal.orzel@amd.com>
 <d406c4c6-07f7-442f-8bef-8ba42308ae93@xen.org>
 <4894d46e-97ab-434f-b637-d516db6564ea@xen.org>
 <75bb3d92-af1c-4165-8ebd-1c17590361cb@amd.com>
In-Reply-To: <75bb3d92-af1c-4165-8ebd-1c17590361cb@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB9373:EE_|AM7EUR03FT039:EE_|AS8PR08MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: a55ad966-e4ca-455e-37be-08dbca27e6e7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 teehDHAYbg3jzRU3bKsYL6UDjLUowshPQ7O5ZTAPgSkRfdNFdz4qJ7vumpbU2vr76MBcEZMSrTsOKPm8Go1zENX4iSojDBSErUAnCTniQ+sh0mZeoofjx84NH/OYIFt4Z18yKYcjx/tkzU9orRL37cYhbZrzSB/ElMe56D+hsMJo6m4I4Y3iE2N6bhueV8ubL+G+Bj1ZEIf8XVr3Gl2JNoCd0huGH9EDg4Zxj8XeksBWTYaNOyKRWOHsXhvWARK+j5lrE6ca8JAGWbwirs7Vpx8UCJTvNda12JwzWJ7EnfxyeMQUdAzlNm7bLo7CnG6Xn1LQF+utL6NT82AV2qKKWCHAz8+SoJ9ivgTlV/g2bAmzf3P5/Xn/vqrUORzTnLNvGmUKpD+qVLoJzK3U8t6GcF/cBNKoiRHpDtTyEpqDU7UcMMkroD6xBRxkbQCA5da/gZeMWqLinhslX4ocxxCFSaoYtAwU8FF/2tUqEu30koSJWzKrV1KZZ6zq1mwUjtdbdN+qlfpO5wt/ikFVQaKMH2YqA9Fxk2PlMKgYGgkxeLZpWguwD3XSB08oIM3yzdOT7vMw23bsUNqebuF0VZbBRjmOCiIHZEmKVGhJUMurAyqS304wfcW1jRh0XENx2Wacy7jT6V+s5m4XRXmYrReIuS01R86YWYXMcfXBffegNk0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(53546011)(6512007)(36756003)(33656002)(122000001)(86362001)(38070700005)(38100700002)(2906002)(83380400001)(15650500001)(26005)(6486002)(71200400001)(2616005)(6506007)(478600001)(8936002)(4326008)(8676002)(316002)(66476007)(76116006)(110136005)(66556008)(91956017)(66946007)(64756008)(54906003)(66446008)(41300700001)(5660300002)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2EBD0F2585218C4380E6255E5764476C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9373
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae7b2054-6b2f-4f94-f15f-08dbca27dd6e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Og0onDXgC7CgUzVRTttdOwQdBR4SluQJAruGK766W4cBEY3ElxGEFWcz+RMsWJw8p/bVkClKQfKmqeFZDrU6mB/pazoXnNJR7Lq+7aAi1ybMwJk9ITuAisIvjTRxCI26cldOJg90hMLxnf7uBVW/SUrL8xJj27PWBzSDiZ2nqUHo3E7imyDaSNcg8UBDf69mIlq61UorzDIBkl6S8SyT+Xlm0WVE4XM6AxrIA/Ol5K/6jLq/A+MmBw1YfA2zWsWuE7RYXRFFBuvoNudPadoRVkMIR/8/DOX58RTNcMPDMBBFpelK8Peke0CVVmDuI0vd6Sh/b6M8EKPIkkQA2VEjHjrXkV+r56zOKp0fY+zczwNQvPP9YcgvWFxRlVTM8CzqulGcgcoY35xn/N0zu/SBnRQ/eHct43wnyvY/hy6Ag3ey1thK24ik5VFmVV577rUfEDctAwtGogRw/oYWDGmrVUPpAx/XXHr/Ydz6J6KkZ3pJW67p6CBTqTO2rA90kYCB+V2M0DEYrtCOhWj6CeCyG3m7hg0OAXKxBds41BFci2Q3jlqSQNOs6x5sJCZLhznKc0CVEptWYLp9Ya0sUwlqfHS9lTUlYYTvC+h+dKNJuB7ax5H9mP4ihBLSwuzd+Sej39UcuYD5FJ6YJDZWjUki1ejsaClCkZ90uSbMnd5STDbX3+avletAFHe0c+A8PB3VTp9d6VxpOR9e7YX3hsiQAbl5/DdYvAaz8MZzmSRhd3zmHAKmLepGqWqy0rdxFQkfz1P/5oyLr+YFlXVULPu/Eg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(6512007)(26005)(336012)(6506007)(53546011)(107886003)(83380400001)(2616005)(47076005)(6486002)(478600001)(40480700001)(8936002)(8676002)(36756003)(5660300002)(4326008)(41300700001)(81166007)(356005)(82740400003)(86362001)(2906002)(36860700001)(33656002)(15650500001)(54906003)(40460700003)(110136005)(70586007)(316002)(70206006)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 07:01:32.9036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a55ad966-e4ca-455e-37be-08dbca27e6e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038

Hi Michal, Julien,

> On Oct 11, 2023, at 14:54, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Julien, Henry,
>=20
> On 10/10/2023 16:48, Julien Grall wrote:
>>=20
>>=20
>> (+ Henry)
>>=20
>> Hi Michal,
>>=20
>> On 29/09/2023 08:38, Julien Grall wrote:
>>> Hi Michal,
>>>=20
>>> On 28/09/2023 13:34, Michal Orzel wrote:
>>>> Generic timer dt node property "clock-frequency" (refer Linux dt bindi=
ng
>>>> Documentation/devicetree/bindings/timer/arm,arch_timer.yaml) is used t=
o
>>>> override the incorrect value set by firmware in CNTFRQ_EL0. If the val=
ue
>>>> of this property is 0 (i.e. by mistake), Xen would continue to work an=
d
>>>> use the value from the sysreg instead. The logic is thus incorrect and
>>>> results in inconsistency when creating timer node for domUs:
>>>>  - libxl domUs: clock_frequency member of struct xen_arch_domainconfig
>>>>    is set to 0 and libxl ignores setting the "clock-frequency" propert=
y,
>>>>  - dom0less domUs: "clock-frequency" property is taken from dt_host an=
d
>>>>    thus set to 0.
>>>>=20
>>>> Property "clock-frequency" is used to override the value from sysreg,
>>>> so if it is also invalid, there is nothing we can do and we shall pani=
c
>>>> to let user know about incorrect setting. Going even further, we opera=
te
>>>> under assumption that the frequency must be at least 1KHz (i.e. cpu_kh=
z
>>>> not 0) in order for Xen to boot. Therefore, introduce a new helper
>>>> validate_timer_frequency() to verify this assumption and use it to che=
ck
>>>> the frequency obtained either from dt property or from sysreg.
>>>>=20
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>=20
>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>=20
>> Going through the list of pending patches, I noticed Henry wasn't CCed.
>> Is this patch intended for Xen 4.18? If so, can you provide some
>> reasoning why would want it?
> Strictly speaking, lack of "for-4.18" prefix indicates that I did not par=
ticularly aim for 4.18.
> However, I find it useful, so I will leave it up to Henry to decide if we=
 want that or not.
>=20
> Benefits:
> - fixes the invalid logic the consequence of which might result in incons=
istency when booting
>  the same OS as libxl domU and dom0less domU.
> - prevents spreading out the error condition (i.e. rate < 1KHZ) that can =
lead to e.g. Xen inability to schedule,
>  by panicing with proper msg
> Risks:
> - early init code, no critical path, in case of an error, panic returned =
with proper msg - no risks AFAICT

Thanks for the explanation, this looks like an improvement for the
current code to me so I am fine with including it in 4.18=20

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> ~Michal


