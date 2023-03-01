Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA70D6A7035
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 16:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504120.776657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOj9-0003PL-Dc; Wed, 01 Mar 2023 15:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504120.776657; Wed, 01 Mar 2023 15:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOj9-0003MN-AA; Wed, 01 Mar 2023 15:50:47 +0000
Received: by outflank-mailman (input) for mailman id 504120;
 Wed, 01 Mar 2023 15:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Km5w=6Z=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pXOj7-0003MH-Hm
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 15:50:45 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d32bff9b-b848-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 16:50:44 +0100 (CET)
Received: from AM6PR10CA0094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::35)
 by AS8PR08MB6535.eurprd08.prod.outlook.com (2603:10a6:20b:336::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 15:50:37 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::79) by AM6PR10CA0094.outlook.office365.com
 (2603:10a6:209:8c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17 via Frontend
 Transport; Wed, 1 Mar 2023 15:50:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.18 via Frontend Transport; Wed, 1 Mar 2023 15:50:36 +0000
Received: ("Tessian outbound 2ba0ed2ebb9f:v135");
 Wed, 01 Mar 2023 15:50:36 +0000
Received: from 23d217f6310e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D80EA22A-4DDA-42FF-949B-FA82FDAE3CF5.1; 
 Wed, 01 Mar 2023 15:50:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 23d217f6310e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Mar 2023 15:50:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR3PR08MB5850.eurprd08.prod.outlook.com (2603:10a6:102:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 15:50:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 15:50:28 +0000
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
X-Inumbo-ID: d32bff9b-b848-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOah+8VV35cytoNff/TOiDoE0ghlFgycMBzb7wDgv9o=;
 b=NWQ9sOUep9g6Bz/gqxysQhOd3mBAwlqvl2137IeD7jbp666BvxhldidrO/HidgDaVJbyS5069UIKz1P9jau1rn2oTEMB1qxdlNjaogLNHsIusB5FVIsXiMpjUFRQ/saSXhzWT6zJEq937qOMHuzQUfvyM7bgcXqUDbljv+KmC8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84102b2f2c76c982
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGiimQj0i3yJKzMdeHVt8x98+6wphIuaINpSZddepIZ0bp0Bkj/15+96zOPfX01WStC3WGI6DZj3ENGjRWqVWiPuiKCH0AT5Arbp3DoPcrTr9HfY0JoSxXb10Abndypz3+INFYXN7dML9oEhIohbDmvW/zYcoi6jynL4W/ihQRSnRxiBPaHKLUlB6d2aRT9O8r1X00p9pXiM2sLO19HrZAo81RmXiNB4jg2lWMCDOj8S6GEV+sDi3uS6Y2oxfmZjNuuBPl3MurJGpe7UopXU0K9eB1A9NpBtQ6S85ZoQdtJeMmvKACoC3ArQIG5psbDmq2qWe0zo9FsoEonHCbRVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOah+8VV35cytoNff/TOiDoE0ghlFgycMBzb7wDgv9o=;
 b=jl6mkAxN0bScde7mZvl9GSFhpmfkgxJqEnv71UXmpQ8q2bxyTljnRWnildcRcpbv61J2TPqdJKwvk5G6U0qJmT4ZcB7mjaHW25MO41TACRbqkP9RkHrGG2wnt08hg55ZRra78nvS1LONeDZWuKv+ASexnTXUiEDE0TKhMMEoZ/aKFdykEfFZwSL+Bh9JlZmfBWX9RP3kjMoylrG4NnFlV9EhALDqvEJBOkHhy3Xaar6eEDOcNIo4giRSZO2NC9QrsPp2I7EsOXtxwdYmgfRQFO5Vt3sahfG9Kq9cv50rdX7YSQ2t/ctQSZnbQGv2Q2baA5VMJMlUMePebIGTCcULvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOah+8VV35cytoNff/TOiDoE0ghlFgycMBzb7wDgv9o=;
 b=NWQ9sOUep9g6Bz/gqxysQhOd3mBAwlqvl2137IeD7jbp666BvxhldidrO/HidgDaVJbyS5069UIKz1P9jau1rn2oTEMB1qxdlNjaogLNHsIusB5FVIsXiMpjUFRQ/saSXhzWT6zJEq937qOMHuzQUfvyM7bgcXqUDbljv+KmC8E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
Thread-Topic: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
Thread-Index: AQHZRtMbYfucWbm5fkaW7bEI3lX4ea7i8oGAgALYoYCAAFJBgA==
Date: Wed, 1 Mar 2023 15:50:27 +0000
Message-ID: <3FA94B6D-79B4-453C-A9E4-631452458CBD@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <3332563e64568b2ffd236b1f428c27aa4cdf9790.1677079672.git.jens.wiklander@linaro.org>
 <F22A4773-94E8-4F24-A5C8-BF4E075A7698@arm.com>
 <CAHUa44FrC_S1Ot8-2s3=q5f7omZ+gsZhYTJUTMA0yVG5BBp6mw@mail.gmail.com>
In-Reply-To:
 <CAHUa44FrC_S1Ot8-2s3=q5f7omZ+gsZhYTJUTMA0yVG5BBp6mw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PR3PR08MB5850:EE_|AM7EUR03FT039:EE_|AS8PR08MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb1344d-4ae6-4e8d-0f61-08db1a6cb353
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Hs5f82Ku7qEgAfzVmLJW7HW2QfH2sYhW3wRx7U3ONuOzv5SGVVZ2aUknm+k/kfDztONJYvey3oi3ydzlEdeZsuCsOYNO3lEhrtPUD8jL6HxwIDkn1C98FWsyWJNgarucN+hGxUhuEDhxX9Ka4IKeVk1CMzBIVJhpeHWQZUXkxg4UTPaWWY3CeWHhX/OTeo8Erc4oEZ0prmz3n8Vs6cTVaWt1/CNSU/CM4dhb+S6PB8+ndaHj48ypAgXyjJ3p3buNtxjBldwyytElc4/IS3Rn2M1F/lWiBrPyIpnRUic6FyILU2SWPHVMo55Zc/EAUuNCJb215fUtD+umCsUa0ZlFVdJjITcHlB/QmoMvGM8Mb/emh9cOuWVkO8NKtQITM1TyrjN71gsBhqFuoQbXy0Bvr0V9sk1PGatglhJ/wxCk3pReH1ThFteCXcIBFw6P2uTm4fLBl4r+4pQeaDe6rwZZh6Ca2AA5uUjDWGkpj6PT1RqbkolJbGeGjj80TKxkQI1VX/mBTakEKVOWH4g9k94lMxjkSpirfnGoersJd9bdSF5KRCaIeRSiCol2iUkNhsPU2WufGQk1dnlO6GTJATx6qsP2T3Y7J2MMv0FMjIGOHFcAWJQ++IHRnTHASPW2tHWMmcuxavu9P29i0nFGieojx5UCCvetNHf5SLJc14CejYU3v4lUqG7SG2kh9dzP4tyQMqRXsjKtTGhE+vwnTbIb6L1OYP4GGgpBpAEzOr1XjP4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(36756003)(33656002)(54906003)(316002)(83380400001)(478600001)(6486002)(71200400001)(6506007)(6512007)(2616005)(186003)(91956017)(8936002)(86362001)(2906002)(41300700001)(38070700005)(53546011)(5660300002)(66556008)(76116006)(66946007)(66446008)(64756008)(8676002)(6916009)(38100700002)(4326008)(122000001)(66476007)(66899018)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <176B6F12A919FF4492F0DF07ED032B3B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5850
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ec791bc-6435-486e-8649-08db1a6cadea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hoYvXZudP5/MDM+wVaMy25n1HeTRW27DHshuBhyoPTlXGEh31YY54GBgtr6oVpwx9ZtLCpnOy8+gFPirmQsaj1q/QqRlCnoEdxcxpKGr2x2gOTFG4tfDreSbWXLZAO7XtZPli+Bz4ZKgVPFSMiScqhezC0OZImcDeveaT7bfxvO1s3XfwuNPSyhi/iUXkXtvb/CkpFf+KzC4R6xlT/3zTJWJwcB+/3A2e5Bm4K0qmkfRemeMKdjwIEOwwmDrx1iX7zCqr93OMdUbkU6EGId9mFalUf/JKEURU/zYocuNCcis6mF+bZP+83jEK83C7gnKdR9NU+tVVV0GQQliUADZtQUBzb0wBgNxlKhhy99mRa8eknO/abXy0qGPh/o3PSbUg42n2309WMaA8G9Qr9JtMqUwhT+JV6xYFKhR/AHOQ91Plml0wYjIvtUwA8Sgtehz+LNGKeuQqyMcejlz3SmYoBRQ2bTdW/prMv9+qfDQqUm0O0+yjwK4fW8xja2WJYo16byIwYyYQPeuN87zFFAEK0VZHlwKMI4YdC5iGiG9K8yPhvrANtKLyFpE3X9LUJbzhD322T5BIFRfCj00fkeX9iCPwl20+pBzvj9htSQbpBXbaPsz6KVYyiu0SR0FNcskIlXWxwxQDw/tdKQk2POlq9sZCfJYtjBAFe+SFQvFB9TYVSMbDQXUGBwGUELpuUx9dBydUNvA+EnNPu4kp3f6Xg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(40460700003)(36756003)(47076005)(53546011)(6486002)(6506007)(2616005)(186003)(6512007)(336012)(26005)(316002)(4326008)(54906003)(41300700001)(8676002)(70586007)(70206006)(2906002)(6862004)(8936002)(5660300002)(478600001)(81166007)(82740400003)(86362001)(40480700001)(33656002)(82310400005)(356005)(36860700001)(83380400001)(66899018);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 15:50:36.9630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb1344d-4ae6-4e8d-0f61-08db1a6cb353
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6535

Hi Jens,

> On 1 Mar 2023, at 11:55, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Hi Bertrand,
>=20
> On Mon, Feb 27, 2023 at 4:28 PM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Jens,
>>=20
>>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>>>=20
>>> Adds support for sending a FF-A direct request. Checks that the SP also
>>> supports handling a 32-bit direct request. 64-bit direct requests are
>>> not used by the mediator itself so there is not need to check for that.
>>>=20
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>> xen/arch/arm/tee/ffa.c | 119 +++++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 119 insertions(+)
>>>=20
>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>> index 463fd7730573..a5d8a12635b6 100644
>>> --- a/xen/arch/arm/tee/ffa.c
>>> +++ b/xen/arch/arm/tee/ffa.c
>>> @@ -142,6 +142,7 @@
>>>=20
>>> struct ffa_ctx {
>>>    uint32_t guest_vers;
>>> +    bool interrupted;
>>=20
>> This is added and set here for one special error code but is never used.
>> I would suggest to introduce this when there will be an action based on =
it.
>=20
> I'm sorry, I forgot about completing this. I'll add code to deal with
> FFA_INTERRUPT. This will be tricky to test though since we don't use
> FFA_INTERRUPT like this with OP-TEE. The Hypervisor is required by the
> FF-A standard to support it so I better add something.
>=20
>>=20
>>> };
>>>=20
>>> /* Negotiated FF-A version to use with the SPMC */
>>> @@ -167,6 +168,55 @@ static bool ffa_get_version(uint32_t *vers)
>>>    return true;
>>> }
>>>=20
>>> +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
>>> +{
>>> +    switch ( resp->a0 )
>>> +    {
>>> +    case FFA_ERROR:
>>> +        if ( resp->a2 )
>>> +            return resp->a2;
>>> +        else
>>> +            return FFA_RET_NOT_SUPPORTED;
>>> +    case FFA_SUCCESS_32:
>>> +    case FFA_SUCCESS_64:
>>> +        return FFA_RET_OK;
>>> +    default:
>>> +        return FFA_RET_NOT_SUPPORTED;
>>> +    }
>>> +}
>>> +
>>> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t=
 a2,
>>> +                               register_t a3, register_t a4)
>>> +{
>>> +    const struct arm_smccc_1_2_regs arg =3D {
>>> +        .a0 =3D fid,
>>> +        .a1 =3D a1,
>>> +        .a2 =3D a2,
>>> +        .a3 =3D a3,
>>> +        .a4 =3D a4,
>>> +    };
>>> +    struct arm_smccc_1_2_regs resp;
>>> +
>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>> +
>>> +    return get_ffa_ret_code(&resp);
>>> +}
>>> +
>>> +static int32_t ffa_features(uint32_t id)
>>> +{
>>> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>>> +}
>>> +
>>> +static bool check_mandatory_feature(uint32_t id)
>>> +{
>>> +    uint32_t ret =3D ffa_features(id);
>>> +
>>> +    if (ret)
>>> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing\n", i=
d);
>>=20
>> It might be useful here to actually print the error code.
>> Are we sure that all errors actually mean not supported ?
>=20
> Yes, that's what the standard says.
>=20
>>=20
>>> +
>>> +    return !ret;
>>> +}
>>> +
>>> static uint16_t get_vm_id(const struct domain *d)
>>> {
>>>    /* +1 since 0 is reserved for the hypervisor in FF-A */
>>> @@ -208,6 +258,66 @@ static void handle_version(struct cpu_user_regs *r=
egs)
>>>    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
>>> }
>>>=20
>>> +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uin=
t32_t fid)
>>> +{
>>> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
>>> +    struct arm_smccc_1_2_regs resp =3D { };
>>> +    struct domain *d =3D current->domain;
>>> +    struct ffa_ctx *ctx =3D d->arch.tee;
>>> +    uint32_t src_dst;
>>> +    uint64_t mask;
>>> +
>>> +    if ( smccc_is_conv_64(fid) )
>>> +        mask =3D GENMASK_ULL(63, 0);
>>> +    else
>>> +        mask =3D GENMASK_ULL(31, 0);
>>> +
>>> +    src_dst =3D get_user_reg(regs, 1);
>>> +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
>>> +    {
>>> +        resp.a0 =3D FFA_ERROR;
>>> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
>>> +        goto out;
>>> +    }
>>> +
>>> +    arg.a1 =3D src_dst;
>>> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
>>> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
>>> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
>>> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
>>> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
>>> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
>>> +
>>> +    while ( true )
>>> +    {
>>> +        arm_smccc_1_2_smc(&arg, &resp);
>>> +
>>> +        switch ( resp.a0 )
>>> +        {
>>> +        case FFA_INTERRUPT:
>>> +            ctx->interrupted =3D true;
>>> +            goto out;
>>> +        case FFA_ERROR:
>>> +        case FFA_SUCCESS_32:
>>> +        case FFA_SUCCESS_64:
>>> +        case FFA_MSG_SEND_DIRECT_RESP_32:
>>> +        case FFA_MSG_SEND_DIRECT_RESP_64:
>>> +            goto out;
>>> +        default:
>>> +            /* Bad fid, report back. */
>>> +            memset(&arg, 0, sizeof(arg));
>>> +            arg.a0 =3D FFA_ERROR;
>>> +            arg.a1 =3D src_dst;
>>> +            arg.a2 =3D FFA_RET_NOT_SUPPORTED;
>>> +            continue;
>>=20
>> There is a potential infinite loop here and i do not understand
>> why this needs to be done.
>> Here if something is returning a value that you do not understand
>> you send back an ERROR to it. I do not find in the spec where this
>> is supposed to be done.
>> Can you explain a bit here ?
>=20
> This should normally not happen, but the SP/SPMC is responding with a
> request that we don't know what to do with. The standard doesn't say
> how to handle that as far as I understand. However, returning back to
> the VM at this point with an error may leave the SP/SPMC in a strange
> state. So I think it's better to report back to the SP/SPMC that the
> request isn't understood and hopefully it can at least return back
> with an error in a sane state.
>=20
> I'll add something to the comment.

I discussed that with Achin and Marc today at Arm and if we get an invalid
fid we do not need to report it back like you did.
We should instead report this as an error to the requester.

This is good as it will remove the :-)

Cheers
Bertrand

>=20
>>=20
>>> +        }
>>> +    }
>>> +
>>> +out:
>>> +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & =
mask,
>>> +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 &=
 mask);
>>> +}
>>> +
>>> static bool ffa_handle_call(struct cpu_user_regs *regs)
>>> {
>>>    uint32_t fid =3D get_user_reg(regs, 0);
>>> @@ -225,6 +335,12 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
>>>    case FFA_ID_GET:
>>>        set_regs_success(regs, get_vm_id(d), 0);
>>>        return true;
>>> +    case FFA_MSG_SEND_DIRECT_REQ_32:
>>> +#ifdef CONFIG_ARM_64
>>> +    case FFA_MSG_SEND_DIRECT_REQ_64:
>>> +#endif
>>> +        handle_msg_send_direct_req(regs, fid);
>>> +        return true;
>>>=20
>>>    default:
>>>        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
>>> @@ -310,6 +426,9 @@ static bool ffa_probe(void)
>>>    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>>>           major_vers, minor_vers);
>>>=20
>>> +    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>>> +        return false;
>>=20
>> One could not need this feature and here this will make everything unava=
ilable instead.
>> Why not just reporting back the unsupported error to clients using unsup=
ported interfaces ?
>=20
> One could perhaps argue that this check should be moved to a later
> patch in this series. Perhaps there's some future configuration that
> might make sense without this feature, but for now, it doesn't make
> sense to initialize without it.
>=20
> Thanks,
> Jens
>=20
>>=20
>> Cheers
>> Bertrand
>>=20
>>> +
>>>    ffa_version =3D vers;
>>>=20
>>>    return true;
>>> --
>>> 2.34.1



