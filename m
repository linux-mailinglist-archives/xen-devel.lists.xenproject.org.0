Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3654C6A18F0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 10:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500866.772397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVUXw-0001tk-Uk; Fri, 24 Feb 2023 09:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500866.772397; Fri, 24 Feb 2023 09:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVUXw-0001qM-RT; Fri, 24 Feb 2023 09:39:20 +0000
Received: by outflank-mailman (input) for mailman id 500866;
 Fri, 24 Feb 2023 09:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/OIK=6U=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVUXu-0001pT-VU
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 09:39:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aaad18d-b427-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 10:39:16 +0100 (CET)
Received: from DB6PR0501CA0028.eurprd05.prod.outlook.com (2603:10a6:4:67::14)
 by GV2PR08MB9374.eurprd08.prod.outlook.com (2603:10a6:150:d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 09:39:13 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::3f) by DB6PR0501CA0028.outlook.office365.com
 (2603:10a6:4:67::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21 via Frontend
 Transport; Fri, 24 Feb 2023 09:39:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.24 via Frontend Transport; Fri, 24 Feb 2023 09:39:13 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Fri, 24 Feb 2023 09:39:13 +0000
Received: from a64373369177.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF014BAA-231E-4608-A634-FBEFC2293D88.1; 
 Fri, 24 Feb 2023 09:39:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a64373369177.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Feb 2023 09:39:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB5571.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 09:38:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 09:38:59 +0000
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
X-Inumbo-ID: 1aaad18d-b427-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtX+fRT9aF0cgsD/r6pLaSpb9wDi1/WXMmNDtc8YzdE=;
 b=rL8tRdiAi/xHMyqISQuhKhn42HyfJEf/z2efTKVsm6sErCaxbAkXIK/hk7TFdKgCkVosdhIhVgIf9dCjS4Tkvw5SXQUOlIflcMdH97RWVnhFr8NNBB34rxfjIILJrF5x4EQRlJL1wlbdzTKf7jRxJCupNtdDkjd358o3A1uTlfc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc04bff6c9509a55
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcDSW3DpldOItYrs76q8XZPutzYiV87rnHFPRDda3cv6oqtTo7TZRkBjTo8qSNNh9aSiWdGp+cyyE5Axbr/hRlIKOhCOpuS+6y4wKZgo8q6WR2sxhtuFQgS2diMYhr18yaDV28N+WRBx5a4o7y0e0UbGBS96bzbUNPFAL4glE0DXWfv4nbXRO+GI0iuxDI1VtZaedST9mub0+ROD/CO+ZHdz05Eb+zfmA9tGGvL/DAX36DI8j/82iH8FXdC+mRUqrDFyLTFAgEK8nR6ejySuceyVezGvYadnsJJR8lIPoWGwJeLQd7n2j72QjZCBL3n+6josyu2xUvGvtWl5YiH3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtX+fRT9aF0cgsD/r6pLaSpb9wDi1/WXMmNDtc8YzdE=;
 b=SQ5N/P5MH0fRIsN5dcfT4LV1FmCi9tjeybkmBYDyhrVTf4FmPnkizd380Y8tRJD0PChPqoGzt+P4RmbbFFWQSrRnbQDM0Qs/HEvHhvsPNi2woN8kOr90JIyIL+b7Ylcfi5LMeymMWD2xriXoHRKrWNF9YvRj1ojgCfqd8l8SfL0QKGck1BJjQ/yc56bDrR9ID6TnU9DRITgGII5sIzXNXBx75Vjzx/PZbhVMOsZNFzms5eK2+SbmMUXHzKYm+6uFNmlhv3bB9Mg/eReKLXwVBgfZtHH0eUHj17KMAy2CBR48KlDuxquTxqDCjCcKq/M/zamShQP60g5E/9DFiCv6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtX+fRT9aF0cgsD/r6pLaSpb9wDi1/WXMmNDtc8YzdE=;
 b=rL8tRdiAi/xHMyqISQuhKhn42HyfJEf/z2efTKVsm6sErCaxbAkXIK/hk7TFdKgCkVosdhIhVgIf9dCjS4Tkvw5SXQUOlIflcMdH97RWVnhFr8NNBB34rxfjIILJrF5x4EQRlJL1wlbdzTKf7jRxJCupNtdDkjd358o3A1uTlfc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 07/20] xen/arm: ffa: add defines for framework
 direct request/response messages
Thread-Topic: [XEN PATCH v7 07/20] xen/arm: ffa: add defines for framework
 direct request/response messages
Thread-Index: AQHZRtMc9l4FLuQsA0eLhPi3rXVDQK7d2fAA
Date: Fri, 24 Feb 2023 09:38:59 +0000
Message-ID: <BD5022BF-C157-4CF2-86D4-07345F64681E@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <904055064f4b4e4514acf1e64751672eca045c05.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <904055064f4b4e4514acf1e64751672eca045c05.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB5571:EE_|DBAEUR03FT049:EE_|GV2PR08MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: 17072fa4-e186-4055-8d5b-08db164afd1c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8f3h7GPciF05RXre8H974faTLWGu+Tl8KubOehupYF12vk0KTlOqtvfhfJazAzifMKCMgbfGB42RHGVit8j65HgW7egdlM6qAkjDFnNC+PjiZpE5f0zKr468mT+xIBl0LQeBIN1mousW3BWUl42BjV3Zg5wP137XWdZixo/nN6VFjErnIsobaWZhw4Eg+9uhaI+XRJmYYhLFFJ+ECFTrjMjWVnTh+0uA6vPGhuMZypAWh0qyteVvgw7JFEfViB9ehjUDldAIcMMbn7PhiDv2RjrdNT4OwY+ImGCxnCZPsrrd1dWyfeSZWAjtaCF4Wqs5iNNxaO/9I42/SdCqGlDeCamj28wuWuQ2IdcOHzrdEwP+4mNPstQaQmqePRTvGKQr6hHpsLPOrE0XSkZyFWC+9qB0ujahN4kMItactaRkzx/r/Hl0Vcq4ECrSntYzAPrzi4DqGVuFR5E/IUOI+OXAM/gGmC0+ePld2AoEvnwu73GqrNLyCkeAT0nmsTPgcB9OnQgPUQ303UWifulGRYTLaRzXMUlqOL/ud5rUP+IZU5k4avejzfnfRhj0uHPrH8yQi4i1A56K+Yb/k/rqUx/QoYTN4/5FViSpi0fMEh+71hj2fcwvZOu5rk6t4MynGWnq2DayuvfgqjJGpROSw29D1tVbUQSwooF8zmBeZtJRl7dgceBaY2SnmHvkxKLSYbW3a5dxu7WJiTBbS1kg1fx1F4redONqsTgP9jprz+piIG0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199018)(36756003)(33656002)(66556008)(66446008)(71200400001)(6486002)(83380400001)(2616005)(186003)(26005)(53546011)(6512007)(6506007)(8936002)(41300700001)(38070700005)(91956017)(86362001)(2906002)(5660300002)(15650500001)(316002)(54906003)(38100700002)(478600001)(6916009)(64756008)(8676002)(76116006)(66946007)(4326008)(66476007)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE81F2F280186C4FA5AE44DAE2D90FCB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5571
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a98b8cbb-606a-43af-481c-08db164af4dc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VZzdwaw8n0Ivxk7aP/H+Pd/fvzxhCRsscJdKJmSlHcWIcH7uYXZxuqRLRnIntGr/91O/KuWLo8/j4yuYJXzhluLr2dq9IBaOWxD6u3VjxvZpWS4KOjemUVySDdyDm6YwnJ9BSM9szBAplJbWNKG6GPICZg6rCqdnjmd8yWYSQhSGzksBDCZj8HZSHJ4jN/jWiNZyzVXDrTACwRNbTmoIoJ5TsWl5ZfvReVh3OJCuFmWJ9jLmReMDA1nvYBDDfgyFfEXoMWEiOlnq7g1bv9KaY3wHlRQjInOaRaywUKuGh/UkWcBwj1Yb5aCyuxKa3RNlAURup0+XIXl174zg+PMXqGvOdy5geOMTnuT8nEEQZuX5jPNQYxzY+i+eNyDpVYPqXNCXmxlMYqFD169KP+jYwZlTnCy6dgu8ZnARIIIWQ4paCdi2lW7GbV//vpPUvk5GPqCrc4UkyQIldAzW0Gqo1CFdjBk4AUr6JX/GSyElsSOaJ/jjhszi2VBC3ihDHaxVww/zCcZviMOg46hCMFnRQx7fDuXKk2IIOTNpbWoc2+bKSSwQZfHDVk//fSXWze6HagyCf2Yugic7jDVJWWx20bLiYEkMbduZZ8HODachUYMMVjeZGhnfi6CuQD0cBB78YSRiali93q+kUPJigN4NvfSlwKlK+XFHW8AbH+05pJhVAWG0RIglUQOkHcvEg6QloXkE09pwSmqS1jTPzEqLfg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(40460700003)(6862004)(5660300002)(15650500001)(82740400003)(8936002)(336012)(41300700001)(2906002)(53546011)(2616005)(47076005)(54906003)(6486002)(478600001)(6506007)(316002)(70586007)(26005)(70206006)(356005)(8676002)(6512007)(186003)(86362001)(33656002)(36756003)(82310400005)(40480700001)(83380400001)(81166007)(4326008)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 09:39:13.2798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17072fa4-e186-4055-8d5b-08db164afd1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9374

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds defines for framework direct request/response messages.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index f4562ed2defc..d04bac9cc47f 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -56,6 +56,15 @@
> #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
>                                                  FFA_MY_VERSION_MINOR)
>=20
> +/* Framework direct request/response */

In the previous patch you were more verbose in the comment which was nice.
I would suggest here to use the same "format":

Flags used for the MSG_SEND_DIRECT_REQ/RESP:
BIT(31): Framework or partition message
BIT(7-0): Message type for frameworks messages

> +#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
> +#define FFA_MSG_TYPE_MASK               0xFFU;

Maybe more coherent to name this FFA_MSG_FLAG_TYPE_MASK ?

I am a bit unsure here because we could also keep it like that and just
add _TYPE to other definitions after.

What do you think ?

> +#define FFA_MSG_PSCI                    0x0U
> +#define FFA_MSG_SEND_VM_CREATED         0x4U
> +#define FFA_MSG_RESP_VM_CREATED         0x5U
> +#define FFA_MSG_SEND_VM_DESTROYED       0x6U
> +#define FFA_MSG_RESP_VM_DESTROYED       0x7U
> +
> /*
>  * Flags used for the FFA_PARTITION_INFO_GET return message:
>  * BIT(0): Supports receipt of direct requests
> --=20
> 2.34.1
>=20

Cheers
Bertrand


