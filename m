Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAE96A6A40
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503955.776393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJBt-0000uJ-86; Wed, 01 Mar 2023 09:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503955.776393; Wed, 01 Mar 2023 09:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJBt-0000qv-5C; Wed, 01 Mar 2023 09:56:05 +0000
Received: by outflank-mailman (input) for mailman id 503955;
 Wed, 01 Mar 2023 09:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Km5w=6Z=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pXJBr-0000qn-4I
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:56:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4634a615-b817-11ed-96a0-2f268f93b82a;
 Wed, 01 Mar 2023 10:56:02 +0100 (CET)
Received: from AS9P194CA0018.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::30)
 by VE1PR08MB5870.eurprd08.prod.outlook.com (2603:10a6:800:1a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 09:55:59 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::6d) by AS9P194CA0018.outlook.office365.com
 (2603:10a6:20b:46d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Wed, 1 Mar 2023 09:55:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.18 via Frontend Transport; Wed, 1 Mar 2023 09:55:57 +0000
Received: ("Tessian outbound b29c0599cbc9:v135");
 Wed, 01 Mar 2023 09:55:57 +0000
Received: from ad45be912c23.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EADCC458-21EF-44E5-94D7-CBDAA1A25B8F.1; 
 Wed, 01 Mar 2023 09:55:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad45be912c23.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Mar 2023 09:55:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GVXPR08MB7847.eurprd08.prod.outlook.com (2603:10a6:150:17::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:55:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:55:44 +0000
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
X-Inumbo-ID: 4634a615-b817-11ed-96a0-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNfRCssEsAzxxiMS7xEvJVlrYeKafXipM2QDkB6U62o=;
 b=99b0cr5iGxeAbSiT7+0B6ULHigg+1bv9LTVPVN2VkFtcW8obEvTD8KAA7HFTrpShmNcTQ/9dN87CG4E5usBKOBLMF904Y52pbxeqySgbgspOZyR9o70u6Ht7kj/wjjWvU42NqvYBqVpH7KtyW/OjDIn6i0HlDB8vHxWSfu5JHUc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10dd056bc2723342
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juSFGyvXIz289QKeqoZO7+mgjraDrZlw13+kPjowvxcSKnc/Zhd9v/sVm1aTXif2Q7RgbliEElmNMBfNLno/8PuSTn8SHVsJVylBzf+5HsCi/YSKWzK/VveSSv1O5UOnMKNMixWWTzk1/CcgVq1y+YRU8ZdnUqO19MVxAPPWMm3TOwTO4mDhuUrMtku66NQWAh1DG9jiw3wnU7aJxeQnqOQEa838inW9PwOetMm7sr/8TRxM7+0388k1keled8lSPFys6OQUg5ry/BuPVZZRT+7NgUV9+o2yQUa948T98aXhj1KlnLFyiHTm0Q8CpFAb6I7ioIm2/ezmuMz4VJfxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNfRCssEsAzxxiMS7xEvJVlrYeKafXipM2QDkB6U62o=;
 b=C2/uuf6yDvtQmbXmAJUVfpPvYxHm5jhvfR4SMWA6CNwL7MjkCBh6od3+NcEU5TZJVT6fMfYbdRhTXagTP9tRG/PJ4qG/y7cL/+yyZNERpD1jOGtkWNwVqJZRof7sHlNLD2eeoW4taBr5+f7GPG9Ta8Uqp489Pd/6lz0UGA+6ZPIr8xG5p98HxBlPzg5Nrug9T5FPqb5oG0R2q6Y6H4v8X3vU7SRs3XtavrmgpBo+u2okEOjHzPY4sQh15vhItUzcK8xzaVwzq227p5HMPZhTjM2PUYXj686DExmMpbi3BeaGWJ8yftq/ZM8gaRgLWyXvcMfvt3uh3503FLDC2KdWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNfRCssEsAzxxiMS7xEvJVlrYeKafXipM2QDkB6U62o=;
 b=99b0cr5iGxeAbSiT7+0B6ULHigg+1bv9LTVPVN2VkFtcW8obEvTD8KAA7HFTrpShmNcTQ/9dN87CG4E5usBKOBLMF904Y52pbxeqySgbgspOZyR9o70u6Ht7kj/wjjWvU42NqvYBqVpH7KtyW/OjDIn6i0HlDB8vHxWSfu5JHUc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 11/20] xen/arm: ffa: map SPMC rx/tx buffers
Thread-Topic: [XEN PATCH v7 11/20] xen/arm: ffa: map SPMC rx/tx buffers
Thread-Index: AQHZRtMejEsJsgt3902OVIzV3uFpCq7kWrAAgAFYowCAAAb0gA==
Date: Wed, 1 Mar 2023 09:55:44 +0000
Message-ID: <09363EA7-700B-4EA1-A7FB-6A5321D9E4D9@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <c553f850d76f4c31f5ce464f39bcb010722b9f99.1677079672.git.jens.wiklander@linaro.org>
 <CD0E4A9B-4E07-42AB-A40B-41A9FD98C1F2@arm.com>
 <CAHUa44EcoXdpyBOkUNZvN0=cCNjNsiZXfgER8EvsK1+f0P_tPA@mail.gmail.com>
In-Reply-To:
 <CAHUa44EcoXdpyBOkUNZvN0=cCNjNsiZXfgER8EvsK1+f0P_tPA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GVXPR08MB7847:EE_|AM7EUR03FT036:EE_|VE1PR08MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 2efa19b6-0356-4554-c959-08db1a3b27a4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TTJmLz6/cp3vdplmwLYBiNxerlDDqBuETjupIFUqokn6QqH2Q+H0LI3uqEJfi1eUr6y4xPCZufqNqm8PMbGSESc8gHtgKtkmqRtMUNA2xlbEUvmkULhh1euUMNUsErMamzAgJF4JiM7y3BOKpEQ2L/kyFDKL01BkRDdYf+7WtXYgWwMP2GLzK85pY3k6UsmL9pITojQPGEj27AuxE64FukPf48Px4bN2i9NqddTFK+zsnkHp21cUbUJ8MySkfTc3r9L5QYXotugCUq3Eoyatw+gtRhknY0WiHW7GCXdU5AleEKYRo1EIvrrNCAv5x9hIps2Ge5DqzVAPlQma8Rb8yGDorxL+pK6PNaEPkGR2FTQmEbwuYIENROQUXY19yKEmEU2hYU443b6sxiOrsp3gR622dj5P7OiyqYTFq4w2rFBXaYbQYc2Art1oBYHNb3YUwz9AnAycLAPASX02qqC+Qrk07b9yXhIlOmfWj0OUPsFzmfWE+pEauWFQFi8fXWofB+obnhGENZLDxbjT/mggEz/HeUcHzE1n8IxuXWI+SpMg8tJZZ+kAFhlFrT9NaYzsYRhGgdximjjtMZUYFsaoxvGaLZWT6Kx93J0WS7KOj1bhXPATaM6OCeas6kf3r7wB5hP8Kim6Tk1EuDHvIk1GcJGlL/a3pNqsLDSB7BUvaVQWlTo6i2wgzMh3RGiHtXc11NonW9h641gOMo08xxG/xP9ViKfsEWsZhkrqFwrP6bw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199018)(33656002)(36756003)(54906003)(316002)(83380400001)(478600001)(6486002)(91956017)(71200400001)(2616005)(6512007)(6506007)(53546011)(186003)(38070700005)(8936002)(86362001)(41300700001)(2906002)(5660300002)(66556008)(66476007)(66946007)(8676002)(64756008)(76116006)(38100700002)(6916009)(4326008)(122000001)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F16D6CE958F8D84DBD46850662EB5119@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7847
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96e8488e-4ea1-4a23-90c1-08db1a3b1fc8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6KSKXFb3T5R1qhzwzzeqNUqOK71kSlvl4VH9ApOdlgPilLuweBWWQ/7rW8zxpdTjkznms68rdPkpZJp8HUjet4Zia8CDKDk0/YVl48lqym+HewJjeKr7pCRuWpepSBk2Vlz4Meq99Td7XSRHWy866hHbqTWH5e4Kj2XoWJYJ2vJLqLkNyRsY+sRLt4JPkZwNOhXlEMke/s+JAZxKGi9BnN3PAcbXirhN+a28qlLzSbm31km5JMR28PGXCDQyxjHQ8zi7wVZjrGYYa7xG4M7ghSapQSy41LR03qqg+sfE3x1mkrjddmT8a0YJBib/PjflQBnRo4cHObQWe2Fh1u6V/o0tW2+Ocqd3SPTvGbhnqwj4cKOk3NoPNE4YJxzxx/il0rl5lOeZPFYLkjhclTdjo5pwANIUw717wLNJCH8+zB/GIGjFjaJu+VcN1L4IMqlIFLBb/ev78g6Yd24eDoRg1s+om3/7Imfv8G6K6bKrb9w+hDd4xlKzqy8XduCKFKCpk1j2icCF9P+eGik6yZiVkyD3f6N5WybMDPzq/hoS0cuRfDb5cgKknqDpof7zjRIxG6omYIbgujhFvDsGMIk3WPHzLEUTEyNLh+t2g5ewxqJZYbJLoM3n/NSZLSAgGrlbgujq90G8RSl4y1Ya0f7u+GPi+nvMRn40sIZqHqNAFC7jvAhdpIwfVR9bOHAtHSg8Wl9eHhxLHvthPa8N9yL9Iw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199018)(46966006)(36840700001)(40470700004)(4326008)(356005)(82740400003)(36860700001)(81166007)(33656002)(86362001)(8676002)(36756003)(6862004)(8936002)(41300700001)(5660300002)(2906002)(40480700001)(70586007)(70206006)(82310400005)(186003)(336012)(6506007)(6512007)(2616005)(40460700003)(47076005)(83380400001)(53546011)(26005)(316002)(6486002)(54906003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:55:57.2623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efa19b6-0356-4554-c959-08db1a3b27a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5870

Hi Jens,

> On 1 Mar 2023, at 10:30, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Hi Bertrand,
>=20
> On Tue, Feb 28, 2023 at 1:57 PM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Jens,
>>=20
>>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>>>=20
>>> When initializing the FF-A mediator map the RX and TX buffers shared wi=
th
>>> the SPMC.
>>>=20
>>> These buffer are later used to to transmit data that cannot be passed i=
n
>>> registers only.
>>>=20
>>> Adds a check that the SP supports the needed FF-A features
>>> FFA_RXTX_MAP_64 / FFA_RXTX_MAP_32 and FFA_RXTX_UNMAP. In 64-bit mode we
>>> must use FFA_RXTX_MAP_64 since registers are used to transmit the
>>> physical addresses of the RX/TX buffers.
>>=20
>> Right now, FFA on 32bit would only work correctly if LPAE is not used an=
d only addresses
>> under 4G are used by Xen and by guests as addresses are transferred thro=
ugh a single register.
>>=20
>> I think that we need for now to only enable FFA support on 64bit as the =
limitations we
>> would need to enforce on 32bit are complex and the use case for FFA on 3=
2bit platforms
>> is not that obvious now.
>=20
> OK, I'll drop the #ifdef CONFIG_ARM_64 and #ifdef CONFIG_ARM_32 and
> instead depend on ARM_64 in Kconfig.
> If we ever want to use this on ARM_32 we'll have to go through
> everything anyway.

Yes this is the best solution for now.
And support.md patch is already saying already arm64.

>=20
>>=20
>>>=20
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>> xen/arch/arm/tee/ffa.c | 57 +++++++++++++++++++++++++++++++++++++++++-
>>> 1 file changed, 56 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>> index a5d8a12635b6..07dd5c36d54b 100644
>>> --- a/xen/arch/arm/tee/ffa.c
>>> +++ b/xen/arch/arm/tee/ffa.c
>>> @@ -148,6 +148,15 @@ struct ffa_ctx {
>>> /* Negotiated FF-A version to use with the SPMC */
>>> static uint32_t ffa_version __ro_after_init;
>>>=20
>>> +/*
>>> + * Our rx/tx buffers shared with the SPMC.
>>> + *
>>> + * ffa_page_count is the number of pages used in each of these buffers=
.
>>> + */
>>> +static void *ffa_rx __read_mostly;
>>> +static void *ffa_tx __read_mostly;
>>> +static unsigned int ffa_page_count __read_mostly;
>>> +
>>> static bool ffa_get_version(uint32_t *vers)
>>> {
>>>    const struct arm_smccc_1_2_regs arg =3D {
>>> @@ -217,6 +226,17 @@ static bool check_mandatory_feature(uint32_t id)
>>>    return !ret;
>>> }
>>>=20
>>> +static int32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
>>> +                            uint32_t page_count)
>>=20
>> Using register_t type here is doing an implicit cast when called and on
>> 32bit this might later remove part of the address.
>> This function must take paddr_t as parameters.
>=20
> I'll change to paddr_t for rx/tx.
>=20
>>=20
>>> +{
>>> +    uint32_t fid =3D FFA_RXTX_MAP_32;
>>> +
>>> +    if ( IS_ENABLED(CONFIG_ARM_64) )
>>> +        fid =3D FFA_RXTX_MAP_64;
>>> +
>>> +    return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
>>=20
>> simple call might not be suitable on 32bits due to the conversion.
>> As said earlier, it would make more sense to disable FFA on 32bit and
>> put some comments/build_bug_on in the code in places where there
>> would be something to fix.
>=20
> I'm dropping the 32-bit support.
>=20
>>=20
>>> +}
>>> +
>>> static uint16_t get_vm_id(const struct domain *d)
>>> {
>>>    /* +1 since 0 is reserved for the hypervisor in FF-A */
>>> @@ -384,6 +404,7 @@ static int ffa_relinquish_resources(struct domain *=
d)
>>> static bool ffa_probe(void)
>>> {
>>>    uint32_t vers;
>>> +    int e;
>>>    unsigned int major_vers;
>>>    unsigned int minor_vers;
>>>=20
>>> @@ -426,12 +447,46 @@ static bool ffa_probe(void)
>>>    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>>>           major_vers, minor_vers);
>>>=20
>>> -    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>>> +    if (
>>> +#ifdef CONFIG_ARM_64
>>> +         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
>>> +#endif
>>> +#ifdef CONFIG_ARM_32
>>> +         !check_mandatory_feature(FFA_RXTX_MAP_32) ||
>>> +#endif
>>> +         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
>>> +         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>>>        return false;
>>>=20
>>> +    ffa_rx =3D alloc_xenheap_pages(0, 0);
>>> +    if ( !ffa_rx )
>>> +        return false;
>>> +
>>> +    ffa_tx =3D alloc_xenheap_pages(0, 0);
>>> +    if ( !ffa_tx )
>>> +        goto err_free_ffa_rx;
>>> +
>>> +    e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), 1);
>>> +    if ( e )
>>> +    {
>>> +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
>>> +        goto err_free_ffa_tx;
>>> +    }
>>> +    ffa_page_count =3D 1;
>>=20
>> ffa_page_count is a constant here and is not used to do the allocation o=
r
>> passed as parameter to ffa_rxtx_map.
>>=20
>> Do you expect this value to be modified ? how ?
>=20
> I expect this value to match how many FFA_PAGE_SIZE pages have been
> mapped for the RX/TX buffers. Currently, this is only 1 but will have
> to be changed later if PAGE_SIZE in Xen or in the secure world is
> larger than FFA_PAGE_SIZE. We may also later add support
> configurations where RX/TX buffers aren't mapped.

So it is a constant and the buffers are just mapped or not mapped.

>=20
>>=20
>> Please set it first and use it for allocation and as parameter to rxtx_m=
ap so
>> that a modification of the value would only have to be done in one place=
.
>>=20
>> Please use a define if this is a constant.
>=20
> How about adding a define FFA_MIN_RXTX_PAGE_COUNT and giving that to
> ffa_rxtx_map() and later assigning it to ffa_page_count if the call
> succeeds?

Why MIN ?

How about just using ffa_rx or ffa_tx being NULL or not to check if the buf=
fers are
mapped and remove the count.

>=20
>>=20
>> As it is a global variable, does the parameter to rxtx_map make sense ?
>=20
> Yes, ffa_rxtx_map() is a dumb wrapper so it should have all the needed
> parameters for the SMC provided.

Then passing FFA_MIN_RXTX_PAGE_COUNT should be enough.

Cheers
Bertrand

>=20
> Cheers,
> Jens
>=20
>>=20
>> Cheers
>> Bertrand
>>=20
>>>    ffa_version =3D vers;
>>>=20
>>>    return true;
>>> +
>>> +err_free_ffa_tx:
>>> +    free_xenheap_pages(ffa_tx, 0);
>>> +    ffa_tx =3D NULL;
>>> +err_free_ffa_rx:
>>> +    free_xenheap_pages(ffa_rx, 0);
>>> +    ffa_rx =3D NULL;
>>> +    ffa_page_count =3D 0;
>>> +    ffa_version =3D 0;
>>> +
>>> +    return false;
>>> }
>>>=20
>>> static const struct tee_mediator_ops ffa_ops =3D
>>> --
>>> 2.34.1



