Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D40895E9C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 23:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700240.1093063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrlXp-0008Fa-Kg; Tue, 02 Apr 2024 21:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700240.1093063; Tue, 02 Apr 2024 21:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrlXp-0008CU-Gm; Tue, 02 Apr 2024 21:19:49 +0000
Received: by outflank-mailman (input) for mailman id 700240;
 Tue, 02 Apr 2024 21:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/NG=LH=epam.com=prvs=0822718870=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rrlXo-0008CO-5L
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 21:19:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b91153b9-f136-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 23:19:44 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 432EjUuf014309; Tue, 2 Apr 2024 21:19:23 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3x8m2f8xry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Apr 2024 21:19:22 +0000 (GMT)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB3PR0302MB9184.eurprd03.prod.outlook.com
 (2603:10a6:10:43e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 21:19:17 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::74c9:2488:1dd7:b976]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::74c9:2488:1dd7:b976%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 21:19:15 +0000
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
X-Inumbo-ID: b91153b9-f136-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRshX0fdleM4ovrTgeYtEL3W80vZFEkANskPcbIbRzlzgYiUFhdvD+73Xcw01/6FFoFBxZwwF3m4uMM0+0AMqDYcMLAJ7YSWhqvdDWTLfLtLYeM9QsmS+DiFgnU7jhMqFflNBQBfxYFASvDYCyp+gRjB/EY18BKxQORlG2ZTrcYvwOQamn4CDFeomWAg8emRIjhKKXBfqNxTW9rDeGsGzaBLkLr2rZqAnHxK/tpxFbMa3fiPZ6VWXJ80rUiEQNMhwFU6FQCmepP8ffVqfFdMLzpETxVDaCv/o2F8UkwjVlxAKeDBG8fTsuko8Zpp8b0U/xrCxLHueV8HRCiHYugjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coh1wEPJ7wXL71voyGnAE/2Wx4fPwFBovKp5S2dAtBw=;
 b=e6WuADE19Vi1vkxpnJcTcbE/qirXAjrCjcRuqM8Hz1eAwoicwLlBYrg59SD8JbiJuRyurVrhf78GPWTwijtQebjWIHwKfwD2YN42xfLnN85cf7RTULo/8FaUi1faC6aNICp71c3oKj5kF+/vqY5VsHH4Gyns/n/y6U9OoYkzmtVF9vOtMmDt1EZR2PsynevMo5F6/5GAjcXoJhsKdlv4dWwuouANrnKh8vJXVu/mufAoC/R4nY6sNH0eTTWFcJTtvtumjVg6NvdbfNP5hCl2hA9z9yKYDeix7DPyvPRIY/BPMshqRfS3Zlj5uTrBkiHJoc4hk7sThgmsIbYGlpq6AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coh1wEPJ7wXL71voyGnAE/2Wx4fPwFBovKp5S2dAtBw=;
 b=c4K5JevHr/gIgHY9Dqr78jFa7B1iXcxIi0XYeUvqed5+u/GyBzPUKsn3YxDcgAkV23btOPhTpdUfjTkUO0EHQELjhZRiaz9HxIA84bBQRIo4FWI2N1LK0JxWHxbQ6Z1c5H/A/hdkz9kTqe7xE8ILSga1AdjhtzB9nFpavD70BrSie/E8KD7On8hnQpbjnldIeH5DadPL54r6fTnErE9XxghkfreIpiHf+aNT3KLlzZ4loaNq3s0dWIpXRs0iOypvkkGL5dv3Bc1Gh15/Y7zJDTLGs+l81F0pupng5tx+V787hzOaqgPM7vGhnqHnUMtdwt0ZZLreTkCeESdZLWUiFw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial
 driver
Thread-Topic: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial
 driver
Thread-Index: AQHagW1LewNbiHn0V0mBfSyHgZWL5bFUzUoAgAADLoA=
Date: Tue, 2 Apr 2024 21:19:15 +0000
Message-ID: <87le5vxy26.fsf@epam.com>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
 <91ceb418-f055-45ba-82c4-f37e812d5242@amd.com>
In-Reply-To: <91ceb418-f055-45ba-82c4-f37e812d5242@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB3PR0302MB9184:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sv2ycgfy1rhVpWzIPve7mNcIB2stA8FOcTv59rzD3De7mD52N0yFizdOcIanP+nfriwHtz+LMaLlkQmrljl9PDElWa0Klvj15wRlrr0lkOxHyyVVZ2/wOWUyaYmibpaav39vxMHt8FuLKo6WfdxIzDL7XoWPbVIkJty8QWn4tEks2HDeCCYa1rrFlAkubXhJuMBL5gVYF3VITTTZx+w3FXog+NQjwX9q6x6TXMFDiGraFwx4tJS0RsGGbn3j0dkGm9Ea05QjnZ7RW1NZivBzI/+JBB0TIeDCQN33w/SI0gri31nlxTS5MkJDG4XCC6WnWAQI2EA7tfBfBAON3OZrG8xat0CPHW3VUALpJXGYPlO3q9TQt/Mu8nWg8gSdWlfi7Xkw3Ky9JDjtRdF62i9eaA9iUPMYxGnDMLWvLdOaFWk9zdGZcvjTdxvvt7Ka93g2twBZtcwEb4SN57fcKLIotq0VG5hx0D0coUSMxvBN0wMGGgV4fHscI3H9sHdXArQ8EF9UZuVDai9y6AZAXzbon8VXoPInZf48NB/uA9zLmsO9I3fggB1PmQievsupc4KCJARihOKcKrlhwWDqEYJiKG07AZRORoIB4rDQsGbX90uq12oceyl0SfZ5egAP1IRZLjxIsyk/YpIGYjax76Qqv+RLxmd5sbFNLXUFJszx5fk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3EJOmV8egUzEuRBuhPdCWYQSc/ufdqbpX/WHkIYRdfK4G1wgpzEOZj1PBR?=
 =?iso-8859-1?Q?00x0nFyhQ8k4FTEkbhNa8BUywglNxaphjR57/r4/sxg8v7uL+z3FWj9xXm?=
 =?iso-8859-1?Q?CJVvQCAGoqqAyP9QwtXwDJy1m38RRjrDkv4Q0dZohcJ5U9pnbtn5wvkU3g?=
 =?iso-8859-1?Q?dt3Kb05pWxIVjq0b0t6BezNxgPrjstS/fKi8l2vcSwjQL+Xi10EWYzX08d?=
 =?iso-8859-1?Q?lnnHoG51ZYu7wpj0HS8TCutKemWTBMJjHlxM5zpTZTkqwJ9l0mS82WYNZK?=
 =?iso-8859-1?Q?Q88jrLQD4AJUiVqXwQTLkI8wZfzhv5vS2EsLvIafqDR4UgkYplsKnTGNzO?=
 =?iso-8859-1?Q?+5FRLsW0IuTzHD1yiq+Db7xML6GTcSI6aLPurfgnHw1/W6au9BBE+KaT9X?=
 =?iso-8859-1?Q?dP4Q1I7aavtChfCvfgBiOdAlPqrx4I6jH4RG/JSXgfKTCVAnI19K18PJ5/?=
 =?iso-8859-1?Q?JswAnvSxaC04PH/ATykYUsEpMpdCyeDgh6lAQ6QAKc4Owe5VSwu2KAAXOB?=
 =?iso-8859-1?Q?tl9UxgnPmFpcWykj3m3eX2crk1WdssH/TuNTx7DXLiz949FBlC22HThCHi?=
 =?iso-8859-1?Q?E9CoiZkcqsow//kvLEaNMvywtTVSavosiZ6xN8tK32xsZTT4747k5IKWa+?=
 =?iso-8859-1?Q?QHJI2ym94AwAZs6W0xkvO4F55q6rs1xpJ4p3D2RD5KdN3znN9QQ7m0fChU?=
 =?iso-8859-1?Q?wwi6GwlQi+PJxP3IQxNOcWsnqYM/ffWUg/MNAzqJ8Ok0N/7RD79ZlLmKKm?=
 =?iso-8859-1?Q?cqH2aQD9kBRERsny0So3ry8oJ7qWMN32irIMLjCccl+6uuCWH5Wg7xDEHs?=
 =?iso-8859-1?Q?zs9E+M9oBwLfeqbt4gEzSkORpxXoVOasNaEoijn/0rBJJ99Ca3SwUy/9/m?=
 =?iso-8859-1?Q?7zTEOj1cSvkvJfoodW6rVifwdN2MjhSn52uE2SjzSkolOuQwLDq4o1gvF6?=
 =?iso-8859-1?Q?haSZzvZ1aW7SGJKTvAy78GPBISwZf+gkyjoDam6keZAkOsHe5xT6kntB2W?=
 =?iso-8859-1?Q?gGlksPmBmYrazvEH9fSV0bpFXa63/RqVdxbKwK1OcbDOwpE7m7ywBpLBtV?=
 =?iso-8859-1?Q?6z5igUyfqh5X9NKAkKSnBaMN4a7yRVinreUaTcWBCZvcoZgiJh1jrrrXwW?=
 =?iso-8859-1?Q?J1EsuAr4mIU4yNr6kZizBD99VEyeUzRrJZZzneF8S7c8/qVkYcmFUqHZRU?=
 =?iso-8859-1?Q?kyC2OZAKgAburEFe6PyKcATN79lqf48MCgMFG+7zM7JuRsZ2pR6TPWeJ6D?=
 =?iso-8859-1?Q?RBje+UhR+oaoNOq+QBd+M9RIgHPhL9FgPsNbZFzC8v9YsB63IOy3pajD0p?=
 =?iso-8859-1?Q?4RLeGwW8jjhAa5SMfvpozVl4PbtKSGkphl6uxLqBHRBsXGE+KdlrontXbc?=
 =?iso-8859-1?Q?yr0gaHM5YPE0C5KEG+4mAgoOcJuYKXYUEOS5zjcR9/iDdGSx1rM7hNogsT?=
 =?iso-8859-1?Q?mzXlPEtCkNuyuKPZ/n655KuKPrwIlPPk/PlY9tsRB4CsJ9bGfH4MTCGET8?=
 =?iso-8859-1?Q?IqVOdPe2GwrC12BHaWLfKLQ8rcd6PzUuDsnvjxnStEY5xImGay0f9ov0O+?=
 =?iso-8859-1?Q?zBZcQ5cPPZwdhIiQYSL4cAefhBCxInql1IY5F84ZOv05Mu/2CZXyyFpIjP?=
 =?iso-8859-1?Q?dSGI30AqLqdPfnn45Ue5LnQMHLszEn8JfdZU+rd3uRC4I3woidaYtIBQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70584df-b1ac-447e-069d-08dc535a8cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2024 21:19:15.4417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9RBWCYEvLdvULOPK/XeQvsnafpI5bHT0I+3dar8QDpDSfDqL5CSkHIMXCHKcXhaay6RpsOo0KRKD9/o9Mji+OzVhlW7hxX94oal8BRFiOrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9184
X-Proofpoint-GUID: r-CsrFT8sv9w25zlzZAqGZP6IqtXl2iL
X-Proofpoint-ORIG-GUID: r-CsrFT8sv9w25zlzZAqGZP6IqtXl2iL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020158


Hi Michal,

Michal Orzel <michal.orzel@amd.com> writes:

> Hello,
>
> On 29/03/2024 01:08, Volodymyr Babchuk wrote:
>>=20
>>=20
>> Generic Interface (GENI) is a newer interface for low speed interfaces
>> like UART, I2C or SPI. This patch adds the simple driver for the UART
>> instance of GENI. Code is based on similar drivers in U-Boot and Linux
>> kernel.
> Do you have a link to a manual?

I wish I had. Qualcomm provides HW manuals only under very strict
NDAs. At the time of writing I don't have access to the manual at
all. Those patches are based solely on similar drivers in U-Boot and
Linux kernel.

>>=20
>> This driver implements only simple synchronous mode, because although
>> GENI supports FIFO mode, it needs to know number of
>> characters **before** starting TX transaction. This is a stark
>> contrast when compared to other UART peripherals, which allow adding
>> characters to a FIFO while TX operation is running.
>>=20
>> The patch adds both normal UART driver and earlyprintk version.
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>>  xen/arch/arm/Kconfig.debug           |  19 +-
>>  xen/arch/arm/arm64/debug-qcom.inc    |  76 +++++++
> Shouldn't all the files (+ other places) have geni in their names? Could =
qcom refer to other type of serial device?

AFAIK, there is an older type of serial device. Both Linux and U-Boot
use "msm" instead of "qcom" in drivers names for those devices.

But I can add "geni" to the names, no big deal.

>
>>  xen/arch/arm/include/asm/qcom-uart.h |  48 +++++
>>  xen/drivers/char/Kconfig             |   8 +
>>  xen/drivers/char/Makefile            |   1 +
>>  xen/drivers/char/qcom-uart.c         | 288 +++++++++++++++++++++++++++
>>  6 files changed, 439 insertions(+), 1 deletion(-)
>>  create mode 100644 xen/arch/arm/arm64/debug-qcom.inc
>>  create mode 100644 xen/arch/arm/include/asm/qcom-uart.h
>>  create mode 100644 xen/drivers/char/qcom-uart.c
>>=20
>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>> index eec860e88e..f6ab0bb30e 100644
>> --- a/xen/arch/arm/Kconfig.debug
>> +++ b/xen/arch/arm/Kconfig.debug
>> @@ -119,6 +119,19 @@ choice
>>                         selecting one of the platform specific options b=
elow if
>>                         you know the parameters for the port.
>>=20
>> +                       This option is preferred over the platform speci=
fic
>> +                       options; the platform specific options are depre=
cated
>> +                       and will soon be removed.
>> +       config EARLY_UART_CHOICE_QCOM
> The list is sorted alphabetically. Please adhere to that.
>

Sure

>> +               select EARLY_UART_QCOM
>> +               bool "Early printk via Qualcomm debug UART"
> Shouldn't you add depends on ARM_64? Isn't this device Arm64 specific lik=
e in Linux?
>

In linux it depends on ARCH_QCOM which can be enabled both for arm and
arm64. But for Xen case... I believe it is better to make ARM_64
dependency.

>> +               help
>> +                       Say Y here if you wish the early printk to direc=
t their
> help text here should be indented by 2 tabs and 2 spaces (do not take exa=
mple from surrounding code)
>

Would anyone mind if I'll send patch that aligns surrounding code as well?

>> +                       output to a Qualcomm debug UART. You can use thi=
s option to
>> +                       provide the parameters for the debug UART rather=
 than
>> +                       selecting one of the platform specific options b=
elow if
>> +                       you know the parameters for the port.
>> +
>>                         This option is preferred over the platform speci=
fic
>>                         options; the platform specific options are depre=
cated
>>                         and will soon be removed.
>> @@ -211,6 +224,9 @@ config EARLY_UART_PL011
>>  config EARLY_UART_SCIF
>>         select EARLY_PRINTK
>>         bool
>> +config EARLY_UART_QCOM
>> +       select EARLY_PRINTK
>> +       bool
> The list is sorted alphabetically. Please adhere to that.
>
>>=20
>>  config EARLY_PRINTK
>>         bool
>> @@ -261,7 +277,7 @@ config EARLY_UART_PL011_MMIO32
>>           will be done using 32-bit only accessors.
>>=20
>>  config EARLY_UART_INIT
>> -       depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE !=3D 0
>> +       depends on (EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE !=3D =
0) || EARLY_UART_QCOM
>>         def_bool y
>>=20
>>  config EARLY_UART_8250_REG_SHIFT
>> @@ -308,3 +324,4 @@ config EARLY_PRINTK_INC
>>         default "debug-mvebu.inc" if EARLY_UART_MVEBU
>>         default "debug-pl011.inc" if EARLY_UART_PL011
>>         default "debug-scif.inc" if EARLY_UART_SCIF
>> +       default "debug-qcom.inc" if EARLY_UART_QCOM
>> diff --git a/xen/arch/arm/arm64/debug-qcom.inc b/xen/arch/arm/arm64/debu=
g-qcom.inc
>> new file mode 100644
>> index 0000000000..130d08d6e9
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/debug-qcom.inc
>> @@ -0,0 +1,76 @@
>> +/*
>> + * xen/arch/arm/arm64/debug-qcom.inc
>> + *
>> + * Qualcomm debug UART specific debug code
>> + *
>> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> + * Copyright (C) 2024, EPAM Systems.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
> No need for the license text. You should use SPDX identifier instead at t=
he top of the file:
> /* SPDX-License-Identifier: GPL-2.0-or-later */
>
>> + */
>> +
>> +#include <asm/qcom-uart.h>
>> +
>> +.macro early_uart_init xb c
> Separate macro parameters with comma (here and elsewhere) and please add =
a comment on top clarifying the use
> Also, do we really need to initialize uart every time? What if firmware d=
oes that?
>

You see, this code is working inside-out. early printk code in Xen is
written with assumption that early_uart_transmit don't need a scratch
register. But this is not true for GENI... To send one character we
must write two registers beforehand: TX_TRANS_LEN and CMD0. Only after
that we can write something to FIFO. But early_uart_transmit has no
scratch register to prepare values for TX_TRANS_LEN and CMD0. So we
write what we do here

1. Reset the state machine with ABORT command
2. Write 1 to TX_TRANS_LEN
3. Write START_TX to CMD0

Now early_uart_transmit can write "wt" to the FIFO and after that it can
use "wt" as a scratch register to repeat steps 2 and 3.

Probably I need this as a comment to into the .inc file...

>> +        mov   w\c, #M_GENI_CMD_ABORT
>> +        str   w\c, [\xb, #SE_GENI_M_CMD_CTRL_REG]
>> +1:
>> +        ldr   w\c, [\xb, #SE_GENI_M_IRQ_STATUS]   /* Load IRQ status */
>> +        tst   w\c, #M_CMD_ABORT_EN         /* Check TX_FIFI_WATERMARK_E=
N bit */
> The comment does not correspond to the code. Shouldn't this be the same a=
s in early_uart_ready?
>

We need to reset the state machine with ABORT command just in case. So
code is correct, but the comment is wrong.

>> +        beq   1b                          /* Wait for the UART to be re=
ady */
>> +        mov   w\c, #M_CMD_ABORT_EN
>> +        orr   w\c, w\c, #M_CMD_DONE_EN
>> +        str   w\c, [\xb, #SE_GENI_M_IRQ_CLEAR]
>> +
>> +        mov   w\c, #1
>> +        str   w\c, [\xb, #SE_UART_TX_TRANS_LEN]         /* write len */
>> +
>> +        mov   w\c, #(UART_START_TX << M_OPCODE_SHFT)    /* Prepare cmd =
 */
>> +        str   w\c, [\xb, #SE_GENI_M_CMD0]               /* write cmd */
>> +.endm
>> +/*
>> + * wait for UART to be ready to transmit
>> + * xb: register which contains the UART base address
>> + * c: scratch register
>> + */
>> +.macro early_uart_ready xb c
>> +1:
>> +        ldr   w\c, [\xb, #SE_GENI_M_IRQ_STATUS] /* Load IRQ status */
>> +        tst   w\c, #M_TX_FIFO_WATERMARK_EN  /* Check TX_FIFI_WATERMARK_=
EN bit */
>> +        beq    1b                           /* Wait for the UART to be =
ready */
>> +.endm
>> +
>> +/*
>> + * UART transmit character
>> + * xb: register which contains the UART base address
>> + * wt: register which contains the character to transmit
>> + */
>> +.macro early_uart_transmit xb wt
>> +        str   \wt, [\xb, #SE_GENI_TX_FIFOn]             /* Put char to =
FIFO */
>> +        mov   \wt, #M_TX_FIFO_WATERMARK_EN              /* Prepare to F=
IFO */
>> +        str   \wt, [\xb, #SE_GENI_M_IRQ_CLEAR]          /* Kick FIFO */
>> +95:
>> +        ldr   \wt, [\xb, #SE_GENI_M_IRQ_STATUS]         /* Load IRQ sta=
tus */
>> +        tst   \wt, #M_CMD_DONE_EN           /* Check TX_FIFO_WATERMARK_=
EN bit */
>> +        beq   95b                           /* Wait for the UART to be =
ready */
>> +        mov   \wt, #M_CMD_DONE_EN
>> +        str   \wt, [\xb, #SE_GENI_M_IRQ_CLEAR]
>> +
>> +        mov   \wt, #(UART_START_TX << M_OPCODE_SHFT)    /* Prepare next=
 cmd */
>> +        str   \wt, [\xb, #SE_GENI_M_CMD0]               /* write cmd */
>> +.endm
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/qcom-uart.h b/xen/arch/arm/include=
/asm/qcom-uart.h
>> new file mode 100644
>> index 0000000000..dc9579374c
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/qcom-uart.h
>> @@ -0,0 +1,48 @@
>> +/*
>> + * xen/include/asm-arm/qcom-uart.h
> What's the use of this pseudo path? I would drop it or provide a correct =
path.
>
>> + *
>> + * Common constant definition between early printk and the UART driver
>> + * for the Qualcomm debug UART
>> + *
>> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> + * Copyright (C) 2024, EPAM Systems.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
> No need for the license text. You should use SPDX identifier instead at t=
he top of the file:
> /* SPDX-License-Identifier: GPL-2.0-or-later */
>
>> + */
>> +
>> +#ifndef __ASM_ARM_QCOM_UART_H
>> +#define __ASM_ARM_QCOM_UART_H
>> +
>> +#define SE_UART_TX_TRANS_LEN            0x270
>> +#define SE_GENI_M_CMD0                  0x600
>> +#define   UART_START_TX                 0x1
>> +#define   M_OPCODE_SHFT                 27
>> +
>> +#define SE_GENI_M_CMD_CTRL_REG          0x604
>> +#define   M_GENI_CMD_ABORT              BIT(1, U)
>> +#define SE_GENI_M_IRQ_STATUS            0x610
>> +#define   M_CMD_DONE_EN                 BIT(0, U)
>> +#define   M_CMD_ABORT_EN                BIT(5, U)
>> +#define   M_TX_FIFO_WATERMARK_EN        BIT(30, U)
>> +#define SE_GENI_M_IRQ_CLEAR             0x618
>> +#define SE_GENI_TX_FIFOn                0x700
>> +#define SE_GENI_TX_WATERMARK_REG        0x80c
> AFAICT, in this header you listed only regs used both by assembly and c c=
ode.
> However, SE_GENI_TX_WATERMARK_REG is not used in assembly.
> Also, my personal opinion is that it would make more sense to list here a=
ll the regs.

Okay, I'll move all the register to the header.

>> +
>> +#endif /* __ASM_ARM_QCOM_UART_H */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
>> index e18ec3788c..52c3934d06 100644
>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -68,6 +68,14 @@ config HAS_SCIF
>>           This selects the SuperH SCI(F) UART. If you have a SuperH base=
d board,
>>           or Renesas R-Car Gen 2/3 based board say Y.
>>=20
>> +config HAS_QCOM_UART
>> +       bool "Qualcomm GENI UART driver"
>> +       default y
>> +       depends on ARM
> Isn't is Arm64 specific device?
>

Probably yes. I believe it is safe to assume that it is Arm64-specific
in Xen case.

>> +       help
>> +         This selects the Qualcomm GENI-based UART driver. If you
>> +         have a Qualcomm-based board board say Y here.
>> +
>>  config HAS_EHCI
>>         bool
>>         depends on X86
>> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
>> index e7e374775d..698ad0578c 100644
>> --- a/xen/drivers/char/Makefile
>> +++ b/xen/drivers/char/Makefile
>> @@ -7,6 +7,7 @@ obj-$(CONFIG_HAS_MESON) +=3D meson-uart.o
>>  obj-$(CONFIG_HAS_MVEBU) +=3D mvebu-uart.o
>>  obj-$(CONFIG_HAS_OMAP) +=3D omap-uart.o
>>  obj-$(CONFIG_HAS_SCIF) +=3D scif-uart.o
>> +obj-$(CONFIG_HAS_QCOM_UART) +=3D qcom-uart.o
> Q comes before S
>
>>  obj-$(CONFIG_HAS_EHCI) +=3D ehci-dbgp.o
>>  obj-$(CONFIG_XHCI) +=3D xhci-dbc.o
>>  obj-$(CONFIG_HAS_IMX_LPUART) +=3D imx-lpuart.o
>> diff --git a/xen/drivers/char/qcom-uart.c b/xen/drivers/char/qcom-uart.c
>> new file mode 100644
>> index 0000000000..2614051ca0
>> --- /dev/null
>> +++ b/xen/drivers/char/qcom-uart.c
>> @@ -0,0 +1,288 @@
>> +/*
>> + * xen/drivers/char/qcom-uart.c
>> + *
>> + * Driver for Qualcomm GENI-based UART interface
>> + *
>> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> + *
>> + * Copyright (C) EPAM Systems 2024
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
> No need for the license text. You should use SPDX identifier instead at t=
he top of the file:
> /* SPDX-License-Identifier: GPL-2.0-or-later */
>
>> + */
>> +
>> +#include <xen/console.h>
>> +#include <xen/const.h>
>> +#include <xen/errno.h>
>> +#include <xen/serial.h>
>> +#include <xen/init.h>
>> +#include <xen/irq.h>
>> +#include <xen/mm.h>
>> +#include <xen/delay.h>
>> +#include <asm/device.h>
>> +#include <asm/qcom-uart.h>
>> +#include <asm/io.h>
>> +
>> +#define GENI_FORCE_DEFAULT_REG          0x20
>> +#define   FORCE_DEFAULT                 BIT(0, U)
>> +#define   DEF_TX_WM                     2
>> +#define SE_GENI_TX_PACKING_CFG0         0x260
>> +#define SE_GENI_TX_PACKING_CFG1         0x264
>> +#define SE_GENI_RX_PACKING_CFG0         0x284
>> +#define SE_GENI_RX_PACKING_CFG1         0x288
>> +#define SE_GENI_M_IRQ_EN                0x614
>> +#define   M_SEC_IRQ_EN                  BIT(31, U)
>> +#define   M_RX_FIFO_WATERMARK_EN        BIT(26, U)
>> +#define   M_RX_FIFO_LAST_EN             BIT(27, U)
>> +#define SE_GENI_S_CMD0                  0x630
>> +#define   UART_START_READ               0x1
>> +#define   S_OPCODE_SHFT                 27
>> +#define SE_GENI_S_CMD_CTRL_REG          0x634
>> +#define   S_GENI_CMD_ABORT              BIT(1, U)
>> +#define SE_GENI_S_IRQ_STATUS            0x640
>> +#define SE_GENI_S_IRQ_EN                0x644
>> +#define   S_RX_FIFO_LAST_EN             BIT(27, U)
>> +#define   S_RX_FIFO_WATERMARK_EN        BIT(26, U)
>> +#define   S_CMD_ABORT_EN                BIT(5, U)
>> +#define   S_CMD_DONE_EN                 BIT(0, U)
>> +#define SE_GENI_S_IRQ_CLEAR             0x648
>> +#define SE_GENI_RX_FIFOn                0x780
>> +#define SE_GENI_TX_FIFO_STATUS          0x800
>> +#define   TX_FIFO_WC                    GENMASK(27, 0)
>> +#define SE_GENI_RX_FIFO_STATUS          0x804
>> +#define   RX_LAST                       BIT(31, U)
>> +#define   RX_LAST_BYTE_VALID_MSK        GENMASK(30, 28)
>> +#define   RX_LAST_BYTE_VALID_SHFT       28
>> +#define   RX_FIFO_WC_MSK                GENMASK(24, 0)
>> +#define SE_GENI_TX_WATERMARK_REG        0x80c
>> +
>> +static struct qcom_uart {
>> +    unsigned int irq;
>> +    char __iomem *regs;
>> +    struct irqaction irqaction;
>> +} qcom_com =3D {0};
>> +
>> +static bool qcom_uart_poll_bit(void *addr, uint32_t mask, bool set)
>> +{
>> +    unsigned long timeout_us =3D 20000;
> Why UL and not U?
>
>> +    uint32_t reg;
>> +
>> +    while ( timeout_us ) {
> Brace should be placed on its own line
>
>> +        reg =3D readl(addr);
>> +        if ( (bool)(reg & mask) =3D=3D set )
>> +            return true;
>> +        udelay(10);
>> +        timeout_us -=3D 10;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static void __init qcom_uart_init_preirq(struct serial_port *port)
>> +{
>> +    struct qcom_uart *uart =3D port->uart;
>> +
>> +    /* Stop anything in TX that earlyprintk configured and clear all er=
rors */
>> +    writel(M_GENI_CMD_ABORT, uart->regs + SE_GENI_M_CMD_CTRL_REG);
> It would be easier to creare wrappers that would improve readability:
> #define qcom_write(uart, off, val) writel((val), (uart)->regs + (off))
> #define qcom_read(uart, off) readl((uart)->regs + (off))
>
>> +    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_CMD_ABORT_E=
N,
>> +                       true);
>> +    writel(M_CMD_ABORT_EN, uart->regs + SE_GENI_M_IRQ_CLEAR);
>> +
>> +    /*
>> +     * Configure FIFO length: 1 byte per FIFO entry. This is terribly
>> +     * ineffective, as it is possible to cram 4 bytes per FIFO word,
>> +     * like Linux does. But using one byte per FIFO entry makes this
>> +     * driver much simpler.
>> +     */
>> +    writel(0xf, uart->regs + SE_GENI_TX_PACKING_CFG0);
>> +    writel(0x0, uart->regs + SE_GENI_TX_PACKING_CFG1);
>> +    writel(0xf, uart->regs + SE_GENI_RX_PACKING_CFG0);
>> +    writel(0x0, uart->regs + SE_GENI_RX_PACKING_CFG1);
>> +
>> +    /* Reset RX state machine */
>> +    writel(S_GENI_CMD_ABORT, uart->regs + SE_GENI_S_CMD_CTRL_REG);
>> +    qcom_uart_poll_bit(uart->regs + SE_GENI_S_CMD_CTRL_REG,
>> +                       S_GENI_CMD_ABORT, false);
>> +    writel(S_CMD_DONE_EN | S_CMD_ABORT_EN, uart->regs + SE_GENI_S_IRQ_C=
LEAR);
>> +    writel(FORCE_DEFAULT, uart->regs + GENI_FORCE_DEFAULT_REG);
>> +}
>> +
>> +static void qcom_uart_interrupt(int irq, void *data, struct cpu_user_re=
gs *regs)
> serial_rx_interrupt has been modified not to take regs as parameter. Your=
 patch breaks the build here.
> You need to remove regs from here and ...
>
>> +{
>> +    struct serial_port *port =3D data;
>> +    struct qcom_uart *uart =3D port->uart;
>> +    uint32_t m_irq_status, s_irq_status;
>> +
>> +    m_irq_status =3D readl(uart->regs + SE_GENI_M_IRQ_STATUS);
>> +    s_irq_status =3D readl(uart->regs + SE_GENI_S_IRQ_STATUS);
>> +    writel(m_irq_status, uart->regs + SE_GENI_M_IRQ_CLEAR);
>> +    writel(s_irq_status, uart->regs + SE_GENI_S_IRQ_CLEAR);
>> +
>> +    if ( s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN) )
>> +        serial_rx_interrupt(port, regs);
> here.
>
>> +}
>> +
>> +static void __init qcom_uart_init_postirq(struct serial_port *port)
>> +{
>> +    struct qcom_uart *uart =3D port->uart;
>> +    int rc;
>> +    uint32_t val;
>> +
>> +    uart->irqaction.handler =3D qcom_uart_interrupt;
>> +    uart->irqaction.name    =3D "qcom_uart";
>> +    uart->irqaction.dev_id  =3D port;
>> +
>> +    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
> Value assigned to rc does not seem to be used at all
>
>> +        dprintk(XENLOG_ERR, "Failed to allocated qcom_uart IRQ %d\n",
>> +                uart->irq);
>> +
>> +    /* Enable TX/RX and Error Interrupts  */
>> +    writel(S_GENI_CMD_ABORT, uart->regs + SE_GENI_S_CMD_CTRL_REG);
>> +    qcom_uart_poll_bit(uart->regs + SE_GENI_S_CMD_CTRL_REG,
>> +                       S_GENI_CMD_ABORT, false);
>> +    writel(S_CMD_DONE_EN | S_CMD_ABORT_EN, uart->regs + SE_GENI_S_IRQ_C=
LEAR);
>> +    writel(FORCE_DEFAULT, uart->regs + GENI_FORCE_DEFAULT_REG);
>> +
>> +    val =3D readl(uart->regs + SE_GENI_S_IRQ_EN);
>> +    val =3D S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN;
>> +    writel(val, uart->regs + SE_GENI_S_IRQ_EN);
>> +
>> +    val =3D readl(uart->regs + SE_GENI_M_IRQ_EN);
>> +    val =3D M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
>> +    writel(val, uart->regs + SE_GENI_M_IRQ_EN);
>> +
>> +    /* Send RX command */
>> +    writel(UART_START_READ << S_OPCODE_SHFT, uart->regs + SE_GENI_S_CMD=
0);
>> +    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_SEC_IRQ_EN,
>> +                       true);
>> +}
>> +
>> +static void qcom_uart_putc(struct serial_port *port, char c)
>> +{
>> +    struct qcom_uart *uart =3D port->uart;
>> +    uint32_t irq_clear =3D M_CMD_DONE_EN;
>> +    uint32_t m_cmd;
>> +    bool done;
>> +
>> +    /* Setup TX */
>> +    writel(1, uart->regs + SE_UART_TX_TRANS_LEN);
>> +
>> +    writel(DEF_TX_WM, uart->regs + SE_GENI_TX_WATERMARK_REG);
>> +
>> +    m_cmd =3D UART_START_TX << M_OPCODE_SHFT;
>> +    writel(m_cmd, uart->regs + SE_GENI_M_CMD0);
>> +
>> +    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS,
>> +                       M_TX_FIFO_WATERMARK_EN, true);
>> +
>> +    writel(c, uart->regs + SE_GENI_TX_FIFOn);
>> +    writel(M_TX_FIFO_WATERMARK_EN, uart->regs + SE_GENI_M_IRQ_CLEAR);
>> +
>> +    /* Check for TX done */
>> +    done =3D qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_CM=
D_DONE_EN,
>> +                              true);
>> +    if ( !done )
>> +    {
>> +        writel(M_GENI_CMD_ABORT, uart->regs + SE_GENI_M_CMD_CTRL_REG);
>> +        irq_clear |=3D M_CMD_ABORT_EN;
>> +        qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_CMD_ABO=
RT_EN,
>> +                           true);
>> +
>> +    }
>> +    writel(irq_clear, uart->regs + SE_GENI_M_IRQ_CLEAR);
>> +}
>> +
>> +static int qcom_uart_getc(struct serial_port *port, char *pc)
>> +{
>> +    struct qcom_uart *uart =3D port->uart;
>> +
>> +    if ( !readl(uart->regs + SE_GENI_RX_FIFO_STATUS) )
>> +        return 0;
>> +
>> +    *pc =3D readl(uart->regs + SE_GENI_RX_FIFOn) & 0xFF;
>> +
>> +    writel(UART_START_READ << S_OPCODE_SHFT, uart->regs + SE_GENI_S_CMD=
0);
>> +    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_SEC_IRQ_EN,
>> +                       true);
>> +
>> +    return 1;
>> +
>> +}
>> +
>> +static struct uart_driver __read_mostly qcom_uart_driver =3D {
>> +    .init_preirq  =3D qcom_uart_init_preirq,
>> +    .init_postirq =3D qcom_uart_init_postirq,
>> +    .putc         =3D qcom_uart_putc,
>> +    .getc         =3D qcom_uart_getc,
>> +};
>> +
>> +static const struct dt_device_match qcom_uart_dt_match[] __initconst =
=3D
>> +{
>> +    { .compatible =3D "qcom,geni-debug-uart"},
>> +    { /* sentinel */ },
>> +};
> Can you move it right before DT_DEVICE_START?.
>
>> +
>> +static int __init qcom_uart_init(struct dt_device_node *dev,
>> +                                 const void *data)
>> +{
>> +    const char *config =3D data;
>> +    struct qcom_uart *uart;
>> +    int res;
>> +    paddr_t addr, size;
>> +
>> +    if ( strcmp(config, "") )
>> +        printk("WARNING: UART configuration is not supported\n");
>> +
>> +    uart =3D &qcom_com;
>> +
>> +    res =3D dt_device_get_paddr(dev, 0, &addr, &size);
>> +    if ( res )
>> +    {
>> +        printk("qcom-uart: Unable to retrieve the base"
>> +               " address of the UART\n");
>> +        return res;
>> +    }
>> +
>> +    res =3D platform_get_irq(dev, 0);
>> +    if ( res < 0 )
>> +    {
>> +        printk("qcom-uart: Unable to retrieve the IRQ\n");
>> +        return res;
>> +    }
>> +    uart->irq =3D res;
>> +
>> +    uart->regs =3D ioremap_nocache(addr, size);
>> +    if ( !uart->regs )
>> +    {
>> +        printk("qcom-uart: Unable to map the UART memory\n");
>> +        return -ENOMEM;
>> +    }
>> +
>> +    /* Register with generic serial driver */
>> +    serial_register_uart(SERHND_DTUART, &qcom_uart_driver, uart);
>> +
>> +    dt_device_set_used_by(dev, DOMID_XEN);
>> +
>> +    return 0;
>> +}
>> +
>> +DT_DEVICE_START(qcom_uart, "QCOM UART", DEVICE_SERIAL)
>> +    .dt_match =3D qcom_uart_dt_match,
>> +    .init =3D qcom_uart_init,
>> +DT_DEVICE_END
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> --
>> 2.43.0
>
> What about vUART? You don't seem to set vuart information that is used by=
 vuart.c and vpl011.c
>

I am not sure that it is possible to emulate GENI UART with simple vuart
API. vuart makes assumption that there is one simple status register and
FIFO register operates on per-character basis, while even earlycon part
of the driver in Linux tries to pack 4 characters to one FIFO write.

Thank you for the review. I'll address all other comments as you
suggested.=20

--=20
WBR, Volodymyr=

