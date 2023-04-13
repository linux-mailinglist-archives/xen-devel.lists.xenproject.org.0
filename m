Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C326E0F14
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520765.808738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxFD-0002Rj-09; Thu, 13 Apr 2023 13:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520765.808738; Thu, 13 Apr 2023 13:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxFC-0002P0-Sj; Thu, 13 Apr 2023 13:44:10 +0000
Received: by outflank-mailman (input) for mailman id 520765;
 Thu, 13 Apr 2023 13:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73wY=AE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pmxFB-0002Ou-LW
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:44:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42b6aca9-da01-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 15:44:09 +0200 (CEST)
Received: from DUZPR01CA0262.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::24) by DBBPR08MB5930.eurprd08.prod.outlook.com
 (2603:10a6:10:200::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Thu, 13 Apr
 2023 13:44:02 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::d2) by DUZPR01CA0262.outlook.office365.com
 (2603:10a6:10:4b9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 13:44:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Thu, 13 Apr 2023 13:44:01 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 13 Apr 2023 13:44:01 +0000
Received: from 2b12832b2021.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F72E3F02-77E9-473B-8CF2-552D0F44A20B.1; 
 Thu, 13 Apr 2023 13:43:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b12832b2021.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 13:43:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB8120.eurprd08.prod.outlook.com (2603:10a6:20b:58c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:43:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 13:43:48 +0000
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
X-Inumbo-ID: 42b6aca9-da01-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpDiLgjmhcno6+YylSBX0/fbamyJ59nPjnU0JZsH9h0=;
 b=c4lU0SlM2QE7utx0koHKHKLb3neiF4IvhtQCgwiXEq2f6VhTg/maBcElAov+4m5wUcLqMsJPTFAPg99UWMrjYGKXDyJzLWsIyeqCLOhClPz/J1OnyqS+lDttUF3kQBrwG8eU+nIPihwCsZ9bx/humBLPTcwQ/y9kforJIF6zzYw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d7973943360cc7f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXIhkfPb8W2jvGuxMia47xLqRxJiNyfEqSMFd4WI3Mi637MxvtB6AhHkJ7Bjg82GyLqap5AKBgcrZ5BwIlVHnvbmVLskviVqsJTQwYExhHCA9zKnlrtFdi6FEbfsCoU0JMqqRDLfYzyogVWGkuqcZ9YcDQ8Ln9eq4i2B/IX8bt7fyaRb6zarxOE9sd45VF9j91FiMkssWmycSoAMVk8OsX9xGoWourHDh61ZD681JVxYWd08LpO38XK+fM+xMIKoT57m51mk5jckSBdC2muCYn96xw/25+F6MIFNc8uFoxsolAk6selhLJM91Mfis1sGBgEMEmLspnJkSg68SujktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpDiLgjmhcno6+YylSBX0/fbamyJ59nPjnU0JZsH9h0=;
 b=L2uQv33w8X/7bQyfekx68R/OetJrh2yFaTqhZx1xo6GlZLRuZkf/sou8hRZU8edh5rWYCqGygksefJtM3NvCy4jBTICopILCJ5EbMTaRG6UyDNphd/JiNBCtND54HEl1s0ubuFtmLQe39yOhNf14KOYauUboxuo3uBayoMwdeMv95qEckkMSUUEpXiGbYXEy1/h54KVwbEqCudbLUXipf9F/OkD2hzm0ofBcuS9UbaaQDUrYeD2mqXCPDfSj65fQsCpJcKQYVK2fuVMw5Vh85Uy1jWyTS1XqHOHq6qmtxmgrShWZmUJW0nSE3qQ38v25M0XfMCpebIkUWVbRcIM2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpDiLgjmhcno6+YylSBX0/fbamyJ59nPjnU0JZsH9h0=;
 b=c4lU0SlM2QE7utx0koHKHKLb3neiF4IvhtQCgwiXEq2f6VhTg/maBcElAov+4m5wUcLqMsJPTFAPg99UWMrjYGKXDyJzLWsIyeqCLOhClPz/J1OnyqS+lDttUF3kQBrwG8eU+nIPihwCsZ9bx/humBLPTcwQ/y9kforJIF6zzYw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, Achin
 Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
Thread-Topic: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
Thread-Index: AQHZbdfL0AxH2Xu3t0igFa2jZHjA9K8pOEIAgAABeICAAAHsAIAABI2A
Date: Thu, 13 Apr 2023 13:43:45 +0000
Message-ID: <0B0212E8-BAC7-4557-B21B-B49EB14F1D09@arm.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-10-jens.wiklander@linaro.org>
 <2359695e-f8f8-cf51-27f9-5f0c776feca5@xen.org>
 <916BB708-3028-4AAB-BD6A-BCABAFBD7C45@arm.com>
 <2dba6372-330d-a068-241f-59e19b837150@xen.org>
In-Reply-To: <2dba6372-330d-a068-241f-59e19b837150@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB8120:EE_|DBAEUR03FT005:EE_|DBBPR08MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e23ba76-8fca-4159-3365-08db3c25240f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OTuEzy7Kw4oF+10rTaxvq5bddZFm92HxVS1hTbC+GOLuh5FRysrjCKnDegkQxdjDQFam0rZzqHwxAF4ksKZPdkCYlzvY1upNFVjDLwAHBduFysQ3JBLFU1doeYt4QLZGY0XvtpAJ1FZEMysjpC2miwsSu7wBh3QaHL8QDDZkSaNSVZf1bGkEmNwkoXOGoFT9+4wrkeGWHcIGN12OFog6CHvrX37kdjKld0Yvejz3izGPwQ9Xoo2Ay/0vL01MTKAoe5Q7l0NRyfbmtFQf8EmiMn5V2HLIdyl7Hxd8pItSqcpqhZMIWtHbQqvYKJoUvdefqpNomLQjxtVxnJoTSYwcIrD2HPoPKUQazwbARxf/FYZzws8nbDnGp0WJMBdLsJtQC06zivUm6LYdAiFNK92VmtELkV9inTxwW5nyMkyBEcY83LMFymS9UoDLhvWoxkLnCWypn78uoc1aBsKbIUNlzXMHckx8npxZPbuwClP3uiKt8OM1n5jv/VSALlhDXGZvgEw6vqXoz6vqGbQlcnRl6gCqK9XaZhXlNZamjpx1uBMxF7/enlCpEWd7E9dV/VaPxUVdt1qCMf/f8dJyZ8sR/yw1Phk5ZjXKoDzPEwy3ZfENxnAZ9wppgVd1yyv0qDceeALgfZ0g5B7gBUFZ9iCvvQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(41300700001)(2616005)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(91956017)(36756003)(186003)(83380400001)(2906002)(5660300002)(38070700005)(33656002)(8676002)(8936002)(86362001)(6666004)(71200400001)(54906003)(478600001)(6486002)(6506007)(6512007)(53546011)(26005)(316002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D9D03559D10EB42A969834AE2120A57@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8120
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18b6463f-39b3-4b90-69d4-08db3c251a86
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pWQs48axZRvGiKqefU4FZKVobYWzkCdVxW2EmL8Wkp2g7rkHkEDqRE6mzUkkCoimTWumVymVzRmaMjnGs+3zGci2/5e/topYy8lH8ygKzFyo9DAKxn2gaimZ3D+J2UyxEAVkKPSKfnPRt4gBq+zXh9wjp3aWWBfKF292BkOmc3d6X+ENShjVRoGcyCBGen+w1HtPFpNaqZadNV8G7Gjma6VtgPz81337YYJws0xcyIRv60APDyp1F5Dae9YZduEc9WCy7i2WsPvq0/L1MZUQplI2BZ7Yyta6Dskv/OPPBN9ldXEpT3326a+gqDKYe33gO/qY7tI6Tlxwn2VWCD2cbISvOSg6Zhv5PFBAJ/G2KRifl9A2taf1LRaa/5npgFjsyccAlDadX+0ijKIU22wBfsGsv1HUNbcG2hwROeLJiq8+ZyBcfQwLDOC3j4F/2hfqEv5ay+64biR2drTkB3g4X1glE5KQ4G/t3LG26AagoxGdWVdrpo509I+mEclQGWECX+FtDKeNL84cNt1MZPwLwhagrq+c87xg5mcLqOcCupMylS2rqdI5DiIdFQ8x2LmyB/tZyDk73qkSeop9QUMtlu/EuNjVZi71SXtxBwB8DEjSzDeopC+DPfrm0i5QH0Db6ffYhyOF+Yg7CrQzLX9Z2r+o2SzXlh+tuV1ohgZzSgjiRDK3FsODjsQ/1jrAEYL8D8lm/Yt631I/8ErnPmKIOQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(5660300002)(316002)(54906003)(478600001)(83380400001)(2616005)(336012)(47076005)(107886003)(6512007)(33656002)(36756003)(6666004)(6506007)(40480700001)(53546011)(186003)(26005)(356005)(81166007)(36860700001)(82310400005)(86362001)(82740400003)(6486002)(40460700003)(41300700001)(6862004)(70586007)(2906002)(8676002)(4326008)(70206006)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:44:01.9020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e23ba76-8fca-4159-3365-08db3c25240f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5930

Hi,

> On 13 Apr 2023, at 15:27, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 13/04/2023 14:20, Bertrand Marquis wrote:
>> Hi Julien,
>>> On 13 Apr 2023, at 15:15, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>> On 13/04/2023 08:14, Jens Wiklander wrote:
>>>> Adds support for sending a FF-A direct request. Checks that the SP als=
o
>>>> supports handling a 32-bit direct request. 64-bit direct requests are
>>>> not used by the mediator itself so there is not need to check for that=
.
>>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>>> ---
>>>>  xen/arch/arm/tee/ffa.c | 112 ++++++++++++++++++++++++++++++++++++++++=
+
>>>>  1 file changed, 112 insertions(+)
>>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>>> index f129879c5b81..f2cce955d981 100644
>>>> --- a/xen/arch/arm/tee/ffa.c
>>>> +++ b/xen/arch/arm/tee/ffa.c
>>>> @@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
>>>>      return true;
>>>>  }
>>>>  +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *res=
p)
>>>> +{
>>>> +    switch ( resp->a0 )
>>>> +    {
>>>> +    case FFA_ERROR:
>>>> +        if ( resp->a2 )
>>>> +            return resp->a2;
>>>> +        else
>>>> +            return FFA_RET_NOT_SUPPORTED;
>>>> +    case FFA_SUCCESS_32:
>>>> +    case FFA_SUCCESS_64:
>>>> +        return FFA_RET_OK;
>>>> +    default:
>>>> +        return FFA_RET_NOT_SUPPORTED;
>>>> +    }
>>>> +}
>>>> +
>>>> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_=
t a2,
>>>> +                               register_t a3, register_t a4)
>>>> +{
>>>> +    const struct arm_smccc_1_2_regs arg =3D {
>>>> +        .a0 =3D fid,
>>>> +        .a1 =3D a1,
>>>> +        .a2 =3D a2,
>>>> +        .a3 =3D a3,
>>>> +        .a4 =3D a4,
>>>> +    };
>>>> +    struct arm_smccc_1_2_regs resp;
>>>> +
>>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>>> +
>>>> +    return get_ffa_ret_code(&resp);
>>>> +}
>>>> +
>>>> +static int32_t ffa_features(uint32_t id)
>>>> +{
>>>> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>>>> +}
>>>> +
>>>> +static bool check_mandatory_feature(uint32_t id)
>>>> +{
>>>> +    int32_t ret =3D ffa_features(id);
>>>> +
>>>> +    if (ret)
>>>> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: err=
or %d\n",
>>>> +               id, ret);
>>>> +
>>>> +    return !ret;
>>>> +}
>>>> +
>>>>  static uint16_t get_vm_id(const struct domain *d)
>>>>  {
>>>>      /* +1 since 0 is reserved for the hypervisor in FF-A */
>>>> @@ -222,6 +272,57 @@ static void handle_version(struct cpu_user_regs *=
regs)
>>>>      set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
>>>>  }
>>>>  +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, u=
int32_t fid)
>>>> +{
>>>> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
>>>> +    struct arm_smccc_1_2_regs resp =3D { };
>>>> +    struct domain *d =3D current->domain;
>>>> +    uint32_t src_dst;
>>>> +    uint64_t mask;
>>>> +
>>>> +    if ( smccc_is_conv_64(fid) )
>>>> +        mask =3D GENMASK_ULL(63, 0);
>>>> +    else
>>>> +        mask =3D GENMASK_ULL(31, 0);
>>>> +
>>>> +    src_dst =3D get_user_reg(regs, 1);
>>>> +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
>>>> +    {
>>>> +        resp.a0 =3D FFA_ERROR;
>>>> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    arg.a1 =3D src_dst;
>>>> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
>>>> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
>>>> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
>>>> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
>>>> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
>>>> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
>>>> +
>>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>>> +    switch ( resp.a0 )
>>>> +    {
>>>> +    case FFA_ERROR:
>>>> +    case FFA_SUCCESS_32:
>>>> +    case FFA_SUCCESS_64:
>>>> +    case FFA_MSG_SEND_DIRECT_RESP_32:
>>>> +    case FFA_MSG_SEND_DIRECT_RESP_64:
>>>> +        break;
>>>> +    default:
>>>> +        /* Bad fid, report back. */
>>>> +        memset(&arg, 0, sizeof(arg));
>>>> +        arg.a0 =3D FFA_ERROR;
>>>> +        arg.a1 =3D src_dst;
>>>> +        arg.a2 =3D FFA_RET_ABORTED;
>>>> +    }
>>>> +
>>>> +out:
>>>> +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 &=
 mask,
>>>> +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 =
& mask);
>>>> +}
>>>> +
>>>>  static bool ffa_handle_call(struct cpu_user_regs *regs)
>>>>  {
>>>>      uint32_t fid =3D get_user_reg(regs, 0);
>>>> @@ -239,6 +340,10 @@ static bool ffa_handle_call(struct cpu_user_regs =
*regs)
>>>>      case FFA_ID_GET:
>>>>          set_regs_success(regs, get_vm_id(d), 0);
>>>>          return true;
>>>> +    case FFA_MSG_SEND_DIRECT_REQ_32:
>>>> +    case FFA_MSG_SEND_DIRECT_REQ_64:
>>>> +        handle_msg_send_direct_req(regs, fid);
>>>> +        return true;
>>>>        default:
>>>>          gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
>>>> @@ -326,6 +431,13 @@ static bool ffa_probe(void)
>>>>      printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>>>>             major_vers, minor_vers);
>>>>  +    /*
>>>> +     * TODO save result of checked features and use that information =
to
>>>> +     * accept or reject requests from guests.
>>>> +     */
>>>=20
>>> I am not entirely sure I understand this TODO. Does it mean a guest can=
 currently use a request that is not supported by FFA?
>> In fact this is a bit the opposite: in the following patch we check that=
 all features we could need are supported but if a guest is only using a su=
bset we might not need to have all of them.
>> Idea of this TODO would be to save the features supported and refuse gue=
st requests depending on the features needed for them.
>=20
> Thanks. I would suggest the following comment:
>=20
> /*
> * At the moment domains must supports the same features used by Xen.
> * TODO: Rework the code to allow domain to use a subset of the features
> * supported.
> */
>=20
> Note that I am using "domains" rather than "guests" because the latter do=
esn't include dom0.

Makes sense and new comment is nice.

Up to Jens to say if he is ok with it.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



