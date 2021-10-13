Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EFE42C3F6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208590.364776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafag-0004cw-6r; Wed, 13 Oct 2021 14:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208590.364776; Wed, 13 Oct 2021 14:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafag-0004a8-2W; Wed, 13 Oct 2021 14:50:46 +0000
Received: by outflank-mailman (input) for mailman id 208590;
 Wed, 13 Oct 2021 14:50:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kt2p=PB=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mafae-0004a2-O3
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:50:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f015d2d8-2c34-11ec-817c-12813bfff9fa;
 Wed, 13 Oct 2021 14:50:42 +0000 (UTC)
Received: from AM6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::18)
 by PAXPR08MB7317.eurprd08.prod.outlook.com (2603:10a6:102:230::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Wed, 13 Oct
 2021 14:50:40 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::c8) by AM6P191CA0005.outlook.office365.com
 (2603:10a6:209:8b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 14:50:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Wed, 13 Oct 2021 14:50:39 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Wed, 13 Oct 2021 14:50:39 +0000
Received: from bcdf1e605cd0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6AC65D4-3B75-44B0-A6C9-E8DB2C72BB6C.1; 
 Wed, 13 Oct 2021 14:50:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bcdf1e605cd0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Oct 2021 14:50:32 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5820.eurprd08.prod.outlook.com (2603:10a6:102:90::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 14:50:30 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.030; Wed, 13 Oct 2021
 14:50:29 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Wed, 13 Oct 2021 14:50:28 +0000
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
X-Inumbo-ID: f015d2d8-2c34-11ec-817c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwcp5+e+B8k35c/ETyIx9NvW5bJ/wHOu5HUy3PMic94=;
 b=MhLhMKndFEBNaJOUezXlZrv7jQuyf9GGsVuE7fs3HAXlLtMhKAmdL2M7cqOVP2ehJJJBojXM4GejzIAYowkh21IHWsktFDNklQkBWnKLQ/EvfK44+YNnWNoXM4lmlD7/CBkc/ktsrcSyDxFXnl4Igx5boxFf5ZIlyOBkx23Q6cI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea3d25e5a4ea05fa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fim+ZR+Q3Ci1YWurGQpKapEikkMdtbTPkVakNdb7/s3aZY53dJ8j5wVpx7rANvLQN3RkrHRUHgIahE41koz97+peaGVnoggw8XdvftYSjCS185ldT3Ahx/ZZ/7Xr1dqBSioieus05fRTD3h0e5xiq6wgCcTcxXJJLmT7X1jb7N5KNRPXrR/Pc0IubWtEL57wgWe8Tx0/bTzv/QFJ+9uvunnwNaJsav6LMmTGJhXOrKPdW7yt8h8YO64yPvsgMwwdV2UaWf0di/nXa5hJUtoZEKrzuIT6Mob90zGY58gvlGRP8FewkFBnRkblcoChx7nHwVwuorv1bVFGzunSiiWgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwcp5+e+B8k35c/ETyIx9NvW5bJ/wHOu5HUy3PMic94=;
 b=kwBcse/qsjN3aiXtXMp/nvOswKVZrXrg8G5toKic7OAlR8nY3k4hHxoMYAlFukfdI8h41+VLU+I2GRSf3DFRra6fsVQiFToHZsP54ufbcKUEs4G3VNPKeJjSM+tD/EejoFRIXwrJjcz6E9qDsTzAKOXe5/fnuX+rIFdJox7zQmP08AZU1LmdiMLJMpppyfYh8j1abRp9gRgfYqlWwQ0V8RbHRSXmMCUxqlFd41BFAa8kymePNakWTiDdBOH3ZWX0CjBTlCtI9QJlk8nKqWjPyr7Y1p5lVrbU7p3k734nLutK7EvWZg3xJPOeJBWwg6dXv5ZoVleGMM0iKVxu2HFkLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwcp5+e+B8k35c/ETyIx9NvW5bJ/wHOu5HUy3PMic94=;
 b=MhLhMKndFEBNaJOUezXlZrv7jQuyf9GGsVuE7fs3HAXlLtMhKAmdL2M7cqOVP2ehJJJBojXM4GejzIAYowkh21IHWsktFDNklQkBWnKLQ/EvfK44+YNnWNoXM4lmlD7/CBkc/ktsrcSyDxFXnl4Igx5boxFf5ZIlyOBkx23Q6cI=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] arm/docs: Clarify legacy DT bindings on UEFI
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <ea6fa013-809b-f946-76d8-5314b45d6f17@xen.org>
Date: Wed, 13 Oct 2021 15:50:22 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1D36194-81AC-41A6-8EC7-E599DB8D4C5A@arm.com>
References: <20211013121929.30784-1-luca.fancellu@arm.com>
 <a31231e3-a1eb-0e1f-59b8-75677d5db51b@xen.org>
 <363EAF93-1165-4515-A582-B40B6115FA71@arm.com>
 <ea6fa013-809b-f946-76d8-5314b45d6f17@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89fd115b-1d4b-4b19-14a7-08d98e58d2e9
X-MS-TrafficTypeDiagnostic: PR3PR08MB5820:|PAXPR08MB7317:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB73171E5315F5ABB4A978DD6CE4B79@PAXPR08MB7317.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NfZ85cXXWcnCBAONwQYyUJohaioAeHrM90iy+r2TMJQ5iLgbLxwcjziT4yx8pDUqjoNUgGK8TW/tdpqS3qBtWKYzP9aP/Nz3wiUubolgWUZu+EV5CdcsqSzp0cXMZC296pD1HdTBdIeKNtFR+uc8NvFf3dN17TgGyLbKtv97OLm36sAgcu4vwydfWHBxi3AW2Vm/jeV9EbR4ioDbqwIQj8eeumnvmneM3JSoIyt0d7NYwatcsGZ6dLDSaRt8pr+wd/YFliMk2cb/MaAnYD/FZJkeXujYKdvqGz8yhVLj7fGWyTBh5euFH+t36q9L5S1DrusSsTQqkCIsK0ABVawbocCMaNzoNMLCfRX0vrswX0rgntgXiCQ76QOaNXXsNJaVDaLUSQqffAhANYOobBdrQm9ZZ3eBfduKoNQxh2y5AVXFDxfceHOIPPH84nrYTmH4aCgG9HM5s2FkNLbx0m+WAOIZT/ZM2H9LRfOiK+DtUE9oUgTdLmtPKAXaxLj0TRVyfrpeDEDBetPfSQbRuSZu6SXM2awADinCZLL0tsx3T3ud5XaI1vFYZQPJJaI+ZIlKoHDnyv30Zb2wI1cFhJR8cYrwA2mauGknEhQcPEycpQx5/GOScmlX2A16VV558dgwIr5gfHxMFjFQakk6bGe4yuWRWTNI7HXLr61Rlaf/PTgR7OvK1avd1Zsmq+38zYTD5HR+ZAed1ma303HgeO+gEjkOeEywZKuUF/NgWPm5B2Ijx/7FS08itEnfTFkZSN46
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6666004)(6916009)(2906002)(5660300002)(66946007)(6506007)(53546011)(44832011)(6512007)(52116002)(8936002)(66476007)(66556008)(186003)(26005)(8676002)(316002)(54906003)(33656002)(86362001)(38100700002)(38350700002)(508600001)(956004)(2616005)(36756003)(83380400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5820
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	77f17a76-f9d0-4c35-11cb-08d98e58cca1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GRG00jnphMiyEpleeuRRzQ3HE2CVdqKkLotoxfIxJniDhSiAq60qDz522I8Ycgrf8kMZpFn03scIsjkFkWxq/sJp7OBcawzK8xjfAOGn+YH/FCUKyvez4zKovUcEol4Irhpao/P0fXbAaBJtpL+g7GSRwva4BalXzIyHahSJD8PS6MAcgpZIoYPXCiXu5MVb/V2MTzAYMejPNcVQg2UwyxuFMtW9RVt4RPsSkzj3cfz1jzYqPN2PaRq9UioVLRu7YnS9WwThIRmPDtB/nbIcbFRBSDLhiAJRq0GGK7NOm/j0kPjw2dFGFeHxJ6v+7/KAOupIEUGagzeCzAUPWg+sAFZovJnBpJld2a3/oDLPWgyFzXO8jxrJYEuRpYRfEDkVm5wrMwwAr2Mq+t9+Cb8amk4/ZNFZ6X2HVlEhv8ENE6d3LTmeh3QBkbFsV+/YyfgTIdUrxR4dLKOgUjFmGVD4+DlFdi+ja7FR7zTu0rW0UkMjIdVdWp3kraxzjBRHOM3BNmOJPRUH3ihIaZVFgwthXzIBEnH4c6XE6NAXNcwDNLTInL2Dy3cQKUQ5n27gXoR/JmY6miwox5Btf3mNRN3XbKK3ErkZMDt/MRwOfOlgm+89qhJm01Q2JNKTR3Spo9TvDgdhIcG27XDefT0GgL7+5PVOER1zW1+xTUELDTyxzAuLbIt5NwrYGLVQm+amUmE1X2xQHYoSQOAERFKD+kJXag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(8936002)(956004)(83380400001)(186003)(82310400003)(36860700001)(8676002)(5660300002)(6666004)(107886003)(6506007)(508600001)(36756003)(53546011)(2616005)(47076005)(2906002)(86362001)(33656002)(54906003)(6486002)(6512007)(44832011)(316002)(336012)(70206006)(356005)(4326008)(6862004)(81166007)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 14:50:39.5003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fd115b-1d4b-4b19-14a7-08d98e58d2e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7317



> On 13 Oct 2021, at 15:30, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 13/10/2021 15:06, Luca Fancellu wrote:
>>> On 13 Oct 2021, at 14:27, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Luca,
>>>=20
>>> On 13/10/2021 13:19, Luca Fancellu wrote:
>>>> Legacy compatible strings for dom0 modules are not
>>>> supported when booting using UEFI, the documentation
>>>> doesn't mention that.
>>>=20
>>> Can you add a summary in the commit message why we consider the legacy =
binding is not supported?
>> Yes what about:
>> Since the introduction of UEFI boot for Xen, the legacy
>> compatible strings were not supported and the stub code
>> was checking only the presence of =E2=80=9Cmultiboot,module=E2=80=9D to
>> require the Xen UEFI configuration file or not.
>> The documentation was not updated to specify that behavior.
>> Add a phrase to docs/misc/arm/device-tree/booting.txt
>> to clarify it.
>=20
> Sounds good to me. You can add my ack on it:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> Would you be able to respin the patch with the two changes?

Yes I will, thank you.

Cheers,
Luca

>=20
>>>=20
>>>> Add a phrase to docs/misc/arm/device-tree/booting.txt
>>>> to clarify it.
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>>  docs/misc/arm/device-tree/booting.txt | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/dev=
ice-tree/booting.txt
>>>> index c6a775f4e8..017c0f13eb 100644
>>>> --- a/docs/misc/arm/device-tree/booting.txt
>>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>>> @@ -51,6 +51,8 @@ Each node contains the following properties:
>>>>  	Xen 4.4 supported a different set of legacy compatible strings
>>>>  	which remain supported such that systems supporting both 4.4
>>>>  	and later can use a single DTB.
>>>> +	However when booting Xen using UEFI and Device Tree, the legacy
>>>=20
>>> NIT: I would drop "and Device Tree" because this feels a bit redundant =
as this compatible can only be used in the Device-Tree.
>> I will drop it
>>>=20
>>>> +	compatible strings are not supported.
>>>>    	- "xen,multiboot-module" equivalent to "multiboot,module"
>>>>  	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
>>>=20
>>> Cheers,
>>>=20
>>> --=20
>>> Julien Grall
>=20
> Cheers,
>=20
> --=20
> Julien Grall


