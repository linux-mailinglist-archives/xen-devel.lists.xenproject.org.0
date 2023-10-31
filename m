Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56B97DD142
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625933.975738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrJp-0003Iu-GI; Tue, 31 Oct 2023 16:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625933.975738; Tue, 31 Oct 2023 16:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrJp-0003Ea-Bp; Tue, 31 Oct 2023 16:10:17 +0000
Received: by outflank-mailman (input) for mailman id 625933;
 Tue, 31 Oct 2023 16:10:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qxrJn-0001fV-1t
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:10:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8c9a41c-7807-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 17:10:13 +0100 (CET)
Received: from AS8PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:310::24)
 by AM9PR08MB6036.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Tue, 31 Oct
 2023 16:10:08 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:310:cafe::46) by AS8PR04CA0019.outlook.office365.com
 (2603:10a6:20b:310::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 16:10:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 16:10:07 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Tue, 31 Oct 2023 16:10:07 +0000
Received: from e096792777a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F49705D-5B89-4692-818C-A71B23906D41.1; 
 Tue, 31 Oct 2023 16:09:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e096792777a5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Oct 2023 16:09:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB5880.eurprd08.prod.outlook.com (2603:10a6:20b:29f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Tue, 31 Oct
 2023 16:09:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6933.022; Tue, 31 Oct 2023
 16:09:37 +0000
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
X-Inumbo-ID: f8c9a41c-7807-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bm0/nFVfi17AMEq4wZtmbQ2+nUtHXw7yp22K/GqqGMVtyhtpxpZnFZxz5jS+U+8gtjFOtoj7kkKZDcKtxbXA4WG09ja1o0uY9m/6obYZXOepR6lj7FkN2E9HdT6BzqAAgi84BazEh+VLW9mU9TeSoToKt9P2oLa2kKLADtAMs6Z1rLGiQ2ORaMyl0ri6I4WfiHHThGakm4+d9EYcMGHa/pzKBvD1GMC27i5RQnO9ctczWGvx5Rj9qlzRaLWy4rgIuwM7F8BWiYjMVRkr3wsdwX8LDlYguvr3WcqACx71YjUmpqsrN7KoKfhvUMSJ6tX8jtFBeykApg4781H3IAv3Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ogn2qguDU459bLM2RUMqQ02cp0tj6LgnX3ROnO6ECvk=;
 b=STgFybf7rHsrmFBuOvB4WFxqf12QLZ//l4eIZuX6T5xXp7+OgnVC7aXglhfdQFaw6U2eg/NoFcdejJsMEyw7loDnnnGil3+3oBuVyxJf4XXCCe7k6Ny246J1yywsN33mt79U2vOQ4DfMVXe4SV0c5G9f413B6SlJ3DuK98erqZ87c4lm4BBLkvgeNf5WzNXzMSKXOlYBrpHdSxXjPnFCH4qaql/DqdDMYA4UGW4d0oY5sr99vFCYuCAperjVaulfK2WsAbnNFixLNaAVh29j7+ozKYjlEhjQEf4GVz3InY4S6EbsDqcT4XhVP4KA0vtQCePBD62NO5U081apyV0LdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ogn2qguDU459bLM2RUMqQ02cp0tj6LgnX3ROnO6ECvk=;
 b=trzcbTFd2CGas+SGRwrYLiCOk9hdN9YKIIzbhVxAgZlU8p0YuXARQzMHf+egBwjENodT7/VC9fHHlrs0TARqbsU4NKJkTe2AaXe990aCzc/T/f41b34w98JysrVuImzL9QIJj4Z4wO/OAMkX5SeuIO/3w3K1Qhj5P51Kdch306Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 357b0ec83b6dc3e6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjDpQmNnGSWM+ktswEE35jcMYL7uc/WMvVmd8p0ZwqTnKut1eP4/JaprzR93yCMoVuh7yl5Aa+XWSmHmbugpdiW2cdDdRgUE6R57zvyck9fqdKAroDeixnShY4oeK6kDWWENRX6QdNO1JgTlrCFnRmCSoUhlmbODGJX/4V3vWT8dFe4dbxvJZUDsMCFgboZn+PpR3c/MLn6ysRVMzkpuJ0DYUq1/aq7WHn18iZvL0Jfs+h2TocpreJ7WihxFn4rRwNdP4bxy5E8N0ydHd3mJ0vxE1NwAywGD9pN7nVVQfpCNJlyTD1q5emrkCiCxeitrygG506fCynNT3pQsngb8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ogn2qguDU459bLM2RUMqQ02cp0tj6LgnX3ROnO6ECvk=;
 b=HwKZ+V5STGKuH///A8gurAhwOsVdWnoGdnPG7DphEBiF5RcMKDI6CcSRqzAsKHof0KL7UGEObQ3ZknVOOxDIbLyzavwz3k4jz2ISLTz26GBQz05kZyrBEvCpLNVpcp3x9oFpzCIwnVnYF1/BoJGGo13gu3qdhJt0sOE4ZUXTic4NzUY011P0+oHqyilmN0dvZ0HnsF6iNilab4VHyaYb6lChVFzgcXm7I0K1JbhuM3O5yqomL+/Fm5kThfbAponzGWo+B0pY2+C2lLmsiujCC+7CRKcEpxlZGcN78U7+XY08SjfmWQdyUZ7pTJqUqspEsL+/OTUMQLTvQDsC6okcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ogn2qguDU459bLM2RUMqQ02cp0tj6LgnX3ROnO6ECvk=;
 b=trzcbTFd2CGas+SGRwrYLiCOk9hdN9YKIIzbhVxAgZlU8p0YuXARQzMHf+egBwjENodT7/VC9fHHlrs0TARqbsU4NKJkTe2AaXe990aCzc/T/f41b34w98JysrVuImzL9QIJj4Z4wO/OAMkX5SeuIO/3w3K1Qhj5P51Kdch306Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, "ayan.kumar.halder@amd.com"
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Thread-Topic: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Thread-Index:
 AQHaC/4b2xNoaiIkmUiyfHAuabY8yrBj8OgAgAAP5gCAAACVgIAABCCAgAABQICAAAFcgIAACSOA
Date: Tue, 31 Oct 2023 16:09:37 +0000
Message-ID: <59AC50D8-CC8A-41E7-A0AB-A0984B86D111@arm.com>
References:
 <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com>
 <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org>
 <alpine.DEB.2.22.394.2310301544460.1625118@ubuntu-linux-20-04-desktop>
 <ee3c415d-bedd-432e-bf31-6e806b9cf976@xen.org>
 <DFC25ACE-FFBE-43CF-9CE2-90671D122CEC@arm.com>
 <2201cad3353f5deb567f929e91e90fd2@bugseng.com>
 <E0FA2717-D06B-4C51-9E9A-DBD72CE35963@arm.com>
 <e958d555-3075-467b-b3cf-1e5c6ad78405@xen.org>
 <F121A82D-3D86-4923-9E6E-C520F57E8DAA@arm.com>
 <2d6c4859-5cca-4cf2-b7f5-1068f0130c99@xen.org>
In-Reply-To: <2d6c4859-5cca-4cf2-b7f5-1068f0130c99@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB5880:EE_|AMS1EPF00000048:EE_|AM9PR08MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: bc618edc-5b03-4e5c-a2ba-08dbda2bd9be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QKggg4M4KkIXoHgK5ER/1MDvlqGffgVDlsapsaAcHRPSb7Fi/Irj1XyLuMmxUNtbTtbcXOlpP0fegNVwxhI1o+LXd8kUFx0/53Jngk1zMvuwK+Rru6Zj1yoJlLJu5FrkNoSmwNQriFgaUhQmc0Konaek2OIji2441habXmaLIMmZhyL3W/fto+J0YayAaYqYXqi5xfaFzT2hw+0A2uazZdqO0nJ8VYCSF4v8qwzPq13iHjeuiYvZ0iT+PIVtDxul6GkTPq2ahf/XAwp5n2gB3uC69rIafEw6qACtEPVIZuRScs02oAndaZyHjqkPfgvLOoyRqhP7okP/pQ+DvQ2/v1j+DJo+sA4M4gYNlaBxJysi6qWogOFUCFLvQJiQ6wX+2NPcszBHehMbWMtRyJidJpcPlTf/rvE1mrsyEi9aUEnBevkbREn/gaQnw+dfFiDmRHLrqd7ApvYLsXG1ZQk6s7jDhQOKlGVNpSlDkedP5+EDiqvn9uBWsmSbvAQ6ZhMwnSwGyDX8pDSiPiUFQuJ+wJa2cbmpbUpKEu5u24m7oicBP0JInSrv3eSD4CQIeTEUtfC2tPzFDJ3GOrpkSIUtwuVLKsvk12rkvES1FH5sb4Qjb1Ywjz53rQpq1eRI6Yv4xqP9g//UqTvr4Jvdvy5PXw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(122000001)(86362001)(8676002)(4326008)(8936002)(66556008)(66476007)(91956017)(5660300002)(76116006)(7416002)(66446008)(64756008)(54906003)(66946007)(6916009)(33656002)(316002)(38100700002)(36756003)(6486002)(2906002)(71200400001)(41300700001)(4001150100001)(478600001)(6506007)(6512007)(53546011)(2616005)(26005)(83380400001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A100809BA87BE14D94C27FE81705DD14@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5880
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf16855e-70a3-4370-0cea-08dbda2bc7d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nHFcHLmHwNlx5c7ykI1ErcG3L6rSUI8cT2oINLLdr+xDjTh4fV+lUdLrYwNy46Yo1ljTjAMWilj1bGvvCtzY577WmWwO7DQIqAwsFRXAZK+H5iBkWxh7OxgLjSiApdO9EJYGuybpBpA98F8N1EhVzL1fTb3EY78dNIBw8jlBzOJEV+Rp39gN7fORaqlRN7WL2F+ZtpIEeZeiKX6B64yVdEyclOrVfWghhpO1rePw4BU0/HgjT5USbpCTlrBrwJ5AxLknIuszXKEvnfVFM+DbonIumT0Grbww5D9mSXkDy1ZcvyPnc+qpup6k5tFQpqeRxtMXXIedfOHijlmLqJzCuALCXopOaAG0AxVBT+TIDLpCJGXI+acSAgh8PchFuTfBS6D7U6+XOfR/8i3QOv0UaWSZagqUGGg4Zc+1OUu9+Ld/MakxklnX1ldyKJd8W1cOI/cXuQVJvzGhbHfmkESboGP0ACqmhMISmnEiZ5s6B+Wyri8eaPKEHUOGjYFedr4RpH9hjmHIXFmdd/xgp2RZcQmISIEyFq+gS4ZQNTpNQqwVLNOQogy1HUogG/0V1Zh/ZcPpy+7KviFc+Cnm7aQUD0+NPCs6wI9I4Bk2bb5d/5hqnRldRLSiZ7vCOs+RAwcviW7VTNEXy0wzBhjGtaUehdNgEEVONLBXrhTYV3qUzy5wHYWnCKwtQ7+umbUdQT8+BTKtpXVZj+zXmSS+oTrOzdNpRZXG3jumCZEVXmA4CXs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(82310400011)(186009)(46966006)(40470700004)(36840700001)(54906003)(70206006)(316002)(41300700001)(8676002)(8936002)(6862004)(4326008)(478600001)(4001150100001)(70586007)(2906002)(5660300002)(6486002)(6506007)(40460700003)(53546011)(26005)(47076005)(83380400001)(36860700001)(36756003)(6512007)(2616005)(336012)(40480700001)(82740400003)(86362001)(356005)(33656002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 16:10:07.4030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc618edc-5b03-4e5c-a2ba-08dbda2bd9be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6036

DQoNCj4gT24gMzEgT2N0IDIwMjMsIGF0IDE1OjM2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMzEvMTAvMjAyMyAxNTozMiwgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+PiBPbiAzMSBPY3QgMjAyMywgYXQgMTU6MjcsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEhpLA0KPj4+IA0KPj4+IE9uIDMxLzEw
LzIwMjMgMTU6MTIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiBPbiAzMSBPY3QgMjAyMywg
YXQgMTU6MTAsIE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4gd3Jv
dGU6DQo+Pj4+PiANCj4+Pj4+IE9uIDIwMjMtMTAtMzEgMTU6MTMsIEx1Y2EgRmFuY2VsbHUgd3Jv
dGU6DQo+Pj4+Pj4+IE9uIDMxIE9jdCAyMDIzLCBhdCAxMzoyNywgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+IEhpIFN0ZWZhbm8sDQo+Pj4+Pj4+IE9uIDMwLzEw
LzIwMjMgMjI6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+Pj4+IE9uIE1vbiwg
MzAgT2N0IDIwMjMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+Pj4+PiBIaSBOaWNvbGEsDQo+
Pj4+Pj4+Pj4gT24gMjcvMTAvMjAyMyAxNjoxMSwgTmljb2xhIFZldHJpbmkgd3JvdGU6DQo+Pj4+
Pj4+Pj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0IGIvZG9jcy9taXNy
YS9kZXZpYXRpb25zLnJzdA0KPj4+Pj4+Pj4+PiBpbmRleCA4NTExYTE4OTI1M2IuLjhhYWFhMTQ3
M2ZiNCAxMDA2NDQNCj4+Pj4+Pj4+Pj4gLS0tIGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0K
Pj4+Pj4+Pj4+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4+Pj4+Pj4+IEBA
IC05MCw2ICs5MCwxMyBAQCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVz
Og0KPj4+Pj4+Pj4+PiAgICAgICAgICAgLSBfX2VtdWxhdGVfMm9wIGFuZCBfX2VtdWxhdGVfMm9w
X25vYnl0ZQ0KPj4+Pj4+Pj4+PiAgICAgICAgICAgLSByZWFkX2RlYnVncmVnIGFuZCB3cml0ZV9k
ZWJ1Z3JlZw0KPj4+Pj4+Pj4+PiAgKyAgICogLSBSNy4xDQo+Pj4+Pj4+Pj4+ICsgICAgIC0gSXQg
aXMgc2FmZSB0byB1c2UgY2VydGFpbiBvY3RhbCBjb25zdGFudHMgdGhlIHdheSB0aGV5IGFyZSBk
ZWZpbmVkDQo+Pj4+Pj4+Pj4+ICsgICAgICAgaW4gc3BlY2lmaWNhdGlvbnMsIG1hbnVhbHMsIGFu
ZCBhbGdvcml0aG0gZGVzY3JpcHRpb25zLiBTdWNoIHBsYWNlcw0KPj4+Pj4+Pj4+PiArICAgICAg
IGFyZSBtYXJrZWQgc2FmZSB3aXRoIGEgL1wqIG9jdGFsLW9rIFwqLyBpbi1jb2RlIGNvbW1lbnQs
IG9yIHdpdGggYQ0KPj4+Pj4+Pj4+PiBTQUYNCj4+Pj4+Pj4+Pj4gKyAgICAgICBjb21tZW50IChz
ZWUgc2FmZS5qc29uKS4NCj4+Pj4+Pj4+PiBSZWFkaW5nIHRoaXMsIGl0IGlzIHVuY2xlYXIgdG8g
bWUgd2h5IHdlIGhhdmUgdHdvIHdheXMgdG8gZGV2aWF0ZSB0aGUgcnVsZQ0KPj4+Pj4+Pj4+IHI3
LjEuIEFuZCBtb3JlIGltcG9ydGFudGVseSwgaG93IHdvdWxkIHRoZSBkZXZlbG9wcGVyIGRlY2lk
ZSB3aGljaCBvbmUgdG8gdXNlPw0KPj4+Pj4+Pj4gSSBhZ3JlZSB3aXRoIHlvdSBvbiB0aGlzIGFu
ZCB3ZSB3ZXJlIGRpc2N1c3NpbmcgdGhpcyB0b3BpYyBqdXN0IHRoaXMNCj4+Pj4+Pj4+IG1vcm5p
bmcgaW4gdGhlIEZVU0EgY29tbXVuaXR5IGNhbGwuIEkgdGhpbmsgd2UgbmVlZCBhIHdheSB0byBk
byB0aGlzDQo+Pj4+Pj4+PiB3aXRoIHRoZSBTQUYgZnJhbWV3b3JrOg0KPj4+Pj4+Pj4gaWYgKHNv
bWUgY29kZSB3aXRoIHZpb2xhdGlvbikgLyogU0FGLXh4LXNhZmUgKi8NCj4+Pj4+Pj4+IFRoaXMg
ZG9lc24ndCB3b3JrIHRvZGF5IHVuZm9ydHVuYXRlbHkuIEl0IGNhbiBvbmx5IGJlIGRvbmUgdGhp
cyB3YXk6DQo+Pj4+Pj4+PiAvKiBTQUYteHgtc2FmZSAqLw0KPj4+Pj4+Pj4gaWYgKHNvbWUgY29k
ZSB3aXRoIHZpb2xhdGlvbikNCj4+Pj4+Pj4+IFdoaWNoIGlzIG5vdCBhbHdheXMgZGVzaXJhYmxl
LiBvY3RhbC1vayBpcyBqdXN0IGFuIGFkLWhvYyBzb2x1dGlvbiBmb3INCj4+Pj4+Pj4+IG9uZSBz
cGVjaWZpYyB2aW9sYXRpb24gYnV0IHdlIG5lZWQgYSBnZW5lcmljIHdheSB0byBkbyB0aGlzLiBM
dWNhIGlzDQo+Pj4+Pj4+PiBpbnZlc3RpZ2F0aW5nIHBvc3NpYmxlIHdheXMgdG8gc3VwcG9ydCB0
aGUgcHJldmlvdXMgZm9ybWF0IGluIFNBRi4NCj4+Pj4+Pj4gV2h5IGNhbid0IHdlIHVzZSBvY3Rh
bC1vayBldmVyeXdoZXJlIGZvciBub3c/IE15IHBvaW50IGhlcmUgaXMgdG8gbWFrZSBzaW1wbGUg
Zm9yIHRoZSBkZXZlbG9wcGVyIHRvIGtub3cgd2hhdCB0byB1c2UuDQo+Pj4+Pj4+PiBJIHRoaW5r
IHdlIHNob3VsZCB0YWtlIHRoaXMgcGF0Y2ggZm9yIG5vdyBhbmQgaGFybW9uaXplIGl0IG9uY2Ug
U0FGIGlzDQo+Pj4+Pj4+PiBpbXByb3ZlZC4NCj4+Pj4+Pj4gVGhlIGRlc2NyaXB0aW9uIG9mIHRo
ZSBkZXZpYXRpb24gbmVlZHMgc29tZSBpbXByb3ZlbWVudC4gVG8gZ2l2ZSBhbiBleGFtcGxlLCB3
aXRoIHRoZSBjdXJyZW50IHdvcmRpbmcsIG9uZSBjb3VsZCB0aGV5IGNhbiB1c2Ugb2N0YWwtb2sg
ZXZlcnl3aGVyZS4gQnV0IGFib3ZlLCB5b3UgYXJlIGltcGx5aW5nIHRoYXQgU0FGLXh4LXNhZmUg
c2hvdWxkIGJlDQo+Pj4+Pj4+IHByZWZlcnJlZC4NCj4+Pj4+Pj4gSSB3b3VsZCBzdGlsbCBzdHJv
bmdseSBwcmVmZXIgaWYgd2UgdXNlIG9jdGFsLW9rIGV2ZXJ5d2hlcmUgYmVjYXVzZSB0aGlzIGlz
IHNpbXBsZSB0byByZW1lbWJlci4gQnV0IGlmIHRoZSBvdGhlciBhcmUgaGFwcHkgdG8gaGF2ZSBi
b3RoIFNBRi1YWCBhbmQgb2N0YWwtb2ssIHRoZW4gdGhlIGRlc2NyaXB0aW9uIG5lZWRzIHRvIGJl
IGNvbXBsZXRlbHkgdW5hbWJpZ3VvdXMgYW5kIHRoZSBwYXRjaCBzaG91bGQgY29udGFpbiBzb21l
IGV4cGxhbmF0aW9uIHdoeSB3ZSBoYXZlIHR3byBkaWZmZXJlbnQgd2F5cyB0byBkZXZpYXRlLg0K
Pj4+Pj4+IFdvdWxkIGl0IGJlIG9rIHRvIGhhdmUgYm90aCwgZm9yIGV4YW1wbGU6IC8qIFNBRi1Y
WC1zYWZlIG9jdGFsLW9rICovDQo+Pj4+Pj4gU28gdGhhdCB0aGUgc3VwcHJlc3Npb24gZW5naW5l
IGRvIHdoYXQgaXQgc2hvdWxkIChjdXJyZW50bHkgaXQgZG9lc27igJl0IHN1cHByZXNzIHRoZSBz
YW1lIGxpbmUsIGJ1dCB3ZSBjb3VsZCBkbyBzb21ldGhpbmcgYWJvdXQgaXQpIGFuZCB0aGUgZGV2
ZWxvcGVyDQo+Pj4+Pj4gaGFzIGEgd2F5IHRvIHVuZGVyc3RhbmQgd2hhdCBpcyB0aGUgdmlvbGF0
aW9uIGhlcmUgd2l0aG91dCBnb2luZyB0byB0aGUganVzdGlmaWNhdGlvbiBkYXRhYmFzZS4NCj4+
Pj4+IA0KPj4+Pj4gSSBndWVzcy4gSXQgY291bGQgb3ZlcmZsb3cgdGhlIDgwLWNoYXIgbGltaXQg
aW4geGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmgsIHRob3VnaC4NCj4+Pj4gWWVhaCwgYnV0IHdl
IGNvdWxkIHJ1bGUgb3V0IHNvbWV0aGluZyBpbiBjb2RlX3N0eWxlIHRvIGFsbG93IG9ubHkgdGhp
cyBraW5kIG9mIHRyYWlsaW5nIGNvbW1lbnRzIHRvIGV4Y2VlZCB0aGUgODAgY2hhcnMNCj4+PiAN
Cj4+PiBJbiB0aGUgcGFzdCBJIGV4cHJlc3NlZCBjb25jZXJuZWQgd2l0aCB0aGlzIGtpbmQgb2Yg
dGhlIHJ1bGUgYmVjYXVzZSBpdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgaG93IGFuIGF1dG9tYXRp
YyBmb3JtYXR0ZXIgd2lsbCBiZSBhYmxlIHRvIGNoZWNrIGl0Lg0KPj4+IA0KPj4+IENhbiB5b3Ug
Y2xhcmlmeSB3aGV0aGVyIGNsYW5nLWZvcm1hdCB3b3VsZCBiZSBhYmxlIHRvIGhhbmRsZSB5b3Vy
IHByb3Bvc2VkIHJ1bGU/DQo+PiBTbywgeWVzdGVyZGF5IEJlcnRyYW5kIHBvaW50ZWQgb3V0IGEg
U3RhY2tPdmVyZmxvdyB0aHJlYWQgZm9yIHRoaXMgaXNzdWUgYW5kIGlmIHdlIHVzZSBSZWZsb3dD
b21tZW50czogZmFsc2Ugd2Ugc2hvdWxkDQo+PiBiZSBhYmxlIHRvIGxldCB0aGUgbGluZSBhcyBp
dCBpcyAobm90IHRlc3RlZCkuDQo+IA0KPiBXb3VsZG4ndCB0aGF0IHByZXZlbnQgcmVmbG93IGZv
ciBhbGwgdGhlIGNvbW1lbnRzPyBJZiBzbywgSSBkb24ndCB0aGluayB0aGlzIGlzIHdlIHdhbnQu
IEluc3RlYWQsIHdlIHdhbnQgdG8gYWxsb3cgcmVmbG93IGZvciBhbnkgY29tbWVudHMgYnV0IHRo
ZSBvbmUgZG9uZSBhdCB0aGUgZW5kIG9mIHRoZSBsaW5lLg0KDQpPayB3ZWxsLCBJIHdhcyBvcHRp
bWlzdGljLCBpbiByZWFsaXR5IHdpdGggdGhlIG9wdGlvbiBhcyBmYWxzZSwgaXQgd291bGQgYW55
d2F5IHJlZmxvdyB0aGUgbGluZSBsZWF2aW5nIHRoZSBjb21tZW50IHVudG91Y2hlZC4NCg0KRS5n
LiBmcm9tIHRoaXM6DQoNCiAgICAgICAgaWYgKCBtb2RybV9tb2QgPT0gTUFTS19FWFRSKGluc3Ry
X21vZHJtLCAwMzAwKSAmJiAvKiBTQUYtMi1zYWZlIG9jdGFsLW9rICovDQogICAgICAgICAgICAg
KG1vZHJtX3JlZyAmIDcpID09IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDA3MCkgJiYgLyogU0FG
LTItc2FmZSBvY3RhbC1vayAqLw0KICAgICAgICAgICAgIChtb2RybV9ybSAmIDcpID09IE1BU0tf
RVhUUihpbnN0cl9tb2RybSwgMDAwNykgKSAvKiBTQUYtMi1zYWZlIG9jdGFsLW9rICovDQogICAg
ICAgICAgICByZXR1cm4gZW11bF9sZW47DQoNClRvIHRoaXM6DQoNCiAgICAgICAgaWYgKCBtb2Ry
bV9tb2QgPT0NCiAgICAgICAgICAgICAgICAgTUFTS19FWFRSKGluc3RyX21vZHJtLCAwMzAwKSAm
JiAvKiBTQUYtMi1zYWZlIG9jdGFsLW9rICovDQogICAgICAgICAgICAgKG1vZHJtX3JlZyAmIDcp
ID09DQogICAgICAgICAgICAgICAgIE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDA3MCkgJiYgLyog
U0FGLTItc2FmZSBvY3RhbC1vayAqLw0KICAgICAgICAgICAgIChtb2RybV9ybSAmIDcpID09DQog
ICAgICAgICAgICAgICAgIE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDAwNykgKSAvKiBTQUYtMi1z
YWZlIG9jdGFsLW9rICovDQogICAgICAgICAgICByZXR1cm4gZW11bF9sZW47DQoNCi4uLiBzaWdo
Li4uDQoNCg0KDQoNCg==

