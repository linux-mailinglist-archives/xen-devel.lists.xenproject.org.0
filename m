Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59776625DF9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 16:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442637.697017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otVfv-0005W3-Ab; Fri, 11 Nov 2022 15:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442637.697017; Fri, 11 Nov 2022 15:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otVfv-0005TV-6n; Fri, 11 Nov 2022 15:10:35 +0000
Received: by outflank-mailman (input) for mailman id 442637;
 Fri, 11 Nov 2022 15:10:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoG2=3L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1otVfs-0005TP-Ib
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 15:10:32 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03hn2220.outbound.protection.outlook.com [52.100.13.220])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fab784ea-61d2-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 16:10:29 +0100 (CET)
Received: from DB7PR05CA0052.eurprd05.prod.outlook.com (2603:10a6:10:2e::29)
 by AS8PR08MB5926.eurprd08.prod.outlook.com (2603:10a6:20b:29d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 15:10:24 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::11) by DB7PR05CA0052.outlook.office365.com
 (2603:10a6:10:2e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 11 Nov 2022 15:10:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 15:10:23 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 11 Nov 2022 15:10:23 +0000
Received: from 70de0e96278c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A154121-C49B-48D3-BFD0-71C90F55AC72.1; 
 Fri, 11 Nov 2022 15:10:18 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70de0e96278c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 15:10:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9847.eurprd08.prod.outlook.com (2603:10a6:10:444::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 15:10:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Fri, 11 Nov 2022
 15:10:15 +0000
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
X-Inumbo-ID: fab784ea-61d2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nie1C5+u5DqMKNDIgmWXCt503aEMJBwfpMVr66ZOsA3bE7tNWqxIEmEKoX3WMm2hbPDEE2ulnCHG/JycJwbvfz0+RAAlAoH/Q+Ulv2FTumm8aPETn1elohoHym8pjASUS503IJjgE1Hkw+CHfhYJ1FB4HjciLln/ndMXhkTiZsqFz5IQ111jq+H67tcrww7SXc8ZtVNR+t76m1ORTJ+VDNDRbPcxBMrm3IzsjnBgfrmG8EReZjurItEfzz1Iim9a9OOJR/Wx52tjJG3edkH2TFxTeN8NwAWdx8PdoN3DvLlA2UY5/tVign2cTBjmaCqdu0bERULMNiXuoqB/UqH1ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98utQ0xUj7UoTyrkMXlQ/hkGzAJ6XYPMrvthwKWK+Dk=;
 b=CU62uqenZQgUGvXa8q+V3jGUnh1vd6tWzczonWr3Y/ijbtbD/X2Eq+PBXPiunWUMyJgSrh+cjmQYc2+VttoEMdLNAXuc2fYj5lmC/RHYjExEcmi09vDfN0aNFp+TG/6gyWjS0zH8FOE88pE8BMalwQrfxR0mEta/VzoqTvmUAJQkyGnon2vp3fWFOvPAdu3NAM9u/Q5bvSoOIajGhiICP37ZVuDOeRz6ZfPtmlNjWwnbnr9Q1O8GTpiL+7AhakY2wsHmf3HOtDt12PIVb2QakZnQ6jbBlsPmR1VQtiOuLtnz1kGEal+uxYmJtT/5H2rbSZBiHId2hnyJOnSNGBXezQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98utQ0xUj7UoTyrkMXlQ/hkGzAJ6XYPMrvthwKWK+Dk=;
 b=wveK3YmEjhswHFgmhlPSK88L8UFebT6nWPZ+6TePF5nkOddCo9Icb2ysXLJ8sxBIJZtld/t5qMnzTSxZCsp7tyT0u0/GKTXO++3sSyOQF8kQHL/7YFXi3zpLeU5Fl2m07CGlJN8NzKg8j1Suzwewtn9PI0CoSrWedbL2Mqg1Hfc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMJE85uuYf5wgQ02r4TrFLXrHuh4RvQ6yEUGccfM6DY1i3BFO38GA+LrnShc7ZyruU37h5WgPQAX3DqJ2yMWZ+/1N9be9y07qaXibIdYbcOgnIiRuMxediRpBdOoRwIUY8BCON63ZAIQTThQzLifDJ1zV1AXxTlN/CyRVqEj3V0ieUo1ZWsoOM0M/4FJXS8RICJEWwoItO8iY/AHgaBzW2vZprDiWaG95Kz7ddWiejaU1VJxfRqJrEGeu+CSMY5bRlveVKLfEgkfnM+EsqWw80uA+/PYlKKDzEdYt/z84gdm639XM6iFgGTOrG+tataJxZrnhp3Ij3uatHK4WU4Uzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98utQ0xUj7UoTyrkMXlQ/hkGzAJ6XYPMrvthwKWK+Dk=;
 b=MtxdvxIdSC+PDom1oXW84wpHwLFUyrRcpAaHcxX6a9uAyafufOFCS8ub0QeFeY8gwgJXVr4u/fTkmIJMSo4R1cx9dg8buwjnEE0Iih5zJRh8CkRMVtKDFm0r0HV4zCCzO83PnozPd1nGJmMIrLPRitW/KwG6wZ44lKt1SvLOVsVq3WuZxaLtnwbeN8N4PrnnNAoJC6uHJm3Ao5YaOZ5GxGdZSPk8tNWRfN6kz1s8DygHgOLOuuY9qxRCzTkD9yOvT8x28HsildPvxTL6FboSEHhCa6l2AqxpjL5pbJLCHQxYSNJ2unwXqTxtaeyzx5cnQSL3j0DU1zcF/QiyNo4Fsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98utQ0xUj7UoTyrkMXlQ/hkGzAJ6XYPMrvthwKWK+Dk=;
 b=wveK3YmEjhswHFgmhlPSK88L8UFebT6nWPZ+6TePF5nkOddCo9Icb2ysXLJ8sxBIJZtld/t5qMnzTSxZCsp7tyT0u0/GKTXO++3sSyOQF8kQHL/7YFXi3zpLeU5Fl2m07CGlJN8NzKg8j1Suzwewtn9PI0CoSrWedbL2Mqg1Hfc=
From: Henry Wang <Henry.Wang@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Topic: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Index: AQHY9cAA3X9w+pjMxES5dLMt0fkbDa45zccAgAAEr0A=
Date: Fri, 11 Nov 2022 15:10:15 +0000
Message-ID:
 <AS8PR08MB7991BAC837FD2D31D99BB1C392009@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221111112208.451449-1-Henry.Wang@arm.com>
 <20221111112208.451449-3-Henry.Wang@arm.com>
 <CAPD2p-=Y-1SwcWc5p-_nrWZAjTZPiyF7KZbeM62q9hafybD9Gw@mail.gmail.com>
In-Reply-To:
 <CAPD2p-=Y-1SwcWc5p-_nrWZAjTZPiyF7KZbeM62q9hafybD9Gw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5AB4A6D966307E4B8092C68C17689BE7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9847:EE_|DBAEUR03FT020:EE_|AS8PR08MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 49869a80-50fb-4c42-a92f-08dac3f6db4f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?J5nenWBz43nYYSglBG/qzC9SlJ1k7W8yz9HenifJhfv41gh69wBzFNzGHKSX?=
 =?us-ascii?Q?VtWgcxinTaPYyEZevl2yBFSRaV7SIe+jBUjPTQ9DIE6ard6FIv9Pqtloht+0?=
 =?us-ascii?Q?tPEq6aOWOdofHq/7DxyVcOeKRu2su2NEapE1ORVAmiS4tuiyIZ5fbdP0rdOF?=
 =?us-ascii?Q?8kL2rmwN89t7FCqJnGG60f9eZy548nhGpLxHWwevosTOYpQxVTY7cYVXr3Id?=
 =?us-ascii?Q?aVyMBumwejwYKRF5wuTEEkwv3aYZYugffv3bKaxFqWaBe7Q8PnLrqLbFHhvo?=
 =?us-ascii?Q?sNIgZNEylyaLi7ddPpF1AN6TF2e+jVSNs7X8dFuDNmjThiuuU/BGBfs7bZxW?=
 =?us-ascii?Q?2z+XSXkdw07trzrjCQ1+y4rBrPMPt5mvLzwrafLkjV3mKx6ABe0JMQjqsp1X?=
 =?us-ascii?Q?UOOu/gnceq43JYB9A9EhOYXe74aGqVe7dxvajU71ZljVlysYlrN4QVpkxVrO?=
 =?us-ascii?Q?Y4JwfZlTtUbJD+qYVnxQz/VeqKbCPLfdcCodNGjyN5j2miok5nV/57aHRawA?=
 =?us-ascii?Q?6ldn/mFwNPuZOZZjpCimDzzOu9c1Qlr3tRsIY2ByV0ULHK22xdpjJwvGVMJe?=
 =?us-ascii?Q?K18N/DFUB50tCjXYz30BqYNYswsN7ENOx1HUr3MiVutUD8SSrNyU6t0aaU8U?=
 =?us-ascii?Q?qG1DanAnYIOyjENfLrO4XRTUI6w31o0QCkDdpycJcNGYmnxwDzaQQOqf9Xj1?=
 =?us-ascii?Q?SyDa8e/1gxvym4kn/dI0BXIqb2Ca94bfsy2nyC95gxpjqhAjJrjtpdp0heN5?=
 =?us-ascii?Q?q457iJveM6ZM8jCVrowBtVT+VhMAXd5bjXLm7kiQY0W8juj4TZBNhCQ43/lS?=
 =?us-ascii?Q?cUrC34aA7NPQhuDx7q/i2ARGhFqDGuoxl6bMn2Nx4QCxLbnt4xo/MNpaQx96?=
 =?us-ascii?Q?SWtZD/Ryo/ETTA2/onCWcpgkBJW8qCaVee2K9dHb/O4KHJ1hIqvpqlNjHCSa?=
 =?us-ascii?Q?O7wj6zVWCHDVeNu3/CEuUzMtD1C56qyIM2L23WZrf//CwxGqBQ5eDQgiZVKb?=
 =?us-ascii?Q?MVl0HpMg6sW2MVmWHd3/tqLBfHpQmKxsndNcVGkyuSAl8zRU6IGPSsRFOlmL?=
 =?us-ascii?Q?4CLcq8oT0M1H2Lywycu+Ex/miP6cHK4rkfw9X/0RByEOGpRCMp/5PvUhbFeV?=
 =?us-ascii?Q?tUXcjA2ASjvA8hPiv9ENlNH08YkJrYwEr81pjUMlqj7j4uQDoXlQIudUtxWd?=
 =?us-ascii?Q?+vwttj/oL7thZQF1UVMqXPWAViUOtY+tjeZV8sW9gMFFUG7qxhd5D/Q4d+w?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230022)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199015)(33656002)(8936002)(4744005)(52536014)(9326002)(4326008)(5660300002)(41300700001)(2906002)(55016003)(8676002)(83380400001)(186003)(86362001)(38070700005)(38100700002)(122000001)(54906003)(76116006)(66946007)(64756008)(66556008)(316002)(66446008)(66476007)(6916009)(71200400001)(6506007)(9686003)(7696005)(26005)(478600001)(71176010)(59356011)(219803003);DIR:OUT;SFP:1501;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB7991BAC837FD2D31D99BB1C392009AS8PR08MB7991eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9847
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37d5b409-fe27-4a16-9fb8-08dac3f6d68e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE9GcHdkc0tKdVJORlc2QTdaSHpoVDlHUElRRmlPWUpVQmphVmswUWdEQ05v?=
 =?utf-8?B?RFNqTndnMHNNM0xRUVZlK3k0NXpEbDlJZ2pFVjlTZmlUemUzTk1ldnBjY29n?=
 =?utf-8?B?YkJlbU1UNGlSOXcwclBPbjR5U3BIUVcyZnkzZjU1bmU0TFJtbWdlcTNyRHJo?=
 =?utf-8?B?STJ3TzRzQmJzTFlwbklxaXJNMVFSeG9sYnpFZUlKR0wwQjJnaENMYWJLZWFQ?=
 =?utf-8?B?aXdLcmJRTW50VmFTNHRNM1ZmYzRoMFNZOWtpSUd2REVVVkljZ1QvNnJtSUw3?=
 =?utf-8?B?bW5RRlRBZUhnUkwyai83N1VNWHVEYUE4MmVyTGpUd2VQcUJOQWtNUEtEOTR6?=
 =?utf-8?B?VU8xdFp2cWlvR0Qyam41L2l5RzZxQzRhSjZLQjFHR1B3dG9QWm9Bc2xiVHZI?=
 =?utf-8?B?Zlk0WU9kNVNKZlk0dGRMbmI4SmxPZGZLNkUxTVVNejNmWmVTamF2UkhubnZJ?=
 =?utf-8?B?RTNXUWk0eDRxL0tjNktJMjNLSkczb1pHNklZVDdWZXpMZzdxL3U1aStYKzZN?=
 =?utf-8?B?Z0RIRCtCaldhNS9qeGNpRzIxOUdvNy9zTTZSVWlWWUsxWHVySUZTZWQvWC80?=
 =?utf-8?B?MzNub3dlK0RqQnQ5VU13dDJHWkVhbTRpRDZWUHZOYjM5RERKbDh4Tkh0SG1m?=
 =?utf-8?B?RStkVzRRd2ttWUo2YXE5YTVPT1grTUhId0lIcXZiQjRDUHJzOXBQTTc3UWZw?=
 =?utf-8?B?YysrS2UrUjY1d215VGcvMmlmWWVJVUx3RENEajRXN1pmdG9HSDk4VGdZM1NK?=
 =?utf-8?B?RGFUNDZWVU94eEJoODV4MXM4Ykc1VVhvaWpyOWFxbjdtdUZHVVVaL3d5WlNF?=
 =?utf-8?B?K29BUjl4azdHWGZRWUtuZUdwL2ExSjQ3dmgxZVowaVFGZUdUUVpXbUkyUzRE?=
 =?utf-8?B?a1p5SmFhMkVRWTYrZVJiamRYaFB1aWV2ZnFjc2ZLM1huazVvb3AvL0R3RUpI?=
 =?utf-8?B?SG0xYjdUWElET3RPUzQrWDBBRlJpUmxFRkVIN2FmVWh5MmtRNU5mQmtsMGZ6?=
 =?utf-8?B?OHVqeG8rN1Y3d25sU2ljMVMwMG1OK2ZPNldTSVZOUUdPcU84ZlhPVGhZSjc4?=
 =?utf-8?B?MkFRU292MWV6dWFXM0RoM0dUd2phQ01ESnVZOUNBNE1FNVJBWFUwK2UyY0Fk?=
 =?utf-8?B?NTNabitZUWF0RFVqc29iaEVReWYvbGVVd2F1cno2NDV3dFAzOTIwUkNXZCtw?=
 =?utf-8?B?bzMwN1Z4N2lyT0pwdU5qb09CcnJLdjBwV2RlVWY4L1l4YXlGdWlCaUxvdWY5?=
 =?utf-8?B?U3YybnU3d0NTd1ljR0ZUME1jQzIvSVZNSlFtc3d5VjhRTTdmRGlUdWpIOGx0?=
 =?utf-8?B?ZXpsYXBxRDIzZ1pacVFNSlcvUWN4ZCtPUU56QzZiWVhscm0xSVp0YWpMV2do?=
 =?utf-8?B?Y01STm1aL1BoTG1laVRPajJmdm1BbjZXT2hoSGtxRllCOHpINFFBSFRlZTVL?=
 =?utf-8?B?WUNCZWRESmZxT0NubnUrOXBJdm9iL1IxUGFSbU1BeThYRmFxYk9nQkxKMk1v?=
 =?utf-8?B?eG9vbjJWWW9QVUVqS0FMR0Q2V21lZWljZjBMTStGc2YxUGoyRDIwMzZLYkM0?=
 =?utf-8?B?YkJYR2Q0MkdsdGNIS3M1LzV4ZU94TGwxTlVtc2FPVW1GcUlyRnUvUE9kWEJa?=
 =?utf-8?B?blVqSkJCMHhrL25pcDV6TGdBZlc5eXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:OSPM;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(33656002)(86362001)(36860700001)(6862004)(5660300002)(2906002)(8936002)(9326002)(83380400001)(336012)(82740400003)(26005)(186003)(356005)(9686003)(47076005)(81166007)(496002)(52536014)(54906003)(316002)(70206006)(41300700001)(8676002)(70586007)(82310400005)(4326008)(40480700001)(55016003)(40460700003)(6506007)(33964004)(7696005)(107886003)(478600001)(71196009)(71176010);DIR:OUT;SFP:1501;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 15:10:23.4992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49869a80-50fb-4c42-a92f-08dac3f6db4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5926

--_000_AS8PR08MB7991BAC837FD2D31D99BB1C392009AS8PR08MB7991eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgT2xla3NhbmRyLA0KDQooKyBBcm0gbWFpbnRhaW5lcnMgZm9yIGEgcXVlc3Rpb24pDQoNClBs
ZWFzZSBzZWUgYmVsb3cgaW5saW5lIGNvbW1lbnRzIChJIHNvbWVob3cgY2Fubm90IHJlcGx5IGFz
IHBsYWluIHRleHQgZm9yIHRoaXMgZW1haWwpLg0KDQorIC0gQWRkIHN1cHBvcnQgZm9yIFZpcnRJ
TyB0b29sc3RhY2sgb24gQXJtLg0KDQpJIHdvdWxkIGNsYXJpZnkgdGhhdCBvbmx5IHZpcnRpby1t
bWlvIGlzIHN1cHBvcnRlZCBvbiBBcm0uDQoNCihIZW5yeSk6IFN1cmUsIHdpbGwgY2xhcmlmeSB0
aGF0Lg0KDQorIC0gQWxsb3cgc2V0dGluZyB0aGUgbnVtYmVyIG9mIENQVXMgdG8gYWN0aXZhdGUg
YXQgcnVudGltZSBmcm9tIGNvbW1hbmQgbGluZQ0KKyAgIG9wdGlvbiBvbiBBcm0uDQorIC0gSW1w
cm92ZWQgdG9vbHN0YWNrIGJ1aWxkIHN5c3RlbS4NCisgLSBBZGQgWHVlIC0gY29uc29sZSBvdmVy
IFVTQiAzIERlYnVnIENhcGFiaWxpdHkuDQoNCkkgd291bGQgcHJvYmFibHkgYWxzbyBhZGQgdGhl
IGZvbGxvd2luZzoNCg0KLSBBZGQgUmVuZXNhcyBSLUNhciBHZW40IElQTU1VLVZNU0Egc3VwcG9y
dCAoQXJtKQ0KDQooSGVucnkpOiBJZiBzb21ldGhpbmcgZnJvbSBhIHNwZWNpZmljIHZlbmRvciBu
ZWVkcyB0byBiZSBpbmNsdWRlZCwgSSB3b25kZXIgaWYg4oCcYWRkIGkuTVggbHB1YXJ0IGFuZCBp
Lk1YOFFNIGluaXRpYWwgc3VwcG9ydOKAnSBhbHNvIHF1YWxpZnkuIEkgd2lsbCBsZXQgQXJtIG1h
aW50YWluZXJzIHRvIGRvIHRoZSBmaW5hbCBjYWxsIGhlcmUuIEhvcGUgeW91IHdvdWxkIGJlIGZp
bmUgd2l0aCB0aGF0Lg0KDQotIGdyYW50LXRhYmxlIHN1cHBvcnQgb24gQXJtIHdhcyBpbXByb3Zl
ZCBhbmQgaGFyZGVuZWQgYnkgaW1wbGVtZW50aW5nIOKAnHNpbXBsaWZpZWQgTTJQLWxpa2UNCmFw
cHJvYWNoIGZvciB0aGUgeGVuaGVhcCBwYWdlc+KAnQ0KDQooSGVucnkpOiBTdXJlLCBJIHdpbGwg
YWRkIHRoaXMuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

--_000_AS8PR08MB7991BAC837FD2D31D99BB1C392009AS8PR08MB7991eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkRlbmdYaWFuOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAx
IDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUg
NSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IlxARGVuZ1hpYW4i
Ow0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMg
Ki8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBp
bjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
O30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0K
CWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0K
Lk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41
aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNl
Y3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNv
IDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAv
Pg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxh
eW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwv
bzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVO
LVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdv
cmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhp
IE9sZWtzYW5kciw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+KCsgQXJtIG1haW50YWluZXJzIGZv
ciBhIHF1ZXN0aW9uKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5QbGVhc2Ugc2VlIGJlbG93IGlu
bGluZSBjb21tZW50cyAoSSBzb21laG93IGNhbm5vdCByZXBseSBhcyBwbGFpbiB0ZXh0IGZvciB0
aGlzIGVtYWlsKS48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQg
Ymx1ZSAxLjVwdDtwYWRkaW5nOjBpbiAwaW4gMGluIDQuMHB0Ij4NCjxkaXY+DQo8ZGl2Pg0KPGJs
b2NrcXVvdGUgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci1sZWZ0OnNvbGlkICNDQ0NDQ0MgMS4w
cHQ7cGFkZGluZzowaW4gMGluIDBpbiA2LjBwdDttYXJnaW4tbGVmdDo0LjhwdDttYXJnaW4tcmln
aHQ6MGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPisgLSBBZGQgc3VwcG9ydCBmb3IgVmlydElP
IHRvb2xzdGFjayBvbiBBcm0uPG86cD48L286cD48L3A+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2Pg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JIHdvdWxkIGNsYXJpZnkgdGhhdCBvbmx5IHZpcnRpby1t
bWlvIGlzIHN1cHBvcnRlZCBvbiBBcm0uPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPihIZW5yeSk6
IFN1cmUsIHdpbGwgY2xhcmlmeSB0aGF0LjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxibG9j
a3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0
O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0
OjBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4rIC0gQWxsb3cgc2V0dGluZyB0aGUgbnVtYmVy
IG9mIENQVXMgdG8gYWN0aXZhdGUgYXQgcnVudGltZSBmcm9tIGNvbW1hbmQgbGluZTxicj4NCism
bmJzcDsgJm5ic3A7b3B0aW9uIG9uIEFybS48YnI+DQorIC0gSW1wcm92ZWQgdG9vbHN0YWNrIGJ1
aWxkIHN5c3RlbS48YnI+DQorIC0gQWRkIFh1ZSAtIGNvbnNvbGUgb3ZlciBVU0IgMyBEZWJ1ZyBD
YXBhYmlsaXR5LjxvOnA+PC9vOnA+PC9wPg0KPC9ibG9ja3F1b3RlPg0KPGRpdj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+SSB3b3VsZCBwcm9iYWJseSBhbHNvIGFkZCB0aGUgZm9sbG93aW5nOjxv
OnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tIEFk
ZCBSZW5lc2FzIFItQ2FyIEdlbjQgSVBNTVUtVk1TQSBzdXBwb3J0IChBcm0pPG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPihIZW5yeSk6IElmIHNvbWV0aGluZyBmcm9tIGEgc3BlY2lmaWMgdmVuZG9y
IG5lZWRzIHRvIGJlIGluY2x1ZGVkLCBJIHdvbmRlciBpZiDigJxhZGQgaS5NWCBscHVhcnQgYW5k
IGkuTVg4UU0gaW5pdGlhbCBzdXBwb3J04oCdIGFsc28gcXVhbGlmeS4gSSB3aWxsIGxldCBBcm0g
bWFpbnRhaW5lcnMgdG8gZG8gdGhlIGZpbmFsIGNhbGwgaGVyZS4gSG9wZSB5b3Ugd291bGQgYmUg
ZmluZSB3aXRoIHRoYXQuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPi0g
Z3JhbnQtdGFibGUgc3VwcG9ydCBvbiBBcm0gd2FzIGltcHJvdmVkIGFuZCBoYXJkZW5lZCBieSBp
bXBsZW1lbnRpbmcg4oCcc2ltcGxpZmllZCBNMlAtbGlrZTxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+
DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+YXBwcm9hY2ggZm9yIHRoZSB4ZW5oZWFwIHBh
Z2Vz4oCdPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPihIZW5yeSk6IFN1cmUsIEkgd2lsbCBhZGQg
dGhpcy48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+S2luZCByZWdhcmRzLDxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGVucnk8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9k
aXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_AS8PR08MB7991BAC837FD2D31D99BB1C392009AS8PR08MB7991eurp_--

