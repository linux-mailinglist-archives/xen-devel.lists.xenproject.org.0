Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F7459EAC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 09:54:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229207.396663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpRYK-0005e1-9c; Tue, 23 Nov 2021 08:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229207.396663; Tue, 23 Nov 2021 08:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpRYK-0005aq-5a; Tue, 23 Nov 2021 08:53:24 +0000
Received: by outflank-mailman (input) for mailman id 229207;
 Tue, 23 Nov 2021 08:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r6oU=QK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mpRYJ-0005ak-1B
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 08:53:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf1be517-4c3a-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 09:53:21 +0100 (CET)
Received: from AM6P195CA0081.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::22)
 by DBBPR08MB5945.eurprd08.prod.outlook.com (2603:10a6:10:1f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 08:53:18 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::a7) by AM6P195CA0081.outlook.office365.com
 (2603:10a6:209:86::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 08:53:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 08:53:18 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Tue, 23 Nov 2021 08:53:17 +0000
Received: from b811162de92c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E09AACF-90E8-47A5-8FDE-210173A09C51.1; 
 Tue, 23 Nov 2021 08:53:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b811162de92c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Nov 2021 08:53:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0802MB2435.eurprd08.prod.outlook.com (2603:10a6:203:9e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 23 Nov
 2021 08:53:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 08:53:03 +0000
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
X-Inumbo-ID: cf1be517-4c3a-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcfkK0b0W5U3kP5Zbi+Z4VsMn1l4pZtiGvv1C9QIwlg=;
 b=CV/H9md6pTxjpEawtzCjn9ESQHRqUMxz8ST2CAc/cHjr49J8UkVBPyx/Ylg84129RVzTCe/encX9jsiP5Vh0EDnrVSTvk7HyApj98hLhEUSP1fCeLLQo02eG7r3XbqmdkeOmgw0njyXo9JR2PseYkZNuKGsHujnBFOk3mizTZRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1dab8ad0418b699
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQKJKt1+MrpXcRa0ZDTrcfmaM3H+1+EdzFfsczrTo6wmEo1PNcpLXvHs52LdNoY+/kVHaIashigw9aH/IKGkZonHEixxnx7k2mJHGczo64ywIbToix0xTzSwEMMX/26C/lhjE8IWxtQkaD9yBK/YXi/vMHLtyE51MgeTc+ALM2c/HyVj/z19a2XBsKFCwI0iYL3BTsR/a7VOyr3Y8iaYYcLS2fFdlwWuyeH7oSwLeJtTvyi9GsxPuMrWqQNhjy4EjRAqm3Nc6n1bt/auHgvsqyYJYI9ZHfrhEMCk69kZFJ0HEJT6FjkVK6iaU6NMOppV5DSiM/lG3/FB6eVTEK4I9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcfkK0b0W5U3kP5Zbi+Z4VsMn1l4pZtiGvv1C9QIwlg=;
 b=muk2ZDUt+Jq/fwzGjzaiIYjzMksUY6vPdzDLv37BZgl8ybqy8sB1X9C2J8Ax2C1Fg7CRGnlWoTKzbCKRyWKVjbwqTiOIDhNfaaH6zQbJaxzTU+0w6e9Ctic8o3nHYzh9knJBQSvAtHENPxY6zbOuUUSfPrPtqsRR5+DmH01wvt59UPbFsuD4wGO2celBOBqGGBKv2ozTWzKlZJZ6rVX9uQ/FmW1en2/NMEmkmmEhQlS8pK1sgdcD1B99CKrrmT6Szi4bjiCqeSUX7DaTO4TITJjr69P/auYgdxnX7NH0T8CtEUIICiEVbtddyBLdSkpKEybgz0fyr6n3N72WTNcLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcfkK0b0W5U3kP5Zbi+Z4VsMn1l4pZtiGvv1C9QIwlg=;
 b=CV/H9md6pTxjpEawtzCjn9ESQHRqUMxz8ST2CAc/cHjr49J8UkVBPyx/Ylg84129RVzTCe/encX9jsiP5Vh0EDnrVSTvk7HyApj98hLhEUSP1fCeLLQo02eG7r3XbqmdkeOmgw0njyXo9JR2PseYkZNuKGsHujnBFOk3mizTZRw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien.grall.oss@gmail.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Jan Beulich <jbeulich@suse.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
Thread-Topic: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
Thread-Index:
 AQHX3WXgMxQOWtsAQkCagYrL+eVmYKwLGnaAgASCuICAAF76gIAACHQAgACBjgCAAE4VAA==
Date: Tue, 23 Nov 2021 08:53:03 +0000
Message-ID: <B4D77172-9AD5-49CD-90E6-872AB2F13258@arm.com>
References: <20211119165202.42442-1-ayankuma@xilinx.com>
 <647a76f8-fea9-57b3-eb64-82a67adba1fb@xen.org>
 <5a2f681a-c6ef-bc3a-ed09-e378dc6abc90@xilinx.com>
 <alpine.DEB.2.22.394.2111221157050.1412361@ubuntu-linux-20-04-desktop>
 <CAJ=z9a1L5v2+wC7-aaA2PjV2FzrFXjT-5t_0ijznGKvwywvd5A@mail.gmail.com>
 <alpine.DEB.2.22.394.2111221241450.1412361@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2111221241450.1412361@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3262e31a-6238-48a9-198c-08d9ae5eb1cc
x-ms-traffictypediagnostic: AM5PR0802MB2435:|DBBPR08MB5945:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB5945C997A0D87FB31B4E54949D609@DBBPR08MB5945.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GudLp9hZ4/oLNjiVRLK0NFlVMWUJZvuPKKcXCss+PJNLRqvkQQz0YuYJNjYr69e3ogRfMwN07mjBKEXS3Q8rxlO3Gdfvg0mBbo7AfpSFDN6/ACFvSAOrlVCd3S0GGEKGiMlbaC5vK5DqXn+2qVcmdInl3Sx/jqNNC7RtUiAkcaP0ZOpQ/iuPEW6PuUNuqFR2+X9dOCiLay1Pwb2D54v6Rk0FTFI9bo2N4RAaPhp+tSMnndOTBl2JKpTKj3EY1H8NkGsyLC8rZHnWtIYm0EjM2y7Wf519OTpzMSx3Ldd2Ad4TKuQcgROSKEZIKkIsw/HPj5k2erQPmAqTVHkp3VRyH4vu1VICx9YWVKmENh+F0O2+QZNXTfQiDWv/Xs3CtQ9A8lFv7gvq+dsBhrCHs5RlC9tr7Rn50UCVT2LYeHGbbTS5YIgAZkumBNbZWP3bFLnhYL6LbhgtQbSJxVjpvS57TJCsD7RIZqXoVFitUIOfj1M6A9mIzi8m8BtTrsHKl6O2kBMDOb0ZcZ+OVvuTNpyugSdBOChWTIuHB7uZe/puU+ox9ZDR4BBhAn0T831FZ5xgjvIf+iKzmn5i8usgadLUuCqx5E6u8Ys28ed3nCTBUEzMtCfJxkaPS84znxofYigNKixjdRIs4RD52siDrm4+EoDS4WytH3zu/XzpqOKORHZ0wgklXDQG0xRWXR4czgAKZbru0yl4jSIA/+8kQFq+9zAm7T66Hrk4jtrRy0WCrfg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(2616005)(26005)(91956017)(5660300002)(86362001)(6512007)(53546011)(6506007)(38100700002)(122000001)(8676002)(8936002)(66946007)(4326008)(66476007)(54906003)(66446008)(6916009)(76116006)(33656002)(186003)(2906002)(36756003)(6486002)(508600001)(66556008)(71200400001)(83380400001)(38070700005)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A1F8B2D084A90744A22A33A5CC91D6E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2435
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11e13512-15d2-4ffc-19f5-08d9ae5ea913
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4GRfGq3/qXj6cuBYd2j5knKPSDFtkLqTXKKlZjDjPtyMvAWKqBtPxbr2Vi89+lP8taLkG0ouzXMguOOSyXvBhbmcEnrSAKSu6dgdmPoRHKTWE+BN2kjC9dwzoToelUgiU/cUCDIfdPaTCwYiXAosALtbQwZnql6MtUUlfjE7Xxcapewb/1xRDlSmrtlo1hOUzgGwnyjUXTt7J5Jj0S/m3slwU3BVr1Ni2BORsFczR6UBm5siVgqWI+mKXs14JgWvY9Xu/gvHvBnFWYyBf9buviqZ6iErV4yYTaDX/4SRc329Y7z7T/BCV8ipvJtxYrublt74PT9QgV7neqVsiOam5xbSg551YWreINobuNtfUfMuE96FKqlnEh5X1YWRIs/mp7KEa2p5+V8qo9gjPW/sUQOeSRDUM0xppHlYxIB7MFl+xbF0dAYzLqAturj8ji2wKdaMiWmVaCPMwZVQ/gDpF4Ghhiwd6haxSxSMWL8nM0RohKsp7QLJDGRSAMGC/jw3DE1U2rjZ+fBNl4UsqW1CmfFMtlUwZHUY9RbRvU5kfvLMz0d6kgB5CEiJRUjISefKkzeEXBj599D/+Pq22SB8J0qsaZIk3j7liySZoNtxLxVtg5FgcLPdURmoeC2AKidy2PyBwTShCxeeEhm/3BGhR1JCgCEdhprJf2Le+kdwMNuQjsX7QWh/cJkgxXqLqdNV9VcNfkZXaOYIZJ81rjASQQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(316002)(26005)(6486002)(8936002)(70586007)(53546011)(33656002)(54906003)(82310400004)(83380400001)(4326008)(2906002)(186003)(6506007)(47076005)(70206006)(508600001)(36756003)(5660300002)(6512007)(81166007)(8676002)(2616005)(356005)(86362001)(36860700001)(336012)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 08:53:18.2078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3262e31a-6238-48a9-198c-08d9ae5eb1cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5945

Hi Stefano,

> On 23 Nov 2021, at 04:13, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 22 Nov 2021, Julien Grall wrote:
>> On Mon, 22 Nov 2021 at 19:59, Stefano Stabellini <sstabellini@kernel.org=
> wrote:
>>>=20
>>> On Mon, 22 Nov 2021, Ayan Kumar Halder wrote:
>>>> Stefano > It doesn't look like we are setting dabt->write anywhere.
>>>>=20
>>>> Ayan > Yes, this is a miss. Depending on the opc, this should be upade=
ted
>>>> accordingly in decode_64bit_loadstore_postindexing().
>>>>=20
>>>> Stefano > Also, is info.gpa in try_handle_mmio already updated in the
>>>> pre-index
>>>> case? If not, do we need to apply the offset manually here?
>>>>=20
>>>> Ayan > Sorry, I did not understand you. This patch is only related to =
the post
>>>> indexing ldr/str issue. Why do we need to check for pre-indexing ?
>>>=20
>>> I thought you were trying to handle both post-indexing and pre-indexing=
.
>>> It is OK if you intend to only handle post-indexing but considering tha=
t
>>> most of the code is shared between the two, we might as well also make
>>> pre-indexing work (unless it turns out it is more difficult).
>>=20
>> Wouldn't this effectively be dead code?

I agree this would be dead code. Pre-indexing is handled by the hardware, o=
nly post are not.

>>=20
>>>=20
>>> In the pre-indexing case, I would imagine we need to update the base
>>> address before taking any other actions.
>>=20
>>> From my understanding, this would have already been performed by the
>> HW when the syndrome is valid. This may also be the case for
>> the non-valid case, but I haven't checked the Arm Arm.
>=20
> It is not clear to me either, that's why I wrote "I would imagine"... I
> was guessing that it is not done by the HW in the non-valid case but I
> don't know.

This should be handled by the hardware here, so only post actions should
be handled here.

>=20
> Of course, if it is already done by the HW, that's all the better: no
> need for us to do anything.

I am wondering though if other types of accesses could not be handled here
without major modification of the code like other sizes then 32bit.

There are also post instructions with shifting but to be honest I do not th=
ink this is really needed.

Regards
Bertrand




