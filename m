Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F87975C741
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 14:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567528.886701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMphx-0002vl-9b; Fri, 21 Jul 2023 12:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567528.886701; Fri, 21 Jul 2023 12:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMphx-0002u7-5j; Fri, 21 Jul 2023 12:58:09 +0000
Received: by outflank-mailman (input) for mailman id 567528;
 Fri, 21 Jul 2023 12:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=So7w=DH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qMphv-0002u0-Vf
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 12:58:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a724bda-27c6-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 14:58:03 +0200 (CEST)
Received: from DUZPR01CA0125.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::17) by DB8PR08MB5450.eurprd08.prod.outlook.com
 (2603:10a6:10:116::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 12:57:59 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::3a) by DUZPR01CA0125.outlook.office365.com
 (2603:10a6:10:4bc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 12:57:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.34 via Frontend Transport; Fri, 21 Jul 2023 12:57:59 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Fri, 21 Jul 2023 12:57:59 +0000
Received: from 965718d946b0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D593F57C-A0A1-4312-B2B2-3D15B7033F96.1; 
 Fri, 21 Jul 2023 12:57:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 965718d946b0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 12:57:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8184.eurprd08.prod.outlook.com (2603:10a6:20b:561::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 12:57:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:57:45 +0000
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
X-Inumbo-ID: 3a724bda-27c6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HWskh0fveJJhMerzTrltd9IHGI51igmE7n2ra54Tmc=;
 b=iXAflzj7hgwGsmOsYq5wOxjutfWc8pobl+XauwhPe8ogT3lX68uEdV1S2oR95T9KTJwdKYUX+BeENtSWFpwZcLh1qG3gfsjVEgWalTpK5+TMrOP8vSm8uiNfbC+PTwh2GqZhPQdOQDtMYFmdrzv+7uMM9rFA9RHKHlhuuYl94mk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf99cb2163f05b23
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2kDU5AQxMJO1vKmyYpme+IdMEN/9mj4uw+I1RX4NzH5efFS1Abgm8n6tJsTWNaiv9FJOrHNjMC2ry1pzcpCDnXduIV6K3ErDOFbVMzLPzWgOF6ie7XFHwQ66iFnDKS3oTIATJpGKDBS6cofZGlaQ28605d8BswdVQfNxjRuTlCIKtJFo7lEUWhecCY0nDx9M61Z62/u8QmiLsxVl5ZT3vHJSuehSn+hy76r1QIjrAh39dN4FMVq/fgEt8xL1N1FinyBpK/3i+6ARi+nGgzWJM8xVne9HDBcslWlAVBjmC52zpjFZkUlGQ5S0Ha4BXEXFSWEpkDqobNAFXgxSFEMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HWskh0fveJJhMerzTrltd9IHGI51igmE7n2ra54Tmc=;
 b=aRc/cbex2AW8eJvUROea8BO3fEsAynnFnN7LyuGMgrxXfVezPt+fk3WxNswopTJ3yh7DUuFv0e1Ahieg/4QgyOxo3D7y1HH0Nyvu1iVWIvi/qtOqqHaLN+QFqADYldauMtOiiAlVmFK6T3ROLYuJE4TWdLdddFWnHaXroHBWv3P9T/Qf6ONB1NqOcXkoyzEhZGMGpzMwnMnS+nmb42rIW9Nv0oxdEpkeg4NOTdx1h15IK4+LgNw3Tc2lIj7L+246aHkUAVBketq/wlRzxCXknafvvzZ/EJYp1KBvm85D5b7vU1v1UrV4wNE1jFM0fE0R1napgFT88kJoTkr61F9Vig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HWskh0fveJJhMerzTrltd9IHGI51igmE7n2ra54Tmc=;
 b=iXAflzj7hgwGsmOsYq5wOxjutfWc8pobl+XauwhPe8ogT3lX68uEdV1S2oR95T9KTJwdKYUX+BeENtSWFpwZcLh1qG3gfsjVEgWalTpK5+TMrOP8vSm8uiNfbC+PTwh2GqZhPQdOQDtMYFmdrzv+7uMM9rFA9RHKHlhuuYl94mk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jens Wiklander
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Topic: [PATCH v2] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Index: AQHZu7UoTgj0ElhTvUC42VsaPH5iba/D/OyAgAApYgCAAAR0AIAAA6qA
Date: Fri, 21 Jul 2023 12:57:45 +0000
Message-ID: <AF6DD999-0121-4AEE-BA01-890AC5E3490C@arm.com>
References:
 <c55ce2891172a696e8a29f8c9bcc9dd33ebe9e50.1689931326.git.bertrand.marquis@arm.com>
 <e6d72d9a-a146-733c-0a9b-016fb291c2ea@xen.org>
 <B5883910-D35A-404B-8EBA-8AAB6C093342@arm.com>
 <bf07cb42-eace-333f-4421-c0cfe0087d9a@xen.org>
In-Reply-To: <bf07cb42-eace-333f-4421-c0cfe0087d9a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8184:EE_|DBAEUR03FT020:EE_|DB8PR08MB5450:EE_
X-MS-Office365-Filtering-Correlation-Id: dd849cfa-2943-4125-469d-08db89ea1c5b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +ci4zqYl2dts8OsIBNq39sPhJ6kokFbzpNLPzzTgPMt0IeTxNJx/HSBqptFzvN2ckrUFoTVI9iLnin0rNzRbsPLOqiXLsKaWReT4zy1+oPipWbEbf6UfcbhaelNWeDan4nqw/OoqI8lRCuTe2tEQ7I4mSC7JP3MTMcaoELnvRpKKRR3Xcu8mMEpm2fRJo/yyRI1ZT2abUI0vtMIzREVUaaSquPTmh8t9Gy2sYLjIQupAkbRqHmb73ixesFGH7t7BQBG+xTz90M5uP0Qeb/Z0cMfbsZKDq49w0yEVcjBuGs/zFNuOSgkq/u69Fqp+t7eLuL72mtzx9uO8pQIsxexgiT3h96hqFhacA0DoVcwd5ATUlNCl+Dg6ELL7WPpbA+wtIHuBvtFE7D6AAFKSpyGTophLFHl6/lukPal2YYvd8QCx9aB7oct6u57STGqEW/CWhu22L5vu44kQa/0SyqjS5JqaxfXXZ+P64aZWwYksikrWVHUjDf4j0BEo1znlx3Om7OaQdhiW8nV57Ji+J8i5tN0uoMyk3YtM9GJcKyXeqbKItm6E5cGlZMpOV2dWnq0LivVgXerbtSiEgDikVjU8NFDIRXUD/qETIIkkK8R6VCE1vCkbXZVmLSVFDX5I/6s8QWzNA0kFOZK3C0JLZu+cQw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(2906002)(83380400001)(2616005)(38070700005)(86362001)(33656002)(36756003)(122000001)(38100700002)(41300700001)(53546011)(6506007)(6486002)(966005)(66446008)(66476007)(76116006)(91956017)(66946007)(6916009)(71200400001)(4326008)(64756008)(316002)(66556008)(26005)(186003)(6512007)(8936002)(8676002)(478600001)(54906003)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DDACD96C1D185141A02394353D431BE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8184
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b4cc738e-b04f-46fb-0ae2-08db89ea1435
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+yVehJbByawtV+aqJbpWiGlilxAGR33TH8oCzVAEkzhgzJMRer0btuN8F3jNEBBh5sv86wLGYWrvftsiFAYz52mpWwxDrPzmENS3GdEIn00qIc5vDLHtsr/mKT0ds2aReyQZwNbLkPJjbbhj87Bq/JQJ/2VTdiEGHkw7TkwzNu3tCTHtgBk74TkNZtTmz6B00DK2P7g0a8myANIsnMFDRrL+8Wqtautqw96GT0bzkho3CUzX3vq1hp/iwM1FnNMcokK0lFkZUoxKPiRLo1OIUqo+fr9oZBOuV27s/qDrsectQ/MjJsLXMF1HmVcrmgv4xg8eGm6J4B0IhUikfofjbBOy2ih4k3ecfHemgvfSpPdv0bz4EGGZP+LGFj+KHm2Mh9RGmSv1P74qLiAOiuMpxq/nrnugeDws4T6SQeacFKcuY1LJTu8F1G3thl8hCC/yznyJ2ii4fJwhlsMXy4PBiEJF10jWHOQCGEthpfTpEG4NUZ0/vIZ3Ts5nP9YGGGnicUfNU0Azd+FXX07ndIBXO5zMNRhklqneomtPwzeDb7nl2fTzCKFvzxxm7+4LwHKkJ8FV6fCOg3uME3q8pnOJGoLc1fSIJna/i9dOvUOQ4TtLNqett0VzaCAmleq9LO0JOlvREdgCQCdLWzgRzlsOSxblnfH+MJ52+TwZiuvbq8nEpnczJP2/g1tHlJywFrudnwFPNUIlOkUAFoGqWK1g1A6LWx2XwyME647IAfR+qF0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(54906003)(6486002)(478600001)(966005)(6512007)(36860700001)(40460700003)(83380400001)(33656002)(86362001)(40480700001)(6862004)(2906002)(2616005)(107886003)(336012)(36756003)(186003)(53546011)(6506007)(47076005)(26005)(82740400003)(81166007)(356005)(70586007)(4326008)(70206006)(316002)(41300700001)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:57:59.4153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd849cfa-2943-4125-469d-08db89ea1c5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5450

Hi Julien,

> On 21 Jul 2023, at 14:44, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 21/07/2023 13:28, Bertrand Marquis wrote:
>>> On 21 Jul 2023, at 12:00, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 21/07/2023 10:23, Bertrand Marquis wrote:
>>>> Rework TEE mediators to put them under a submenu in Kconfig.
>>>> The submenu is only visible if UNSUPPORTED is activated as all current=
ly
>>>> existing mediators are UNSUPPORTED.
>>>> While there rework a bit the configuration so that OP-TEE and FF-A
>>>> mediators are selecting the generic TEE interface instead of depending
>>>> on it.
>>>> Make the TEE option hidden as it is of no interest for anyone to selec=
t
>>>> it without one of the mediators so having them select it instead shoul=
d
>>>> be enough.
>>>> Rework makefile inclusion and selection so that generic TEE is include=
d
>>>> only when selected and include the tee Makefile all the time making th=
e
>>>> directory tee self contained.
>>>=20
>>> Is this a left over?
>> Oups yes, please remove.
>>>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>> Changes in v2:
>>>> - only included tee subdirectory in makefile if CONFIG_TEE is selected
>>>>   (reverts to state before patch)
>>>> - remove help in hidden TEE config
>>>> - rebase on top of staging
>>>> ---
>>>>  xen/arch/arm/Kconfig      |  7 -------
>>>>  xen/arch/arm/tee/Kconfig  | 17 ++++++++++++++---
>>>>  xen/arch/arm/tee/Makefile |  2 +-
>>>>  3 files changed, 15 insertions(+), 11 deletions(-)
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index 439cc94f3344..fd57a82dd284 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -175,13 +175,6 @@ config ARM64_BTI
>>>>     Branch Target Identification support.
>>>>     This feature is not supported in Xen.
>>>>  -config TEE
>>>> - bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
>>>> - default n
>>>> - help
>>>> -   This option enables generic TEE mediators support. It allows guest=
s
>>>> -   to access real TEE via one of TEE mediators implemented in XEN.
>>>> -
>>>>  source "arch/arm/tee/Kconfig"
>>>>    config STATIC_SHM
>>>> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
>>>> index db3ea78faaaa..c5b0f88d7522 100644
>>>> --- a/xen/arch/arm/tee/Kconfig
>>>> +++ b/xen/arch/arm/tee/Kconfig
>>>> @@ -1,7 +1,14 @@
>>>> +menu "TEE mediators"
>>>> + visible if UNSUPPORTED
>>>> +
>>>> +config TEE
>>>> + bool
>>>> + default n
>>>> +
>>>>  config OPTEE
>>>> - bool "Enable OP-TEE mediator"
>>>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>>>>   default n
>>>> - depends on TEE
>>>> + select TEE
>>>>   help
>>>>     Enable the OP-TEE mediator. It allows guests to access
>>>>     OP-TEE running on your platform. This requires
>>>> @@ -12,10 +19,14 @@ config OPTEE
>>>>  config FFA
>>>>   bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>>>>   default n
>>>> - depends on ARM_64 && TEE
>>>> + depends on ARM_64
>>>> + select TEE
>>>>   help
>>>>     This option enables a minimal FF-A mediator. The mediator is
>>>>     generic as it follows the FF-A specification [1], but it only
>>>>     implements a small subset of the specification.
>>>>       [1] https://developer.arm.com/documentation/den0077/latest
>>>> +
>>>> +endmenu
>>>> +
>>>> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
>>>> index 58a1015e40e0..1ef49a271fdb 100644
>>>> --- a/xen/arch/arm/tee/Makefile
>>>> +++ b/xen/arch/arm/tee/Makefile
>>>> @@ -1,3 +1,3 @@
>>>>  obj-$(CONFIG_FFA) +=3D ffa.o
>>>> -obj-y +=3D tee.o
>>>> +obj-$(CONFIG_TEE) +=3D tee.o
>>>>  obj-$(CONFIG_OPTEE) +=3D optee.o
>>>=20
>>> Same here? The rest LGTM and I would be happy to do the changes on comm=
it.
>> This one is not, I think it is more logic to keep that one like this so =
that if someone
>> creates a TEE not depending on this it could still put it here without c=
ompiling tee.o
>> for no reason.
> This seems pretty unlikely to me because the purpose of TEE is to provide=
 a generic interface to the common code. At least, the developer would need=
 to have a very good reason to diverge.
>=20
> Also, right now, make will not recurse to the directory tee if CONFIG_TEE=
=3Dn. So I would rather not have this change.

Ok will fix in v3.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



