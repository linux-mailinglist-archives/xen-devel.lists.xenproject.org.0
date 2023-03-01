Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1425B6A705B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 16:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504126.776666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOoQ-00046A-4X; Wed, 01 Mar 2023 15:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504126.776666; Wed, 01 Mar 2023 15:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOoQ-00043w-1Z; Wed, 01 Mar 2023 15:56:14 +0000
Received: by outflank-mailman (input) for mailman id 504126;
 Wed, 01 Mar 2023 15:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Km5w=6Z=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pXOoP-00043o-8A
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 15:56:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96fc988e-b849-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 16:56:13 +0100 (CET)
Received: from DU2PR04CA0340.eurprd04.prod.outlook.com (2603:10a6:10:2b4::12)
 by DB5PR08MB10287.eurprd08.prod.outlook.com (2603:10a6:10:4a5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 15:56:10 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::9c) by DU2PR04CA0340.outlook.office365.com
 (2603:10a6:10:2b4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17 via Frontend
 Transport; Wed, 1 Mar 2023 15:56:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.18 via Frontend Transport; Wed, 1 Mar 2023 15:56:08 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135");
 Wed, 01 Mar 2023 15:56:08 +0000
Received: from 1e0c0b63d7c6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 464DA629-12D8-40E1-91CE-44EB7CC986A2.1; 
 Wed, 01 Mar 2023 15:56:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1e0c0b63d7c6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Mar 2023 15:56:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8304.eurprd08.prod.outlook.com (2603:10a6:10:40c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 15:55:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 15:55:59 +0000
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
X-Inumbo-ID: 96fc988e-b849-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXMn/U0p4jW+dUD4ySx7SKC28kWYUqgz6cw8BTXC/gE=;
 b=ygljpB9Lmrj5I9ftEfiOGeFDveD2XOlDwm/wx3YezvT7MFjDZzhw8c/I0WSkzViJGA6tUo58TFKvi/D89EKHivvBycVNCF/y4YZPCqSlqYgt/pHx/reNOvSLfuvOL4A9nCQIkfeLcbdQ4B1GjPIKnOUst8rPE1lJ+q09MbE6tpw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7d1f43f390b50c1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dA1nQiFigFBw3AWhZNqWTsmh+i5JtyMPjADwYPd8Ysin2laEGTN2+8aSjZJQvSnYTwtrnoAZernKIvj3Th8pLJfUEFLcgmVh3iZaGnwqsQKu9zeM2VkF7VqRY3gBZRUEgL/lr079EMo0UCrfgfieEdorVIFrWokNqeq9HgvvZjvD8fcBPtltDX7p8JaFVVFdUzBn9Q2i/jLR6e/nswCpB5rXIsZb8E8fSK6Jnp2Y4heG7inY3mdJq9jDFRCD6Rx2Yzke9tuhuYxtKdu8MCCXm2XtvpytxwcWlq1O2w/wtTiewLifROwuKywMXM3S6GFbOWny+YfCUqC0xrK1EJMGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXMn/U0p4jW+dUD4ySx7SKC28kWYUqgz6cw8BTXC/gE=;
 b=SNioSvaTRW+IJcUG49nTRHwipxhQ02jwxateqLE60G0EbJ/RpEj9nUMHY3J/msnPBKb72z8o2jRLbdgY9rWTauuJkYXfytNlO6vH0Px+QI5d5PVTTy9s/AM1WaQzWf6279MJvBj/09fPZN6MM0uDiZXHjwvBQn4VGPSH+3uwRii+7AdQrar+hHQceX/Mf4kBaAXWn9+sJF8wX0edVBb8nuL/vRJe4zFl4ni0CCtUfIk4cWJILFq9jyongTAHWo53GQudDU/cNw4jHHBGrgQumueZ0S1UIQ9E4rNzfJ4eEKuF7ye5gviDcQg8izFczc1SVq4l82qGeL5qVJzpcahQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXMn/U0p4jW+dUD4ySx7SKC28kWYUqgz6cw8BTXC/gE=;
 b=ygljpB9Lmrj5I9ftEfiOGeFDveD2XOlDwm/wx3YezvT7MFjDZzhw8c/I0WSkzViJGA6tUo58TFKvi/D89EKHivvBycVNCF/y4YZPCqSlqYgt/pHx/reNOvSLfuvOL4A9nCQIkfeLcbdQ4B1GjPIKnOUst8rPE1lJ+q09MbE6tpw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 12/20] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Topic: [XEN PATCH v7 12/20] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Index: AQHZRtMbJTLQExtpBE6ThIQepjPcla7km2EAgAEk3QCAAF6wAA==
Date: Wed, 1 Mar 2023 15:55:59 +0000
Message-ID: <BF5ABB51-64E6-4726-927A-032968B29FD6@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <cfd9ae67bdf24bee796b418937dd1486018fd188.1677079672.git.jens.wiklander@linaro.org>
 <3DE2B127-8820-400A-86FC-3A38F40CADFD@arm.com>
 <CAHUa44EjD7mSE0DZShoRh9PAPVPWXL0gXUpi69s-2ktaMMSa8A@mail.gmail.com>
In-Reply-To:
 <CAHUa44EjD7mSE0DZShoRh9PAPVPWXL0gXUpi69s-2ktaMMSa8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8304:EE_|DBAEUR03FT020:EE_|DB5PR08MB10287:EE_
X-MS-Office365-Filtering-Correlation-Id: 542bbdd7-4d97-44f8-8bb9-08db1a6d78dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5cTDUWORq9EtK2V4XyfigYjNcLilqWFM4PFnxPqsMIlrnnwa2gNXZj0DdFsfqWgHMYFSR6ysyTlV37PQUBcazElIHKtwEEOVOo36hcvqBRTt7dAQKHo4HYvERpFLYriakw56jxCJqy1BTuHf92FgWE/+BqGLBeWTqxsNMHy6dQTm6TBC1vVRWoh/kKb5ehefdlHzt6sLUzBK8trR3r94k1U8ALUE1PUd9GlpQXkk/U5qNC04FxxMHyIiaacIWoLpvPMkVeDRIKdq97M8qXxQ+GSiwicQRPypMAKVreXOxXhtEv+Tmq5NWI4In6HldhUp3U/J+e+ZEH2SHuRngQ8tdv2g4L6n1GbSXJSsEyzrsdwcHJXAVLo7A4LbvpNg7KZn4hQL01uqJjo/IpZZFrW4yVoPbfQx8hiyPkIAnTEJqcmOIYOEll3VFmtHRqCUImJkBsm+uk30zgAOecnONmSJX12ZwMI9Qjl+vg8o5bgdNCFZaLgMcHTR/OBIZXLJOndQDoYR61JXtDnZI/kJpmyps8QKLp/cEDslQIZ03ghX/kk9GBI6ojxQBHRnNhdRGySvg/XsS6ZOCberVWeKpPUscyBfj9w/ftjCq9fDCNBferfPLAGccU8FV0nI+cgNbjGM4A0X1gCOax1+pBToicExB87D5d7DMGP6cwlZTpxnc77klUTcbJW9cs6UqF7eBvkR+oEVLHqjWOWjiqcDMK8vELY8bMZPJKV6gc+rcqn3EGM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199018)(2616005)(36756003)(53546011)(186003)(122000001)(38100700002)(8936002)(41300700001)(91956017)(66446008)(66476007)(66556008)(64756008)(478600001)(86362001)(6916009)(66946007)(8676002)(5660300002)(76116006)(4326008)(38070700005)(83380400001)(30864003)(316002)(6506007)(54906003)(33656002)(6486002)(2906002)(6512007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ABF2B200C9D9BA4BACBE771A7BC22C67@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8304
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48d47fce-db70-4fb8-222b-08db1a6d736a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u5l19nd310ABYeaxJbQzQWHszAgTqxyaGEHmH2d2f2ivKzSkxDz0dYkcAsOtGRSt8F0W80BHjcoqLz2omS8i2e/uPyjCSgBAr7ZBRRbgE6TngxfjkCIubwBHSX6ALsetA2M5UVlwlZiL9Tm/zrHi9NtLmyImWmtgWIQ0qFDHaPcbOTVtEtXQCAbMFttQX6BZIYBEFOtLQVZvcJDS7Cto2f/JXWwQfVis+ipkWE68a0kLekfMCz1Rnq7i6RJK8Ohx7E0QgspO50FeK4RzBiNeGs/thE0QIW4zRve7awwxuibL+fnnyy3+zRsfWZsPmg6v8FPWD4Kzx/A83ENAEkcyFYAC01Ibip/hya3FJCfjKqeKDLh1LuNtQ+akOCbHCuAppLh21F1Vd25gLu3mHKH8e8I95+7zp1sslcmXQhj2xhc6UcSWb/qIB3nSXv3lb5POQ6Y2KTLZaAad+BfPTI7ZGi+iL4/Z3H+sbf5m7RywmJq4K3BxRQQIJ1K4PwvdX5XtyrpMXjF4AqD4oY232ohkun453z8xH/VMOlPvfh5ytv4KPhNKB6soVkX3dgiY1hrcRRofkwxftccOPXKdrhDbjamcdbTbQwr5afDpScVtb67AdKPJG9qb5FIqfm4Eki8xaJDNAMFMVExZ2VyKWwXUSzA20T6kX+Q7yXU2dRiMVYY+5K+T01RxMyuyf/V5K/0MUYSZyjbC8F5yJv7Kd0Ex0A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199018)(36840700001)(40470700004)(46966006)(86362001)(82740400003)(47076005)(356005)(336012)(36860700001)(81166007)(82310400005)(33656002)(40460700003)(54906003)(83380400001)(2616005)(6486002)(2906002)(36756003)(316002)(6512007)(53546011)(6506007)(478600001)(40480700001)(26005)(186003)(5660300002)(30864003)(8936002)(6862004)(70586007)(41300700001)(70206006)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 15:56:08.4377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 542bbdd7-4d97-44f8-8bb9-08db1a6d78dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10287

Hi Jens,

> On 1 Mar 2023, at 11:16, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Hi Bertrand,
>=20
> On Tue, Feb 28, 2023 at 5:49 PM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Jens,
>>=20
>>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>>>=20
>>> The FF-A specification defines framework messages sent as direct
>>> requests when certain events occurs. For instance when a VM (guest) is
>>> created or destroyed. Only SPs which have subscribed to these events
>>> will receive them. An SP can subscribe to these messages in its
>>> partition properties.
>>>=20
>>> Adds a check that the SP supports the needed FF-A features
>>> FFA_PARTITION_INFO_GET and FFA_RX_RELEASE.
>>>=20
>>> The partition properties of each SP is retrieved with
>>> FFA_PARTITION_INFO_GET which returns the information in our RX buffer.
>>> Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
>>> caller (us), so once we're done with the buffer it must be released
>>> using FFA_RX_RELEASE before another call can be made.
>>>=20
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>> xen/arch/arm/tee/ffa.c | 191 ++++++++++++++++++++++++++++++++++++++++-
>>> 1 file changed, 190 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>> index 07dd5c36d54b..f1b014b6c7f4 100644
>>> --- a/xen/arch/arm/tee/ffa.c
>>> +++ b/xen/arch/arm/tee/ffa.c
>>> @@ -140,6 +140,14 @@
>>> #define FFA_MSG_SEND                    0x8400006EU
>>> #define FFA_MSG_POLL                    0x8400006AU
>>>=20
>>> +/* Partition information descriptor */
>>> +struct ffa_partition_info_1_1 {
>>> +    uint16_t id;
>>> +    uint16_t execution_context;
>>> +    uint32_t partition_properties;
>>> +    uint8_t uuid[16];
>>> +};
>>> +
>>> struct ffa_ctx {
>>>    uint32_t guest_vers;
>>>    bool interrupted;
>>> @@ -148,6 +156,12 @@ struct ffa_ctx {
>>> /* Negotiated FF-A version to use with the SPMC */
>>> static uint32_t ffa_version __ro_after_init;
>>>=20
>>> +/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
>>> +static uint16_t *subscr_vm_created __read_mostly;
>>> +static unsigned int subscr_vm_created_count __read_mostly;
>>=20
>> In the spec the number is returned in w2 so you should utse uint32_t her=
e.
>=20
> I don't understand. This value is increased for each SP which has the
> property set in the Partition information descriptor.
>=20
>>=20
>>> +static uint16_t *subscr_vm_destroyed __read_mostly;
>>> +static unsigned int subscr_vm_destroyed_count __read_mostly;
>>=20
>> Same here
>>=20
>>> +
>>> /*
>>> * Our rx/tx buffers shared with the SPMC.
>>> *
>>> @@ -237,6 +251,72 @@ static int32_t ffa_rxtx_map(register_t tx_addr, re=
gister_t rx_addr,
>>>    return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
>>> }
>>>=20
>>> +static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32=
_t w3,
>>> +                                      uint32_t w4, uint32_t w5,
>>> +                                      uint32_t *count)
>>> +{
>>> +    const struct arm_smccc_1_2_regs arg =3D {
>>> +        .a0 =3D FFA_PARTITION_INFO_GET,
>>> +        .a1 =3D w1,
>>> +        .a2 =3D w2,
>>> +        .a3 =3D w3,
>>> +        .a4 =3D w4,
>>> +        .a5 =3D w5,
>>> +    };
>>> +    struct arm_smccc_1_2_regs resp;
>>> +    uint32_t ret;
>>> +
>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>> +
>>> +    ret =3D get_ffa_ret_code(&resp);
>>> +    if ( !ret )
>>> +        *count =3D resp.a2;
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int32_t ffa_rx_release(void)
>>> +{
>>> +    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
>>> +}
>>> +
>>> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
>>> +                                      uint8_t msg)
>>=20
>> This function is actually only useable to send framework created/destroy=
ed
>> messages so the function name should be adapted to be less generic.
>>=20
>> ffa_send_vm_events ?
>>=20
>> unless you want to modify it later to send more framework messages ?
>=20
> That was the plan, but that may never happen. I'll rename it to
> ffa_send_vm_event() since we're only sending one event at a time.
>=20
>>=20
>>> +{
>>> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
>>> +    int32_t res;
>>> +
>>> +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
>>> +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
>>> +    else if ( msg =3D=3D FFA_MSG_SEND_VM_DESTROYED )
>>> +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
>>> +    else
>>> +        return FFA_RET_INVALID_PARAMETERS;
>>> +
>>> +    do {
>>> +        const struct arm_smccc_1_2_regs arg =3D {
>>> +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
>>> +            .a1 =3D sp_id,
>>> +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
>>> +            .a5 =3D vm_id,
>>> +        };
>>> +        struct arm_smccc_1_2_regs resp;
>>> +
>>> +        arm_smccc_1_2_smc(&arg, &resp);
>>> +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=3D =
exp_resp )
>>> +        {
>>> +            /*
>>> +             * This is an invalid response, likely due to some error i=
n the
>>> +             * implementation of the ABI.
>>> +             */
>>> +            return FFA_RET_INVALID_PARAMETERS;
>>> +        }
>>> +        res =3D resp.a3;
>>> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_RET=
RY );
>>=20
>> We might end up in an infinite loop here or increase interrupt response =
time.
>> In the general case we could return that code directly to the VM but her=
e we
>> are in the VM creation/destroy path so we cannot do that.
>>=20
>> Maybe in debug mode at least we should have a retry counter here for now
>> with a print ?
>=20
> OK, I'll add something.

In fact here we should always count and fail if we do it more than once or =
twice.

In a normal case, we would return the INTERRUPTED or RETRY to the caller so
that he would do the call again.
Here this is something done by Xen internally so we cannot do that (we coul=
d make
the VM creation fail but destroying we cannot) so we must limit the number =
of retry
and continue if this fails.

Cheers
Bertrand

>=20
>>=20
>>> +
>>> +    return res;
>>> +}
>>> +
>>> static uint16_t get_vm_id(const struct domain *d)
>>> {
>>>    /* +1 since 0 is reserved for the hypervisor in FF-A */
>>> @@ -371,6 +451,10 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
>>> static int ffa_domain_init(struct domain *d)
>>> {
>>>    struct ffa_ctx *ctx;
>>> +    unsigned int n;
>>> +    unsigned int m;
>>> +    unsigned int c_pos;
>>> +    int32_t res;
>>>=20
>>>     /*
>>>      * We can't use that last possible domain ID or get_vm_id() would c=
ause
>>> @@ -383,24 +467,121 @@ static int ffa_domain_init(struct domain *d)
>>>    if ( !ctx )
>>>        return -ENOMEM;
>>>=20
>>> +    for ( n =3D 0; n < subscr_vm_created_count; n++ )
>>> +    {
>>> +        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_id=
(d),
>>> +                                     FFA_MSG_SEND_VM_CREATED);
>>> +        if ( res )
>>> +        {
>>> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id=
 %u to  %u: res %d\n",
>>> +                   get_vm_id(d), subscr_vm_created[n], res);
>>=20
>> in this function, get_vm_id(d) will not change so i would suggest to sto=
re it in a local variable
>> instead of calling get_vm_id each time.
>=20
> OK
>=20
>>=20
>>> +            c_pos =3D n;
>>> +            goto err;
>>> +        }
>>> +    }
>>> +
>>>    d->arch.tee =3D ctx;
>>>=20
>>>    return 0;
>>> +
>>> +err:
>>> +    /* Undo any already sent vm created messaged */
>>> +    for ( n =3D 0; n < c_pos; n++ )
>>> +        for ( m =3D 0; m < subscr_vm_destroyed_count; m++ )
>>> +            if ( subscr_vm_destroyed[m] =3D=3D subscr_vm_created[n] )
>>> +                ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_=
id(d),
>>> +                                       FFA_MSG_SEND_VM_DESTROYED);
>>> +
>>> +    return -ENOMEM;
>>=20
>> The VM creation is not failing due to missing memory here.
>> We need to find a better error code.
>> Maybe ENOTCONN ?
>> I am open to ideas here :-)
>=20
> That makes sense, I'll change it to ENOTCONN.
>=20
>>=20
>>> }
>>>=20
>>> /* This function is supposed to undo what ffa_domain_init() has done */
>>> static int ffa_relinquish_resources(struct domain *d)
>>> {
>>>    struct ffa_ctx *ctx =3D d->arch.tee;
>>> +    unsigned int n;
>>> +    int32_t res;
>>>=20
>>>    if ( !ctx )
>>>        return 0;
>>>=20
>>> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
>>> +    {
>>> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_=
id(d),
>>> +                                     FFA_MSG_SEND_VM_DESTROYED);
>>> +
>>> +        if ( res )
>>> +            printk(XENLOG_ERR "ffa: Failed to report destruction of vm=
_id %u to  %u: res %d\n",
>>> +                   get_vm_id(d), subscr_vm_destroyed[n], res);
>>> +    }
>>> +
>>>    XFREE(d->arch.tee);
>>>=20
>>>    return 0;
>>> }
>>>=20
>>> +static bool init_subscribers(void)
>>> +{
>>> +    struct ffa_partition_info_1_1 *fpi;
>>> +    bool ret =3D false;
>>> +    uint32_t count;
>>> +    int e;
>>> +    uint32_t n;
>>> +    uint32_t c_pos;
>>> +    uint32_t d_pos;
>>> +
>>> +    if ( ffa_version < FFA_VERSION_1_1 )
>>> +        return true;
>>=20
>> Correct me if i am wrong but on 1.0 version we cannot retrieve the count=
 but
>> we could do the slow path and do a first loop on info_get until we get a=
n error ?
>=20
> Sending the events is not supported in 1.0 so there's nothing to
> record in that case.
>=20
> Thanks,
> Jens
>=20
>>=20
>>> +
>>> +    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count);
>>> +    if ( e )
>>> +    {
>>> +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
>>> +        goto out;
>>> +    }
>>> +
>>> +    fpi =3D ffa_rx;
>>> +    subscr_vm_created_count =3D 0;
>>> +    subscr_vm_destroyed_count =3D 0;
>>> +    for ( n =3D 0; n < count; n++ )
>>> +    {
>>> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
>>> +            subscr_vm_created_count++;
>>> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYE=
D)
>>> +            subscr_vm_destroyed_count++;
>>> +    }
>>> +
>>> +    if ( subscr_vm_created_count )
>>> +        subscr_vm_created =3D xzalloc_array(uint16_t, subscr_vm_create=
d_count);
>>> +    if ( subscr_vm_destroyed_count )
>>> +        subscr_vm_destroyed =3D xzalloc_array(uint16_t,
>>> +                                            subscr_vm_destroyed_count)=
;
>>> +    if ( (subscr_vm_created_count && !subscr_vm_created) ||
>>> +         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
>>> +    {
>>> +        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\=
n");
>>> +        subscr_vm_created_count =3D 0;
>>> +        subscr_vm_destroyed_count =3D 0;
>>> +        XFREE(subscr_vm_created);
>>> +        XFREE(subscr_vm_destroyed);
>>> +        goto out;
>>> +    }
>>> +
>>> +    for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
>>> +    {
>>> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED=
 )
>>> +            subscr_vm_created[c_pos++] =3D fpi[n].id;
>>> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROY=
ED )
>>> +            subscr_vm_destroyed[d_pos++] =3D fpi[n].id;
>>> +    }
>>> +
>>> +    ret =3D true;
>>> +out:
>>> +    ffa_rx_release();
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> static bool ffa_probe(void)
>>> {
>>>    uint32_t vers;
>>> @@ -447,7 +628,8 @@ static bool ffa_probe(void)
>>>    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>>>           major_vers, minor_vers);
>>>=20
>>> -    if (
>>> +    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
>>> +         !check_mandatory_feature(FFA_RX_RELEASE) ||
>>> #ifdef CONFIG_ARM_64
>>>         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
>>> #endif
>>> @@ -475,6 +657,9 @@ static bool ffa_probe(void)
>>>    ffa_page_count =3D 1;
>>>    ffa_version =3D vers;
>>>=20
>>> +    if ( !init_subscribers() )
>>> +        goto err_free_ffa_tx;
>>> +
>>>    return true;
>>>=20
>>> err_free_ffa_tx:
>>> @@ -485,6 +670,10 @@ err_free_ffa_rx:
>>>    ffa_rx =3D NULL;
>>>    ffa_page_count =3D 0;
>>>    ffa_version =3D 0;
>>> +    XFREE(subscr_vm_created);
>>> +    subscr_vm_created_count =3D 0;
>>> +    XFREE(subscr_vm_destroyed);
>>> +    subscr_vm_destroyed_count =3D 0;
>>>=20
>>>    return false;
>>> }
>>> --
>>> 2.34.1
>>>=20
>>=20
>> Cheers
>> Bertrand



