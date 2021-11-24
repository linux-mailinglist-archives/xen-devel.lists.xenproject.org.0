Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C3545B926
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 12:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230371.398253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqYx-0000RZ-R5; Wed, 24 Nov 2021 11:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230371.398253; Wed, 24 Nov 2021 11:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqYx-0000OX-Na; Wed, 24 Nov 2021 11:35:43 +0000
Received: by outflank-mailman (input) for mailman id 230371;
 Wed, 24 Nov 2021 11:35:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDHO=QL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mpqYw-0000OR-IL
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 11:35:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6b7da53-4d1a-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 12:35:40 +0100 (CET)
Received: from AS8PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:310::23)
 by DBBPR08MB6011.eurprd08.prod.outlook.com (2603:10a6:10:209::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 24 Nov
 2021 11:35:37 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::3b) by AS8PR04CA0018.outlook.office365.com
 (2603:10a6:20b:310::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Wed, 24 Nov 2021 11:35:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 11:35:36 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Wed, 24 Nov 2021 11:35:36 +0000
Received: from 873787b63300.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9344A4AC-261F-44E1-85BC-786661A35C41.1; 
 Wed, 24 Nov 2021 11:35:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 873787b63300.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Nov 2021 11:35:29 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3653.eurprd08.prod.outlook.com (2603:10a6:20b:4c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 11:35:27 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%9]) with mapi id 15.20.4649.026; Wed, 24 Nov 2021
 11:35:26 +0000
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
X-Inumbo-ID: a6b7da53-4d1a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtgsvqEFlRc2z0mtLGeimkCZ+HpsyFir9s1PL08F5SM=;
 b=i+pRpFt22VyaLWTLq1Dy+X2otsyKuXU8kCpcdsavTfUdXhs/DK1s+JI5ShGhr6uDU67tPNWxVeJiAqRY8xZWrMRi26G3jxk1T7utXkn5vT/9gQA7+jiIAZCDS7Aa6ZtVU5YvGOOBuV/mz/JmcfDank7dhBGLvvIy//0RcDl+FCE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b1a64e28f1e0812
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5btag00M+7umHgGO7xUixSIWkjyRC1c8lCPPHa1cVF2EbnwIbo4pUFEOeZqwpiKpaFyS0KmLXiRx/9++TQ5/bsdpKmSeVZOWJL58oxbSGu9Id4YvBy9uEIw7j12RukI9k+B5AN1BZrYX/Bf+vjDu14QpAbU/MfLfTAuQOXx4I6pXJi4WtB3EH/T9vw8ydY88GJsGj4OPl/s5o+VOsXHU5F3wOkEqCFhw3BH+WuSd+OTl3oRzigApnNu4qImlMaXSEC/qdfpPcUGPZfCe4jPb4RCdFhZtLWOhGAl7YePfnet8mnWNlXhyW0pkdk7UGYS4g6gvPcNZh2sCU+35sp2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtgsvqEFlRc2z0mtLGeimkCZ+HpsyFir9s1PL08F5SM=;
 b=bDyGHeHV5+/xo6tWSPlrU8odbIwLRys6I67+6blxiSFDkUWqo7ZDDP3pnn4f0bDfVfJ9WBEJ5k57obiqKeQHkmVfmF7oIJ1Qb+2z9cx4ODvFdJSJxlCcaACFJCzSQ3DBXHr1Nv06yN6O4W5X9blvNKdlWYaL4JF6mven/DBrim5jWOzboqglwRTQU/7f12b2AAIDx6mBtojDT9Gue+lwvpWV0wfP7g1GsD3//Jay9wThQevbCHAAYKXlEIw96K+7Ej10madBO2mhtNUqdVatJqYJUNmY03JcQMCb0rRi0gzSd9stniPUqhCtA+b1YYP8+qcyZGGPkkfMCuDm9teCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtgsvqEFlRc2z0mtLGeimkCZ+HpsyFir9s1PL08F5SM=;
 b=i+pRpFt22VyaLWTLq1Dy+X2otsyKuXU8kCpcdsavTfUdXhs/DK1s+JI5ShGhr6uDU67tPNWxVeJiAqRY8xZWrMRi26G3jxk1T7utXkn5vT/9gQA7+jiIAZCDS7Aa6ZtVU5YvGOOBuV/mz/JmcfDank7dhBGLvvIy//0RcDl+FCE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v7 6/7] xen/arm: process pending vPCI map/unmap operations
Thread-Topic: [PATCH v7 6/7] xen/arm: process pending vPCI map/unmap
 operations
Thread-Index: AQHX4QlUdVJOt6s3PUOR8zkJihjiIawSjKuA
Date: Wed, 24 Nov 2021 11:35:26 +0000
Message-ID: <FB0E6553-0905-4CB5-840D-1D12D3D56BB7@arm.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-7-andr2000@gmail.com>
In-Reply-To: <20211124075942.2645445-7-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ccabda67-7c1e-424b-3198-08d9af3e88ee
x-ms-traffictypediagnostic: AM6PR08MB3653:|DBBPR08MB6011:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB60116FA8DCB83E033722055AFC619@DBBPR08MB6011.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:425;OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NaXOv2hLneXAD99YvFilEbUBSh4Ssikg1prLMmjTfN2s0M2yZzbgvimZCQ4wUBvHf5IX+CCuTU32qfQkBcGVrq3MdRdX/1fZR9IKEeFh/u8Ym0JqNQCah2zJs37TsSpRKgUMF97zUMZgI0P8gJa3zOIHQyvQraxDJGRVAOc1kFlZgduQh9Dy0YwFJbOQCgBcxTXQR+MuzDTXvmjtSpDWejhj/ozdOPV83to2+rpmatD7itTk+HVABdJsCA+hn+0MQrWRyjFG/p20qe+85emIGl9VNnjzgfbcKdV3xSbt9gIDSPyWK8LPoLHmUwmOkMwZuY49xwDfeILIDLP490Sp+fc6zOtHnz9938SZ39hdmxQg4qhfyNbMF1SE633DZZBygDxqCsHBJ7kBiJFJTwlfC8ZQL+Wc3EdgHHtqSg+dcz3Ihy3dBgH34tdVEy0lSPYx8UhR39Q+RTcRq4n+Q5fdHH1prvFKHxDzukk6rGSr1lIqSthdc7f0d7fKnfuSaxU+efXcVY/qwn/i2BOmUFE4EwOvGyAds1OTt73/sgLy5NGPLmwyltrL7mCK1WNvO0uFJKPuKwJL6jTd7SDo0vdD3AlbR3qcE7Y2aYA8bBovompiwWx7+9VPLR5xxSmOdvNXt7avcOg2YOo+KaqtEjQ1wA4tEFVEVrmpkc85IjmkE5+n00tS6fbRHTcUJoCx585kvMrzGRpQpvKoYvP0zr7kC/D+ikpsPtzwWK4kjpuiSOc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66446008)(66556008)(508600001)(36756003)(83380400001)(64756008)(66476007)(6486002)(316002)(91956017)(2906002)(54906003)(122000001)(7416002)(186003)(2616005)(38100700002)(26005)(8936002)(86362001)(33656002)(4326008)(5660300002)(6512007)(6506007)(53546011)(71200400001)(76116006)(38070700005)(6916009)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CFE1E3580D27504FBE27A9BEB2ED6845@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3653
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22e050fe-f4ee-4924-254e-08d9af3e82ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g0lT9dGrv4M4AT6vso7i7RFoM/wl9aPTxCibHEGBnta0Q6/hDl8DT4UnOy+ZYjW5UWU46utjjTNOd5R90P/cAcwfeIVyIBKoDn6oBMPHhOIlpqWMGKcuvg4Re99V5zosBBpKgyic8/WfrGDrfIch1SPIw5qWgYfCUCnLtTKTwsF02jjHkG+5b4R/7GZg5nMcZGQBJz6rn+kze2r9bTrlzbj+Ih4ILsa1yH/snqFPC1mlyByiIspSkhuYmtg1F5sRKSi1W0w53lW9kBhPfP4inWRxFTxNAlZEy/JcsTjseuyW3wiVvKhjGI9dkkDUinypaHokev863arV2owM07yjbVXmcdltoQtGC9ELOZzVQOuLMgLUiRD6FE/tFBKFDBNjnA+/Qay1pTv655FOqT5wplUzhC8L2CP2cGL3xI1RJhHpFE5R4W1uhVVNKhNeaxectV10L73OjH12oPGOieP3yszav5PVkwr5WTmExU2LgAs8e7MoyNsIekm9564hwV302yamPFyz3hVN0JYOilEuIpKfybxL1peOC5TokAup+EUG/8cuQNNKzbWDsqF+64iJv4qNLME0vKUyfMuB2yIu2HUWVbwaKXSVlshW4TdFknfM/NbcjvqzY/soivkEGpbyt9WJgaSzI4NhbgdlPgAuvKJDCnUGP8HCu9RdyaL1MZb8nu3W6fvozOTz8DVO+FRZW6gaFIU/kLlfNcB7CUb56g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(53546011)(82310400004)(356005)(107886003)(336012)(86362001)(83380400001)(6506007)(81166007)(2616005)(5660300002)(33656002)(6512007)(70586007)(2906002)(36756003)(70206006)(54906003)(47076005)(316002)(4326008)(186003)(26005)(36860700001)(8936002)(508600001)(8676002)(6862004)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 11:35:36.8671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccabda67-7c1e-424b-3198-08d9af3e88ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6011

Hi Oleksandr,

> On 24 Nov 2021, at 7:59 am, Oleksandr Andrushchenko <andr2000@gmail.com> =
wrote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> vPCI may map and unmap PCI device memory (BARs) being passed through whic=
h
> may take a lot of time. For this those operations may be deferred to be
> performed later, so that they can be safely preempted.
>=20
> Currently this deferred processing is happening in common IOREQ code
> which doesn't seem to be the right place for x86 and is even more
> doubtful because IOREQ may not be enabled for Arm at all.
> So, for Arm the pending vPCI work may have no chance to be executed
> if the processing is left as is in the common IOREQ code only.
> For that reason make vPCI processing happen in arch specific code.
>=20
> Please be aware that there are a few outstanding TODOs affecting this
> code path, see xen/drivers/vpci/header.c:map_range and
> xen/drivers/vpci/header.c:vpci_process_pending.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> [x86 part]
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
>=20
> Since v5:
> - check_for_vcpu_work: vPCI addition is moved before the
>   vcpu_ioreq__handle_completion(v). This is to avoid differences
>   with the x86 version. (Julien)
> Since v2:
> - update commit message with more insight on x86, IOREQ and Arm
> - restored order of invocation for IOREQ and vPCI processing (Jan)
> Since v1:
> - Moved the check for pending vpci work from the common IOREQ code
>   to hvm_do_resume on x86
> - Re-worked the code for Arm to ensure we don't miss pending vPCI work
> ---
> xen/arch/arm/traps.c   | 13 +++++++++++++
> xen/arch/x86/hvm/hvm.c |  6 ++++++
> xen/common/ioreq.c     |  9 ---------
> 3 files changed, 19 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 219ab3c3fbde..8757210a798b 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -34,6 +34,7 @@
> #include <xen/symbols.h>
> #include <xen/version.h>
> #include <xen/virtual_region.h>
> +#include <xen/vpci.h>
>=20
> #include <public/sched.h>
> #include <public/xen.h>
> @@ -2290,6 +2291,18 @@ static bool check_for_vcpu_work(void)
> {
>     struct vcpu *v =3D current;
>=20
> +    if ( has_vpci(v->domain) )
> +    {
> +        bool pending;
> +
> +        local_irq_enable();
> +        pending =3D vpci_process_pending(v);
> +        local_irq_disable();
> +
> +        if ( pending )
> +            return true;
> +    }
> +
> #ifdef CONFIG_IOREQ_SERVER
>     if ( domain_has_ioreq_server(v->domain) )
>     {
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index eee365711d63..096a61b7ea02 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -546,6 +546,12 @@ void hvm_do_resume(struct vcpu *v)
>=20
>     pt_restore_timer(v);
>=20
> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )
> +    {
> +        raise_softirq(SCHEDULE_SOFTIRQ);
> +        return;
> +    }
> +
>     if ( !vcpu_ioreq_handle_completion(v) )
>         return;
>=20
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index d732dc045df9..689d256544c8 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -25,9 +25,7 @@
> #include <xen/lib.h>
> #include <xen/paging.h>
> #include <xen/sched.h>
> -#include <xen/softirq.h>
> #include <xen/trace.h>
> -#include <xen/vpci.h>
>=20
> #include <asm/guest_atomics.h>
> #include <asm/ioreq.h>
> @@ -212,19 +210,12 @@ static bool wait_for_io(struct ioreq_vcpu *sv, iore=
q_t *p)
>=20
> bool vcpu_ioreq_handle_completion(struct vcpu *v)
> {
> -    struct domain *d =3D v->domain;
>     struct vcpu_io *vio =3D &v->io;
>     struct ioreq_server *s;
>     struct ioreq_vcpu *sv;
>     enum vio_completion completion;
>     bool res =3D true;
>=20
> -    if ( has_vpci(d) && vpci_process_pending(v) )
> -    {
> -        raise_softirq(SCHEDULE_SOFTIRQ);
> -        return false;
> -    }
> -
>     while ( (sv =3D get_pending_vcpu(v, &s)) !=3D NULL )
>         if ( !wait_for_io(sv, get_ioreq(s, v)) )
>             return false;
> --=20
> 2.25.1
>=20


