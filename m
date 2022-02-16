Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560214B872F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 12:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274062.469406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIuN-0006kz-U4; Wed, 16 Feb 2022 11:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274062.469406; Wed, 16 Feb 2022 11:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIuN-0006hZ-Pi; Wed, 16 Feb 2022 11:55:43 +0000
Received: by outflank-mailman (input) for mailman id 274062;
 Wed, 16 Feb 2022 11:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXi8=S7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nKIuL-0006cQ-SA
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 11:55:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c31aa60-8f1f-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 12:55:40 +0100 (CET)
Received: from AM6P191CA0066.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::43)
 by PAXPR08MB6815.eurprd08.prod.outlook.com (2603:10a6:102:134::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 11:55:30 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::95) by AM6P191CA0066.outlook.office365.com
 (2603:10a6:209:7f::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 11:55:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 11:55:29 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Wed, 16 Feb 2022 11:55:29 +0000
Received: from 0d9ae734107e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0159BE3A-AE7C-4A24-9159-4DFC5B615C8A.1; 
 Wed, 16 Feb 2022 11:55:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d9ae734107e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 11:55:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR2PR08MB4811.eurprd08.prod.outlook.com (2603:10a6:101:21::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 11:55:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.4995.014; Wed, 16 Feb 2022
 11:55:19 +0000
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
X-Inumbo-ID: 5c31aa60-8f1f-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qU6uSB0HFChXFdJLtQwfaZtWxn3LHATQgu/PsztoSHg=;
 b=qvivfQYINvP8goceVNH6BYNNlAZ7AdlxMngot12DKczu+RrdKVAB86kJXCvhFVlUO75y+cLWX6hLWYXO2O39aJAAXTo1dQ+NqBkneFKE/6+Lu2cPiBFc0CMZQhn0GzgXJO4s7RpDVTKdnpkjyb4ZEVcZdUqBQEgFBV7VCtQjY/4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 94984090e3fd74ff
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzKBCaSlHdJ6AyZz4GSzyOA6/wD9Bc593FRk9WLid0P4JHh9vxeRWR4Fl4/1XYETKVCT1P240AgR1YDRUwsBuejAo2GrEsNB48azb104FyUUyU9JTTwxukkCJTP8zcu8IgHbg2k6HUb5mPI/LPec1DhnWP+urGsW41vCj2LwB90x/dJMGS0HllDvemGeHLO2WDs8nKpjfL3xsZer26JmWB+nSdevlO3tmD7VFcP/Fjcro5rSFJ4/L3dndyNGdAHFJxb7dbo6vB9bZroNn6aGbMJW2KbJwPwRWwJxWtYAduOCZDJtRvyI+xQC5NmUujZe7Uw/qbeHDBB2OUDs46tknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qU6uSB0HFChXFdJLtQwfaZtWxn3LHATQgu/PsztoSHg=;
 b=jMSioFOYQzYVNv6+i3ufsHPllwBn8twPyLGDTb7GU5rXHKoBuAl/xk9Kk2DFUt0OCzy7rLMn22zYZpGGPHZhdhkWgtsl0yyq8yc/HpNVxCt1Jn158ylXnOn53xm52MI/yDMFW1qlXJ9iZuIIn+6Se6KZBb3MSf3Tszs3Q1c3E1k/7EpTwle8nuzzqIMswLhOb8lfcN9rfq7WJuGMha8C6NylSDeIX8ry342kamxyL8A2cISW2o/66Fxzsz6HzjGJaj+w1pIED0d0Wra3dWLtoqghOD16ARZM+rp8SKqNVPaNbzeJcpwvwnG/nEIthqcDwWGlD0tdjbYSkJ9gIKST6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qU6uSB0HFChXFdJLtQwfaZtWxn3LHATQgu/PsztoSHg=;
 b=qvivfQYINvP8goceVNH6BYNNlAZ7AdlxMngot12DKczu+RrdKVAB86kJXCvhFVlUO75y+cLWX6hLWYXO2O39aJAAXTo1dQ+NqBkneFKE/6+Lu2cPiBFc0CMZQhn0GzgXJO4s7RpDVTKdnpkjyb4ZEVcZdUqBQEgFBV7VCtQjY/4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>, Jan
 Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Topic: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Index: AQHYIaGnBAePJgt7y0O7PyvIWQlKrKyTBxsAgAKFHwCAAHT3AIAAERWAgAACmoA=
Date: Wed, 16 Feb 2022 11:55:19 +0000
Message-ID: <C5CDC3F8-0EC1-4270-B388-70F7E9982576@arm.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-3-andrew.cooper3@citrix.com>
 <70824a0c-cc48-b064-695c-35c2d06c0ad1@xen.org>
 <alpine.DEB.2.22.394.2202151800230.43738@ubuntu-linux-20-04-desktop>
 <faa6c523-6e88-8987-c0c9-3652c002fda3@citrix.com>
 <f5d6de10-5d3c-f86e-71eb-203dd06b6a11@xen.org>
In-Reply-To: <f5d6de10-5d3c-f86e-71eb-203dd06b6a11@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 18cb9fde-b416-43e4-d894-08d9f1433a69
x-ms-traffictypediagnostic:
	PR2PR08MB4811:EE_|AM5EUR03FT037:EE_|PAXPR08MB6815:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6815F6F0EFF2974E66CA16C79D359@PAXPR08MB6815.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1m/KotHCQ1t9SQXo8vKUmxeowJ65pdCyA36EoNXAWQxNHKJ1f5T16ODWFO963hHRwSyuMKvhMuBjo1R5AiwJ73YmPxYKQM9fOSRSwIcflSSbov7Pvw7z3+6rv/MEtD6FK8pLt0vHTmb3jSST+GFOhC9oTfmiZUYttAtkm4L3uWC6EpK3Riha7hL0zyEndbPfrcBJWuKU6x7vib4iqA2yMhRdspTszFK3UhAAxW5jnoVimTin/43At99drrZtK6oMCRiR+0e5AumjgGxWzvFvOEESqya0prhUe05UkbCGYmted2AFTyP2lAb3aQ3FzucXRRDRmYq8za1c5cKDy1BJx/PZyvwIfuKZxPFE6ebt5kDoLM1r1HKegU9VYKlOAPW0cdKP9c59czWiB8DswTMwIM9Tb+VEZcPIgEjUWKXo78jmdxZuhmLziRUBbUBsHpP9CfzgeY7RcszV8u9OnULTA3s6U4kcGlNLwzIt+zAtey5xNRnSIPs6tR74jhRD6PLU+KakC9s/nxFL7qAl/49bba2XVmmKP31EOziU6Z/JntteBf1ncCD0Y970yI9MdZiY1rr43++msbujttDaG1uxMWrZA66UV4SFqpn3dFkY0YdBRzUYs3ZLJz1HF01Wd4EH4JBVsd1MGLKQyZibNDzr0LH6nSzIrHGot4vBzEUOeA0FM7AUWPIcHmbOQ8vG8BTGR8HRFX1FBU9ldsoYTiSiyNRpwJVkEP1216CIuIEhHp9cjatTpsFn0M0JFTIvxceQ2nogRBYc3tegSsx/TNRQVQe780ixv/88V2jo8tHkp/wL0ZoXy1dzLE6q8maxI92KhpuZXKKtYsrcZhN5xtfI5g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(508600001)(2616005)(66946007)(4326008)(8936002)(53546011)(86362001)(186003)(6916009)(33656002)(122000001)(91956017)(36756003)(38100700002)(26005)(2906002)(316002)(6486002)(966005)(38070700005)(5660300002)(54906003)(6506007)(66476007)(64756008)(76116006)(8676002)(66556008)(83380400001)(66446008)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A0E186269A958940A83CF6E260A1E741@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4811
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02b4ac91-4ffa-474c-9629-08d9f14334ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	numhYtpw3fsnGuoGOoy9kORAyTI9xL2QgPxe1wcMFXsWM7JuJUAN8GLxnDbSNaE8dZ5hfC6Pykg730SxwijtIOOS+SyphDDHGJcz/ZJqEFYK7mtWbdXuqf3d3UjKGUxj2kg6hfDlMH9Pk9EdG8WhSHuTTXtaVZthEdHjMDEnqh3OnEjXjDGVdNy1oC6qx1zMYzR5wIQ0nlbFFRz/6SwdOlmeqnnaUXM0wrDDFQvW6/AO0wWsLtWrIBKH7IvF2VI9aR4P8cdLEJqGIq50+agv8nzKqSvZTy771xc0vVFTRMDa2zIuNzbT02nmF8SJ3Ghew5GWQ0T0liG39FdvK8sRS/XBPbRl144xB9YxbkMPWZwZicW0tS6y7uuP1RhydHdQvPdgBgAABHK9fv2dwe0V+8/TUizgsB0a1bBIoO5HowXaqK9KnJ527XmxaISXwO17fJ2boRBn4vVUiq4l/mhpu/U5RROqWTUw+LDDc0ZoJmdk4PZsCnEzhy3ncwp/9YEAwpEvLFbJDR+ohqKkJIG2v5ddQnM3zRbMtR5oCIdYAgFcz7o8YkQC8APx3e8JLAk99k1r3xawlwzESlvHT45yuNIdSMHBNCIHO3K6zvonHAgldsaZLyaT7oGh4BFYNuqpuaeRfmgzW4z/Cc8u4yl41tfPB7yP7XpyWhdRktnPiSgOh143fF0P10SOkMpmRdKA6nQuFO+Dn/UgIh+Wd4rUuJ6qJK4IAMIOVGojBUJFocLcwDO524C3iFBXoqG55MNViB5H7dZy3/Gz5Ur3Qgcklg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70586007)(83380400001)(336012)(40460700003)(70206006)(186003)(54906003)(316002)(26005)(356005)(81166007)(82310400004)(86362001)(47076005)(8676002)(36860700001)(508600001)(2616005)(33656002)(6512007)(53546011)(5660300002)(6506007)(107886003)(4326008)(6486002)(8936002)(966005)(6862004)(36756003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 11:55:29.4128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cb9fde-b416-43e4-d894-08d9f1433a69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6815

Hi,

> On 16 Feb 2022, at 11:46, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 16/02/2022 10:44, Andrew Cooper wrote:
>> On 16/02/2022 03:46, Stefano Stabellini wrote:
>>> On Mon, 14 Feb 2022, Julien Grall wrote:
>>>> On 14/02/2022 12:50, Andrew Cooper wrote:
>>>>> There are exactly 3 callers of sort() in the hypervisor.  Callbacks i=
n a
>>>>> tight
>>>>> loop like this are problematic for performance, especially with Spect=
re v2
>>>>> protections, which is why extern inline is used commonly by libraries=
.
>>>>>=20
>>>>> Both ARM callers pass in NULL for the swap function, and while this m=
ight
>>>>> seem
>>>>> like an attractive option at first, it causes generic_swap() to be us=
ed,
>>>>> which
>>>>> forced a byte-wise copy.  Provide real swap functions so the compiler=
 can
>>>>> optimise properly, which is very important for ARM downstreams where
>>>>> milliseconds until the system is up matters.
>>>> Did you actually benchmark it? Both those lists will have < 128 elemen=
ts in
>>>> them. So I would be extremely surprised if you save more than a few hu=
ndreds
>>>> microseconds with this approach.
>>>>=20
>>>> So, my opinion on this approach hasn't changed. On v1, we discussed an
>>>> approach that would suit both Stefano and I. Jan seemed to confirm tha=
t would
>>>> also suit x86.
>>> This patch series has become 70 patches and for the sake of helping
>>> Andrew move forward in the quickest and most painless way possible, I
>>> append the following using generic_swap as static inline.
>>>=20
>>> Julien, Bertrand, is that acceptable to you?
>>>=20
>>> Andrew, I know this is not your favorite approach but you have quite a
>>> lot of changes to handle -- probably not worth focussing on one detail
>>> which is pretty minor?
>> It's not pretty minor.  My version really is the best thing for ARM.
> >
>> The perf improvement alone, marginal as it may be in practice, is
>=20
> Our take on Arm has always been to avoid micro-optimization when the resu=
lting code is more difficult to maintain.
>=20
>> justification alone for the patch, and Bertrand's R-by is testament to t=
his.
>=20
> I am not sure why calling out that Bertrand agreed means that everyone el=
se should accept your approach.
>=20
> This reminds me other series that have been blocked for a long time by yo=
u. Yet you made no effort to compromise... How ironic.
>=20
>> But the reasons why getting rid the swap functions is important for
>> CET-IBT on x86 are exactly the same as why getting rid of them on ARM
>> will be important for BTI support.  A tagged function doing an arbitrary
>> bytewise swap from two parameters controlled by the third is far more
>> valuable to an attackers gadget library than a typical function.
>=20
> This is a more compelling reason. However, I am a bit puzzled why it took=
 you so long to come up with this reason.
>=20
>> i.e. this proposed intermediary, if it compiles, is just busywork which
>> someone else is going to have to revert in the future, along with having
>> this argument again.
>=20
> Well, this argument would have never happened if your commit message cont=
ained information about BTI.

I agree that this would be nice to have in the commit message as a justific=
ation for the change.

Cheers
Bertrand

>=20
> Instead you decided to just mention the performance part despite me objec=
ting it and requesting for a different reason in v1 (see [1]).
>=20
> Anyway, I will wait for a reword of the commit message before lifting my =
Nacked-by.
>=20
> Cheers,
>=20
> [1] https://lore.kernel.org/xen-devel/f7bb7a08-4721-f2a8-8602-0cd1baf1f08=
3@xen.org/
>=20
> --=20
> Julien Grall


