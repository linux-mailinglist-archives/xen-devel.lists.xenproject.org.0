Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710FC5573F0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354465.581573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HGs-0007Sk-7G; Thu, 23 Jun 2022 07:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354465.581573; Thu, 23 Jun 2022 07:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HGs-0007QG-3t; Thu, 23 Jun 2022 07:28:58 +0000
Received: by outflank-mailman (input) for mailman id 354465;
 Thu, 23 Jun 2022 07:28:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aspq=W6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o4HGr-0007QA-6l
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:28:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70074.outbound.protection.outlook.com [40.107.7.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23fac311-f2c6-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 09:28:56 +0200 (CEST)
Received: from DB6PR0201CA0009.eurprd02.prod.outlook.com (2603:10a6:4:3f::19)
 by AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 07:28:53 +0000
Received: from DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::18) by DB6PR0201CA0009.outlook.office365.com
 (2603:10a6:4:3f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Thu, 23 Jun 2022 07:28:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT056.mail.protection.outlook.com (100.127.142.88) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 07:28:53 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Thu, 23 Jun 2022 07:28:52 +0000
Received: from f7be18b06458.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1920B1DE-94C7-4FB3-B2E6-BBA7A1EDD0C5.1; 
 Thu, 23 Jun 2022 07:28:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7be18b06458.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Jun 2022 07:28:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5319.eurprd08.prod.outlook.com (2603:10a6:20b:dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 23 Jun
 2022 07:28:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:28:43 +0000
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
X-Inumbo-ID: 23fac311-f2c6-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dRP0eEd5zBRGeA9VoQOyn4JlYqTII/0yA/EZpvqLArcLLBI3QCSiKs17ijxqhTU3mRVcyX2L1FWI+Z25nq/y4qizRyH6f6rMSqvqtT6A/tWNusq/e6JtUseZtCwISVKHPNB8lCcgrWgmYgH946OaEvLqTwl0zIi2WGfT9JvLZ9xwOh4gef+6ZnsiwUL/PAiBCAVCi0doJ1zYQv4hY5Yzos2syR8EguhWD0PCRGDne/UTIUnuZaz+L2Nl91kVP09Xech4e+mgth+NbIdGlDq9+AE7HNIPmKqYT/vuXOo9UMKNwNc/Dfdefnx2L5AKVvAJWb0UO+FpQzCdYzZgRr8zSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2ynpdqnA17p//ZIIwi5zlfvptLNFe7iUYUZOX7A33k=;
 b=VmJGm20jWb5EppsBCTxwM1b6TntRemP7g9b54OCCVAbLA0DUxwZxev59m/Fph4GH0R0/HrwZq0s3D0fxpwhMMeN6OSyBPU7J2q22LREC4/IYGKfq2gd9lyrYI9r9MIcrrGBdvqyHw0p/7yPePwhO1HRYFmJrTIG0QzdEE8gN55NrwxVE/6cmTq2PxOQQIHqQO/RVfVT9/1V26T7YT+P+B6fv+dIsUkH+wtn/l9BJ5PYa1krfqVY/aKbh1KhyFJN/w5Hl1NIColIgLLNhvfOc+7QgOzXVyisTjPXxnvCyTjafGU+U25YZ0OrMFdH+i6InoGa3zsPBmAa9xSrfTDT/ww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2ynpdqnA17p//ZIIwi5zlfvptLNFe7iUYUZOX7A33k=;
 b=mxbiaIchI7buuar3UKA4TFVhFyzNjP/Dhg3qxxZ6MsjC5qcU1n/Fk43ANiKIWv9FudTsA+HeISk+eaIk4zXiLRPzsApbMsYeAJnHiL1IQPRzFDye/W5Z8c/B5kmK7lfhiVrOo9IAdEtlgm8KBjWqmlMMWBXl9gMMVCMCbogto2I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1dbeb9f98070b095
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDPQBql9p0hQCQt40EB7QwhrqsZEUTKlrHJ8ue7NfwCNMLg7+biek2gndd7vPME/0edqfuuu5BzXq9U4GyTmuRePmKcLQbtuBXJk0LGBBw0FYQyJm+3ranHk/QYFtDj2/Rc+H4iJTU6lNfPCicD9jVepUK1PTGkIV+6t1WfX2yBM5LB9fphse4vD68/v3J23bRJCWr0a++CNUMC1/GVsH1z0/zuONmDzuRH2S76PXIAlvSxTijDAcv9Te9K5w3oeqZZoQ2Zd8bhZL2o+SCEDPvzV+PStDIvSUFYUnuPq27Cj3koyZFdNa7NJ+iz2Ev//OJO4hvHL2HLIzBdMG2CqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2ynpdqnA17p//ZIIwi5zlfvptLNFe7iUYUZOX7A33k=;
 b=dvm8klWj9SYmzsJNWpzzclbbHqQOvtpaMOt04CDd8KI7VSSlxL7cTDXSqjrCE6rft202K8tgEJgAieyuqLfXKejkeTeFMPeDPqBFetAF5qHGwAyUjFuQzDk+ASWFxdszc//Nwm7wGaIBeNAv0bTdMKKhZV/RXNi3btne9ef462cUp0ay6BaoIkEEPtY3sOR9jYQB6vK5x9Uwkj0B/2IpBqp56XH+ExIyn6TCyE6fGkDEsSU+3jxIRtDXUhrqseCr4/xLqRMy3lajfHGEgMglwVDDLXBMamSzCk4KpCb304Gyq3Mts6QIIuzXM+D+aBERuG9qEQ4plRGdN1F7UgmGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2ynpdqnA17p//ZIIwi5zlfvptLNFe7iUYUZOX7A33k=;
 b=mxbiaIchI7buuar3UKA4TFVhFyzNjP/Dhg3qxxZ6MsjC5qcU1n/Fk43ANiKIWv9FudTsA+HeISk+eaIk4zXiLRPzsApbMsYeAJnHiL1IQPRzFDye/W5Z8c/B5kmK7lfhiVrOo9IAdEtlgm8KBjWqmlMMWBXl9gMMVCMCbogto2I=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<Michal.Orzel@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Daniel Smith
	<dpsmith@apertussolutions.com>, Roger Pau Monne <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: XTF-on-ARM: Bugs
Thread-Topic: XTF-on-ARM: Bugs
Thread-Index:
 AQHYhWH1+fjNtvukV0adEqGEdTB7sq1ZxCsAgAAXIgCAAAnTAIAAf4aAgAD4xwCAAEImgIAAAyaAgABEQYCAALP9gA==
Date: Thu, 23 Jun 2022 07:28:43 +0000
Message-ID: <D0C78CF7-FF51-42E5-92C2-02C4C71187D6@arm.com>
References: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
 <b8f05e22-c30d-d4b2-b725-9db91ee7a09d@xen.org>
 <fd30be68-d1ac-b1bc-b3f1-cff589f338ee@citrix.com>
 <c97de57c-4812-cdfc-f329-cc2e1d950dc7@xen.org>
 <CACMJ4GY+H7P733_-UNgSd7P8+Z4ryeJwVy3QfekMJskkmh9btQ@mail.gmail.com>
 <30BB31A7-F49C-4908-8053-74E31D03BD33@arm.com>
 <36854512-23fe-57dc-3c47-5f996927872b@citrix.com>
 <A06EA6F6-BBB5-4FDC-BEA0-E5C6EB6B445B@arm.com>
 <CACMJ4Gb4CPDP5OmW+D50QCALvVo82rvw_7yO0ze0u5fh6ey_Pw@mail.gmail.com>
In-Reply-To:
 <CACMJ4Gb4CPDP5OmW+D50QCALvVo82rvw_7yO0ze0u5fh6ey_Pw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: af14352f-bd84-497a-440f-08da54ea0642
x-ms-traffictypediagnostic:
	AM7PR08MB5319:EE_|DBAEUR03FT056:EE_|AM0PR08MB3315:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3315E9E154EB2383EA5B90DA9DB59@AM0PR08MB3315.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RvgdO/+pFZy3KE0ZpPnAXKmfQXKx3oCdmHMHqrUiC1FQxQqN4t/6GphJS3FyqUsw2MqDZHd3EL7wsUqMQkzdMgqVhG+UV6fXtEzHGSa0PCO0tnihNMrs4XxvAwUTHGJbJVDtlI8kA5tCXgiC4ek589pJL3gE5rM88t5MNlRWD1s8RwrwbdfMVxI4RUTLDGJyvOgl22WHb2kVQRTzCtndTRna1RhzaNzN7DAMPNVwbb9D01GZHTPrnJ2+pGI0vd3UgyuOYwLgc9iKopY06lWY13ovUdOihbWdbkSm57dKsZwNrUQcAEdaNlhJZt5u8asoGvjifcW6VcLnagrbkTcW4wzwdlX0Qt2yciW8oVdHGNBK98vth3w65dRUGZaGcUU0LsIA1sIJaJo++LLZ0H3ZlVLDJnmpU2E/NkPJhHFDe53VuCAk89m3EAgskOFg4qf3cIySJ+ICfgu4OX2MtqlzdeDb3jYsAYjHj5ybVLFk7O6FrORne2crarr+fjotbyFEpLbJ55dQwbtGXim/l/svrgZPykONH/Hw+HieNz9jj3fMN2vhblUXD4T4bQxMmDKxBj7gIRwmOo9DuWWP6OhPdLIO/wrc6StupiMQnLVuZG+s5CnKG3TpdgmL5wqApU9uriFHV5955lRRi3YdrGUAV6dV/IrcgHjaOFcTmc0EHoHwJPmwRhIplfNgJaTwmNyiFTQDBZwX2oKK+ZtTxcSq0o3b1D0vQ8BY6YcyTrdfWbUjDj6NeXDgD5vzedDDtC8oSP5ZSiKq/noERCqIl31YTxrrIs7PrFH1TSHXe7B8C1n4hIRAjE14zidDQZ0lqUhw14+Xpdw6fv4KPmY80cZP9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(8676002)(71200400001)(66946007)(4326008)(54906003)(66476007)(66556008)(478600001)(86362001)(76116006)(6916009)(6506007)(36756003)(6512007)(64756008)(91956017)(186003)(83380400001)(2616005)(41300700001)(53546011)(66446008)(5660300002)(6486002)(33656002)(38100700002)(26005)(316002)(122000001)(8936002)(2906002)(966005)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1AAFBA371139884A9726D7BACAEAF290@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5319
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29654a63-6a1e-44e0-b602-08da54ea00ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JVkCoEHDUzs0mPApxWeJ0LyFqke9Asf/+GrQBsxpoPPsDZZiz9HCqx8OcJ1fyyIZhpZuPoFHTz4nMdXxn02dLUtDR0BM9YXDBlECZUfDTbi/ucBnPZf2/8lucZNuNPq+BhkvyPV+P0MOhESTrcxIdbgnZPmm0vx0FdECvei5CAY4mgwM5BdZF0e8tdMxWFSe7iV4e/GaS0Uw/RbjHRX/ebkHs0ey0OtTyX5BxRyO5OkT2CqSUmiUMLb5iqprF0vuJ33DmMYKQ/B4OYcO8NBDFycSAhJ0ETgsM0Blu94Wvvjw9dFDWQJwFLWXCEi1Pe2czWAILC9w/iUsmja11veHBSM/ykWyXNTn280gmAOPVjPjOUof7DScHuqu5uoa037rfh4lx85km2a5bA6yBaWjGluIgJGE1PCLaX6JhyxaWXQ2IY7sU1m98ihAuqdPvAnBxI8JnnhMtw7UdqU7CX0juMXhIWg7AgaegZCF17inoGPCymewRmcG2KHaZdeFzz2yrZ2ljVS9klkHibfVrrvM6WhUvxfhXUCw+fHniJs5s6ju/h0NU0U61dvRAOi55EkAYnGysjc14dsIcY6Ts/GFyUXi0x6UEFiICzNpx8pG9PtzlIwaPtkUIxHIde11eJcgIXgSu7QHBs5cJHu/h1caJilHwO8qnty9jlQoEUKkEu0zcSQu/O4qfE/GzJLguNcEx8PLhvJoZpUwCPOcWhcVykrJ9ZOXpfTiTgaghu6dOx6cdEKvd7xfwGAp/O50zXGZc7yQNJHdLVHcgdZ9BGEYRYi6Wup3gKf8OGUdBAavfpQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966006)(40470700004)(36840700001)(5660300002)(356005)(6512007)(478600001)(966005)(33656002)(53546011)(8936002)(26005)(6862004)(6506007)(40460700003)(316002)(2906002)(41300700001)(86362001)(6486002)(36860700001)(82740400003)(81166007)(336012)(40480700001)(186003)(82310400005)(107886003)(2616005)(54906003)(70206006)(4326008)(83380400001)(36756003)(8676002)(70586007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:28:53.0433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af14352f-bd84-497a-440f-08da54ea0642
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3315

Hi Christopher,

> On 22 Jun 2022, at 21:44, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>=20
> On Wed, Jun 22, 2022 at 9:40 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Andrew,
>>=20
>>> On 22 Jun 2022, at 17:28, Andrew Cooper <Andrew.Cooper3@citrix.com> wro=
te:
>>>=20
>>> On 22/06/2022 13:32, Bertrand Marquis wrote:
>>>> Hi Andrew and Christopher,
>>>>=20
>>>> I will not dig into the details of the issues you currently have
>>>> but it seems you are trying to re-do the work we already did
>>>> and have been using for quite a while.
>=20
> Hi Bertrand - I apologise if it seems that way, and for the pace of
> this being slower than you had been expecting to see.
> I don't think I have actually been re-doing it and I'm grateful that
> you have made your team's work available. I am working to get what you
> need integrated into the upstream.

We have not been informed of anything or requested to review any
patch you are working on.
Only information we see is a claim that there is a bug.

>=20
>>>> Currently we maintain the xtf on arm code in gitlab and we
>>>> recently rebased it on the latest xtf master:
>>>> https://gitlab.com/xen-project/people/bmarquis/xtf
>>>>=20
>>>> If possible I would suggest to start from there.
>=20
> Thanks - I will add this to the sources I am working with.

Ok

>=20
>>>=20
>>> Sorry to be blunt, but no. I've requested several times for that series
>>> to be broken down into something which is actually reviewable, and
>>> because that has not been done, I'm doing it at the fastest pace my
>>> other priorities allow.
>>=20
>> You have not requested anything, we have been asking for a year
>> what we could do to help without getting any answer.
>=20
> At Andy's request I had been looking into verifying the minimal
> necessary pieces to get the 32-bit Arm platform implementation to
> support a minimal stub test and also the XTF infrastructure (eg.
> printf, xtf return code reporting) that wasn't present in the posted
> work. The aim for doing that work was to build my familiarity with it
> and inform judgement involved in ensuring that the initial pieces that
> are merged into XTF have a maintainable structure to support each of
> the architectures (and configurations of each) that we need.
> It's taken longer than I wanted and it is clear that there is urgency
> to getting 64-bit Arm support integrated.

So you do not want our help and our code in its current form is not accepta=
ble.

>=20
>>=20
>>>=20
>>> Notice how 2/3 of the patches in the past year have been bits
>>> specifically carved out of the ARM series, or improvements to prevent
>>> the ARM series introducing technical debt. Furthermore, you've not
>>> taken the "build ARM in CI" patch that I wrote specifically for you to
>>> be part of the series, and you've got breakages to x86 from rebasing.
>>=20
>> Which patch ? Where ? There was no communication on anything like that.
>>=20
>>>=20
>>> At this point, I am not interested in seeing any work which is not
>>> morphing (and mostly pruning) the arm-wip branch down into a set of
>>> clean build system modifications that can bootstrap the
>>> as-minimal-as-I-can-make-it stub.
>>=20
>> You cannot expect us to poll on all the possible branches that you are c=
reating
>> and simply rework what we did when you do something on some branch.
>>=20
>> We went through what you requested using GitHub and asked you at almost =
all
>> Xen Community Call what we could do to go further without getting any an=
swer.
>=20
> I will continue to be reachable via the Community Calls. I will have a
> better understanding of what steps are needed next after reviewing the
> branch that you have posted.
>=20
>> You are not interested in us contributing to XTF, this is understood.
>=20
> No, that's really not the case; your contributions are highly valued.
>=20
> There's a gap that needs to be closed here between the needs of the
> contributors (ie. you guys), to have platform support working and
> ability to make incremental contributions for new tests, and what the
> maintainer is looking for: a structure that implements an intended
> design -- that is difficult for contributors to know without having
> documentation for it, which is again time-consuming to produce --
> supporting the many target configurations in a coherent fashion, and
> introduced in small, concise logical steps. It's compounded by the
> fact that this is intricate system software where hardware
> platform-specific details are critical for reviewers and contributors
> to understand and implement exactly correctly.
>=20
> So: I'm working on closing the current gap, aiming to make meaningful
> progress in the short term and can communicate with you more clearly
> as to the status of that in the coming weeks.
> I also think that once the initial platform support is merged, ongoing
> contributions will be both easier to produce and easier to review, to
> the advantage of all.

We will wait for all this to be available and at this stage we will check
if we use it or if we keep our own fork.
XTF porting was done as a base to develop Xen tests and, as it is
 now redesigned and we have no idea how, I will not have resources
anymore to assign on work on this.

All this could have been done in the open, discussing the needs and
involving the people who have tried to make this happen in the first place.

Cheers
Bertrand


