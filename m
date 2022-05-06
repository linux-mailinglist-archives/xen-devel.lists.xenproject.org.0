Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773FD51D6A8
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 13:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322947.544440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmw97-0001eu-Bu; Fri, 06 May 2022 11:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322947.544440; Fri, 06 May 2022 11:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmw97-0001bu-83; Fri, 06 May 2022 11:29:17 +0000
Received: by outflank-mailman (input) for mailman id 322947;
 Fri, 06 May 2022 11:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r0eQ=VO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nmw96-0001bn-5f
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 11:29:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c26f8bd6-cd2f-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 13:29:15 +0200 (CEST)
Received: from AS9PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::27) by AM0PR08MB3778.eurprd08.prod.outlook.com
 (2603:10a6:208:104::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 11:29:13 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::c8) by AS9PR0301CA0007.outlook.office365.com
 (2603:10a6:20b:468::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27 via Frontend
 Transport; Fri, 6 May 2022 11:29:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 11:29:13 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Fri, 06 May 2022 11:29:13 +0000
Received: from f869d83e6440.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 938EE3C6-F697-46BA-A842-E4D03FCFFCCE.1; 
 Fri, 06 May 2022 11:29:05 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f869d83e6440.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 May 2022 11:29:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB7637.eurprd08.prod.outlook.com (2603:10a6:10:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 6 May
 2022 11:28:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 11:28:55 +0000
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
X-Inumbo-ID: c26f8bd6-cd2f-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qzv6pV1iCNjVcJ4dJ/xpbCMGgodMUF2lWwEN1uPgVzNx582dBscXjDqzGs7+g6515gIL2IcNBJeU3H8CRhokbuu5X2R5ZMvsapXiNgMbPWRuIYndt4nAd5WfGXIJfUBEZJ1lguH9Hm73oaxECBjX6maX1o5ywqvBFqdvJcxRrhcccpBhYLn04NPn/nZqU6oqEV/vredocdyhnbBD/XlD8BMMdyK7vhL8Q5MRjgE0lgXh9xFfee/G8WlkWyFX8z5V1ZmQc6tUCgYWRYUJggoX33hg04AxyCePU9wsRrveZugq32x9HjUsKNZvxetBVA3iCmmVrFqDogAkye4Ao/d+0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFmDP+pUViBwraDsD59ZUeheKa7mldcdf1ksBNCJ9ZI=;
 b=kRhosTmdVz5ytMjpN/SHwhA7vvve6rztHWLF8KqVq4nS74hl0jXGKkmkQB8dbGmmo6szizqFim+6Ix+u9SZ5lHwARKgp8pWLJ1g7ctI565ATsFPQF9IGpLTGZv30Pu67zUKmwpuQuwA8U3s/ouC1Fmg3yg6JZgJiwLTIp7ReDzjNzLFe0A0lhIoLK4nGID44NZe9NfkON4exTQccU6XmukEnHDzuD+JQC+mDIs3bqniGTyiBImZxqhIEUnJusGQN48W9se/94OHLCCtJ/O6y5lTN5gqkkpRMCRM9u2RpZMUtzudbyHe9hnYqDOHXsvIpeRdts+XqorQvI4EvY9h2kw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFmDP+pUViBwraDsD59ZUeheKa7mldcdf1ksBNCJ9ZI=;
 b=hot+OkuLoPRAOwck3+y0F5lVP6RHTZJYxBIqsfitEyKTtwEvUOzntPEzbLky6ldaEDL0nalRUqSrp9yVwCeUEss7e78CV1qNY1+ECE17TipbH2RtFugEpunB1GdlbZ/C7uFxd+GX1i61pZTzmkGD1sXfxt/o7IeZvOqDvyvnGd0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 211cf9109fcd1cd5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPVnZH8Ovk2Okdnq1y7qftBOgSiHaymX5HNF1lDqPHkAHNQxjLb6+Zj+uWJvPlLuMr8wSb+ur4fiL7q8Oj4vitHEb7ownT1D76cCkBclqIuB7PpumRgN6BtGFMVcSqIYTymT3+fErO5Pk72sMW+QjNNGVmTUV44oBmPOkYyxlFvuDUWbhmSPRlbXksa1QlWDoETcNaIIWk8Ko15/9Vye1El94YW8ObMvZJHL92rzXq3fGVJD2APyHjAhCHdbzODbZwf59qodVz/1f10RtqbrjbdOObRIBlE9gXJa3LnAgdm2thoc7lOCaKF2gReFArpPRlXbNPCdrtI606tG9fYoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFmDP+pUViBwraDsD59ZUeheKa7mldcdf1ksBNCJ9ZI=;
 b=aAHdUs08tVpLbtD+y4+OyHUV1d7vsr/XVrOO5POqUlkladHIIAxA7gtIK1AJElA9qdOJg+dgGuipIW9zsCu7WdtkIc3Znh9T1iyKHF62juZVfCr84eaVNIsIDur63NYMHD8jca7t8eOz0zVr1zkewq7mlhzLCiz6ghulokdB1us7jiCZimKmdrCjTofuVAJqEbPcV2dmWxGVk1GfD5RgBmD5/TvWIjWY9X08gJ7n5Uw948CGG3hwk8Zeh4hWfCR5HDBtx0/y9Ad61T6MpmYDRb2nFggKmGGj/aKH2kda5XZmD4thBSrxeQE2UBveSWR62ZSFD++vodyW0nQzCwyqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFmDP+pUViBwraDsD59ZUeheKa7mldcdf1ksBNCJ9ZI=;
 b=hot+OkuLoPRAOwck3+y0F5lVP6RHTZJYxBIqsfitEyKTtwEvUOzntPEzbLky6ldaEDL0nalRUqSrp9yVwCeUEss7e78CV1qNY1+ECE17TipbH2RtFugEpunB1GdlbZ/C7uFxd+GX1i61pZTzmkGD1sXfxt/o7IeZvOqDvyvnGd0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] arm/its: enable LPIs before mapping the collection
 table
Thread-Topic: [PATCH v2] arm/its: enable LPIs before mapping the collection
 table
Thread-Index: AQHYX9qXT7uheGBkRkeP+IHSC5Nb6K0RuToA
Date: Fri, 6 May 2022 11:28:55 +0000
Message-ID: <0CE12746-697A-4005-8FD1-FE2546A8E018@arm.com>
References:
 <b19768d1db24123c76e50a410965582502937bb4.1651684160.git.rahul.singh@arm.com>
In-Reply-To:
 <b19768d1db24123c76e50a410965582502937bb4.1651684160.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7c885409-affb-4294-64f2-08da2f53a5a7
x-ms-traffictypediagnostic:
	DU0PR08MB7637:EE_|AM5EUR03FT060:EE_|AM0PR08MB3778:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3778D9F46B84ADFAE3555FEE9DC59@AM0PR08MB3778.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BnYgr9Czh3yzga5fknHsUy4JAhkMApEwXWjxIMXIzrYxguZ1/DrANrwMaKIQvknRGoVcM6Vn5yJ/SB7FR4dy6AG186lGhl6feIufrjzaJHu6aEKCIiNCqrJmmvxfnS4qQLGNKCAyzxKz2NwwHNmO31ZTY5f9cFq9v4eu0JxLblL9Gl0HdwbdMS6AjOmxN56sX+z+5l9nKYcRP1IEqsbUNcV9IDWt6CJZZdV6dlEurbEPrdgRlJ1NS2p/cQVgMB+obyhkmy0KXkLJ+YS1mGklJAlrUV+HCmHPjTUJLkUINv9LpoQgWwOJpZlwJWuNJCvPMdIZe3cnf1xOMKIWxnBq3qRi/D53ypKvbhom7f+7urKh771ufKF9yIIPi8BbaxE1UpEHXE/aFKEnyPfGlhkEpMJJkyLqXEKXuesf+ImjhXaBEOoibYcmTCwW2rTUyCFK9Hz1MCADfYv5xqs5qak8p8ZuiBELd8DJD9LflH+05Nal8+aaZug9invadBmGupHUGBEi/MXunVokMZ7WJn47ETkv2hotC1MXws1NHFKDF9RKTntVd/bmP6pjtxHFDnarBZ/gIogBVfpPYExiKXH5iM0LilN8tfMUya8C1dx/oDWgoABInfJPtBahkpOP+83EwhSvWHJOU8DwP9RHejqkRKxDvU1Y8ZofMWIwVrhKtWjeVczpjdXnaKulFIulfIUp1Ei0Dy++Lo4CzbTTjxUZCJNQmWGDC+5lX0bdmQfPedx/Upri/7BoRjO56UV8Fl2A
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6506007)(2906002)(6636002)(37006003)(83380400001)(2616005)(186003)(38100700002)(8936002)(26005)(6512007)(5660300002)(508600001)(54906003)(38070700005)(53546011)(71200400001)(33656002)(86362001)(91956017)(66946007)(66446008)(6486002)(66556008)(66476007)(76116006)(316002)(122000001)(8676002)(64756008)(6862004)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F210438D3CDAEB4EB3CF0B9022A54DBA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7637
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5af975a9-340d-41d3-d00b-08da2f539b09
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h9h+d3nXIpSUaWOmQM7qlohLBmn9+D9aZ5fe+sSlJ8fp0ru1PzvmbcjUS1Aa7RUQMs3pzAGpoy3RcFzSvo5IFmsCJmCGC0j28L0J/XkhvzWK4oK+FvThXDiDXbiJBWdsLA4jUyQzbATyVQdU8b98FzBR2KxMkllxz0rUp1/XBK279ywvmx0cLctloajSCK6V8OFUZjnBdKZ7iUbyWfOQgzVbem91Ger1RYveKjXbCkGew4DhAMBsvmOqFWSo2RN38nzP6GT/Qi1mfuDsywZQpjc+bjecVhW0IkpnuPotPYW0cRzRuwwrsbeCJTLLhLYtjwAzIgogP/9raXs9KcVWkNddH8uvFozgRbriGeOT300J5N71jVWwu4aYyniCfkkPVTf6/4LKd+N8nOwhBK/fVjvNyxyyFlWjHhO7juNkE6R9iq+SWN42gEOXc/wKTFvVOHXEdSC/NCTNNBdMWRcFTHKFiaaV1nP1+L9WgquG1rP4ifex+cS5cBlpG3JC4PiURH1XzxMJu8iU5FXvfzAfmzetoVUObj4btlCUpi6IDYBQganDkJKQl3dctWTRxxTMKorusZW7zFdTBiaMsmrYUtG3j6N7gNUFslY1eU/UYEOMumUk9R2gNyGIqm1Fnxva4PyDaaGHwB+W7+0E1PYyELAwhqkJRKCJ3zlkIRpCgNUER2LUXuWbYtTT+bb4Jfvv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6506007)(6512007)(81166007)(26005)(53546011)(316002)(6636002)(33656002)(2616005)(54906003)(37006003)(36860700001)(82310400005)(5660300002)(83380400001)(8936002)(186003)(336012)(47076005)(40460700003)(2906002)(107886003)(70206006)(86362001)(6862004)(4326008)(36756003)(70586007)(8676002)(6486002)(508600001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 11:29:13.3723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c885409-affb-4294-64f2-08da2f53a5a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3778

Hi Rahul,

> On 4 May 2022, at 18:15, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> When Xen boots on the platform that implements the GIC 600, ITS
> MAPC_LPI_OFF uncorrectable command error issue is observed.
>=20
> As per the GIC-600 TRM (Revision: r1p6) MAPC_LPI_OFF command error can
> be reported if the MAPC command has tried to map a collection to a core
> that does not have LPIs enabled. The definition of GICR.EnableLPIs
> also suggests enabling the LPIs before sending any ITS command that
> involves LPIs
>=20
> 0b0 LPI support is disabled. Any doorbell interrupt generated as a
>    result of a write to a virtual LPI register must be discarded,
>    and any ITS translation requests or commands involving LPIs in
>    this Redistributor are ignored.
>=20
> 0b1 LPI support is enabled.
>=20
> To fix the MAPC command error issue, enable the LPIs using
> GICR_CTLR.EnableLPIs before mapping the collection table.
>=20
> gicv3_enable_lpis() is using writel_relaxed(), write to the GICR_CTLR
> register may not be visible before gicv3_its_setup_collection() send the
> MAPC command. Use wmb() after writel_relaxed() to make sure register
> write to enable LPIs is visible.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


