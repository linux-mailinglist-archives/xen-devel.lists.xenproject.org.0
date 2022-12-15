Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0764DF9E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 18:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463664.721897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5s2Q-0003Aa-Sx; Thu, 15 Dec 2022 17:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463664.721897; Thu, 15 Dec 2022 17:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5s2Q-00037d-Pd; Thu, 15 Dec 2022 17:28:54 +0000
Received: by outflank-mailman (input) for mailman id 463664;
 Thu, 15 Dec 2022 17:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWn4=4N=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p5s2P-00037X-NM
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 17:28:53 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2081.outbound.protection.outlook.com [40.107.103.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0d9fde7-7c9d-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 18:28:51 +0100 (CET)
Received: from DB6PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::33)
 by AS4PR08MB8244.eurprd08.prod.outlook.com (2603:10a6:20b:51d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 17:28:48 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::c0) by DB6PR1001CA0047.outlook.office365.com
 (2603:10a6:4:55::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Thu, 15 Dec 2022 17:28:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 17:28:48 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Thu, 15 Dec 2022 17:28:47 +0000
Received: from 46e3feac2b16.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C765B082-6A89-4C6C-B9D3-D08F9C09E734.1; 
 Thu, 15 Dec 2022 17:28:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 46e3feac2b16.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Dec 2022 17:28:41 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB4PR08MB8030.eurprd08.prod.outlook.com (2603:10a6:10:38a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 17:28:32 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5924.012; Thu, 15 Dec 2022
 17:28:32 +0000
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
X-Inumbo-ID: f0d9fde7-7c9d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1NaxMZ8gv7eXHhzwMGlYAVGQ5sE6QqkS81JdfOJL2w=;
 b=MQ9DNrewLvP535kbmNp1AtlJC1ztQByPvKpUJJZwMvdWLuPSdmURz17tZ80K4JfGve5ehN1PalATQOUY7XVeTTm+k7ORyWDJdvnS8ngfikfsrepbG8PqDa/omT922J4iz7/InVR7DAeyUn0RD8tK8SW9zszjUwvIKK36xlsIu1s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb1de2ced793fb23
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beynd1Lhbbw3PkhA9h6wSwl6xFMz0BGc9In89UMNkd0i4KnM/9sjOM52Dbm4C4i+nWcjS47hW78n8+FN/YJ4v19YcNLotEzeswvejC46dD941Uf/XJrJEjy2tQk/ONPQ2yVe8nl0bo1aYxJ/6ZHpa1XKr7EqpQ445j5Y1DxSQFm0/hXY4ei/rKwL0t6frmJJbm3sOTfASFXZK413uQiN0VRTpmsPUj62bpPvaaymkIaJLePQ8YE7xfFaKKVYrUGly2eoRWP/Y0P7mkGGOhkrIuUgOmwCI3Q/Q1DoyhOG0w6Yx6ht93Q9X2VxCf+sSP8Q91yXIei22Le+z9oj5+ZieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1NaxMZ8gv7eXHhzwMGlYAVGQ5sE6QqkS81JdfOJL2w=;
 b=dUyx+v8VhBo0mFa58R1bxdXNFSr9r6hpjIQ/3+GJNQUt/SWWQtgAKhVMk/ZAR32yqAUukWEPE23Zgw03IXCLo+UOKElkUYGTuAmD5TyVDhnF3Z81H13HG66cMpNxLz1yq0uo22mGZHpNmbqLMhASidzJ2OXcNeW41hoNF3bL2y2rK4Z51dBVfP+DGpvwEw5798eqGuc3EEAKV5VUYgBgNPAjZTohR8f/lZKrxP2Wu+e0h/+ZnddNQnRd2i1GCLZk+/GLcOjP3ozmeLHgbpKTNq6QPg76rluIgwgyLE5kkBcMpLEl3icmZ/XagNAyHUcZ9dinMttoRAepF3RF5KkzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1NaxMZ8gv7eXHhzwMGlYAVGQ5sE6QqkS81JdfOJL2w=;
 b=MQ9DNrewLvP535kbmNp1AtlJC1ztQByPvKpUJJZwMvdWLuPSdmURz17tZ80K4JfGve5ehN1PalATQOUY7XVeTTm+k7ORyWDJdvnS8ngfikfsrepbG8PqDa/omT922J4iz7/InVR7DAeyUn0RD8tK8SW9zszjUwvIKK36xlsIu1s=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: smmuv3: mark arm_smmu_disable_pasid
 __maybe_unused
Thread-Topic: [PATCH v2] xen/arm: smmuv3: mark arm_smmu_disable_pasid
 __maybe_unused
Thread-Index: AQHZDx9yw/wEVo2DeEWwDI7Q4pTE1a5u1CiAgAAr3oCAAAsHgIAABWgAgAAmjYA=
Date: Thu, 15 Dec 2022 17:28:32 +0000
Message-ID: <CD52A21E-2550-41BE-9FEF-3EAFAEDCF3B3@arm.com>
References: <20221213181855.81713-1-stewart.hildebrand@amd.com>
 <423b32d1-90f1-2a0c-865c-24030a7dcdba@xen.org>
 <41f62567-b05a-26b7-ace1-21745d61b729@amd.com>
 <16bf9934-1f50-4694-253c-32fa35f0b097@xen.org>
 <3e47feec-8a78-887e-ecbc-c2bd81e62bb5@amd.com>
In-Reply-To: <3e47feec-8a78-887e-ecbc-c2bd81e62bb5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|DB4PR08MB8030:EE_|DBAEUR03FT024:EE_|AS4PR08MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 434fc32f-b360-4ade-fee8-08dadec1d340
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZnRyHBAvab4IBz3p89/CsMw+jDrlNHi1EZD0J9Tvkby6PTaj3VFSCWJFtWVv7qB54sepSZGQyWhK6rhJYRu2EKycb/MXMn5y87Gkob8kxlB7H2uNtU0k3Fq7DuhYgMl1xCciE8M5tSpGHa57qtnVS5oY6Oa/9w1SmO5exSaUmh55UCjs8cOcmQHbxAU9oRffWOJxA9TxZVsa6cF0H1sW8uJwk+bro5WjooKDKizyurfVhDzRHVcawxNsUILUscNmWbChMOJgV6p+fmqn6CSBTYMtS0dcQHCkmo32DF78ryVPdiPzLFsTxUll8QHCBM2DxcT4jXDXyR79P3mvq077woaUL4bZWZvobI0mMxPnXuidkJjpfwXHdZ4jvWubppgsE+J+wbs1bySt0jTB8UAy+KDkzNs1BvV1EfrLB0h+tQrfwWfHFTfoiNJ3GuB/fUuBPwyWNvVPSGdgYDu1sogZnadX6TkRg1G3+2jzUjEjfcPhXT/j6vKppfH2z+FmWBMN3HVqTKKtqmIYPtXBro8UDAVdjiUw0Qr7PPTsBAVaHmWMzWXr4B9+IXbITM3z1LwF6z/vKYDdY05+aIiC6zMQzIH3QDm4uz1KM+M946UVgGmfebt+p0hwmriHV1mMhIuAoJ4BhDaSFS8suEV9mstNpUzzcEgdlWQ3g8B/7Bp83KyOy1qJySY1ANU8W8AABpleN8gjhZtI3uNOVI9fXh1nQSZUkrDEfa6R8F8oqEyHUoc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(122000001)(86362001)(8676002)(53546011)(66446008)(8936002)(4326008)(6506007)(5660300002)(478600001)(66556008)(41300700001)(66946007)(76116006)(66476007)(91956017)(38070700005)(38100700002)(64756008)(71200400001)(6512007)(186003)(83380400001)(36756003)(6486002)(316002)(26005)(6916009)(54906003)(2616005)(33656002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F2AFE52160DCC44E9F05E0B97D6A5839@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8030
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14439f05-0f2a-4142-9ecf-08dadec1c9d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bewx3i5wXBabcuaD7DQklo6iTxG0pMHMTKovsHqx4sdEdqoo1mRbHAh86I/Gdh+5Y6ZjF1orh7YOOiz2rKb9x95WSCpqd4rbS8ooPEJ4yRGWsw7JYMffDg6eL4upowrZevqtMx8M+tIYnpUZC4AFuvnjiifEfNqefkwsv/PNRA2t8m9BK0FOvS3lMnfTw2obV396xKziNuJthMqPJtUuJTuEqvc2672/rQSAWfNKgEtIZNTVb3ODrzvkjY/uFbXQxP/XNLYdEadX0m70k3sbCvuIQ19OWV+LMc4KGt4dLV2/OQsKd4bQPQH+UlGap9upeC3ZUERktKgZCEiMANkQG+5lrFUCKlr746BsN2HPr4VOqCDHvaShBSSG2EUliZQL7DPmgce2ghvI/IZ7EKPtMX+z4NqiShK4CcS9iIu8pRi9QVA0peamHrM0ZoWwHbi1ng6Uz0/gz7soam1Mtbckn8OuS6BoERbE9Hl/wc4NsJGiU5t00JO1rOdqj9RSeB0P5H7xkwQvlVZqEQ+fl73MQBrOG5TO4duGWUq+C4Bbh9WhSvQmhYo+cd2U6dLqnZBeMGD2xs6KROl1izUE8A8WRMQIMzzcLlM/k8BzXV53QLQGFjhiKByoaImAWCVpz4Wco7guwCC3BuXYEvocYxwB6BKCmlbUcKygVBpJF/sfXwEuXeS2FoGsIQFXZtB+pnam9MMJEJjD/TnN8LbSIdU26A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(6512007)(83380400001)(186003)(36756003)(336012)(2616005)(6486002)(47076005)(478600001)(26005)(6506007)(82310400005)(53546011)(107886003)(81166007)(356005)(40480700001)(33656002)(86362001)(40460700003)(36860700001)(82740400003)(2906002)(54906003)(316002)(4326008)(5660300002)(8676002)(70206006)(70586007)(41300700001)(6862004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 17:28:48.0496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 434fc32f-b360-4ade-fee8-08dadec1d340
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8244

Hi Stewart,

> On 15 Dec 2022, at 3:10 pm, Stewart Hildebrand <stewart.hildebrand@amd.co=
m> wrote:
>=20
> On 12/15/22 09:51, Julien Grall wrote:
>> Hi Stewart,
>>=20
>> On 15/12/2022 14:11, Stewart Hildebrand wrote:
>>> On 12/15/22 06:34, Julien Grall wrote:
>>>> Hi Stewart,
>>>>=20
>>>> I was about to commit this patch when I noticed the placement of the
>>>> attribute doesn't match what we are usually doing in Xen.
>>>>=20
>>>> On 13/12/2022 18:18, Stewart Hildebrand wrote:
>>>>> When building with clang 12 and CONFIG_ARM_SMMU_V3=3Dy, we observe th=
e
>>>>> following build error:
>>>>>=20
>>>>> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'ar=
m_smmu_disable_pasid' [-Werror,-Wunused-function]
>>>>> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *mas=
ter) { }
>>>>>                      ^
>>>>>=20
>>>>> arm_smmu_disable_pasid is not currently called from anywhere in Xen, =
but
>>>>> it is inside a section of code guarded by CONFIG_PCI_ATS, which may b=
e
>>>>> helpful in the future if the PASID feature is to be implemented. Add =
the
>>>>> attribute __maybe_unused to the function.
>>>>>=20
>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>> ---
>>>>> v1->v2:
>>>>> Add __maybe_unused attribute instead of removing
>>>>> ---
>>>>>    xen/drivers/passthrough/arm/smmu-v3.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>=20
>>>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/pass=
through/arm/smmu-v3.c
>>>>> index 9c9f4630090e..0cdc862f96d1 100644
>>>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>>>> @@ -1376,6 +1376,7 @@ static int arm_smmu_enable_pasid(struct arm_smm=
u_master *master)
>>>>>        return 0;
>>>>>    }
>>>>>=20
>>>>> +__maybe_unused
>>>>>    static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
>>>>=20
>>>> The attribute should be placed after "void". I.e.:
>>>>=20
>>>> static void __maybe_unused arm_smmu_disable_pasid(...)
>>>=20
>>> I had initially tried placing it exactly where you suggest in the first=
 draft of v2 of this patch. However, the line would then exceed 72 characte=
rs (actual 81 characters):
>>=20
>> This doesn't change the problem here but the limit is 80 characters per
>> line rather than 72.
>>=20
>>>=20
>>> static void __maybe_unused arm_smmu_disable_pasid(struct arm_smmu_maste=
r *master)
>>>=20
>>> So I found myself juggling with how best to wrap it. How about a newlin=
e after the __maybe_unused attribute?
>>>=20
>>> static void __maybe_unused
>>> arm_smmu_disable_pasid(struct arm_smmu_master *master)
>>>=20
>>> and similarly for the 2nd occurrence:
>>>=20
>>> static inline void __maybe_unused
>>> arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
>>>=20
>>> There is precedent for this style of wrapping in xen/common/sched/credi=
t2.c.
>>=20
>> Ah! I didn't realize the line would have been too long. In this case,
>> the newline after __maybe_unused is the way to go.
>=20
> Ok, I will send a v3 with this change.
>=20
> Rahul - may I retain your R-b tag in v3?

Yes you can retain my R-b.

Regards,
Rahul



