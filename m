Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB8269166E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 02:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493045.762859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQIg2-0001z0-Tx; Fri, 10 Feb 2023 01:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493045.762859; Fri, 10 Feb 2023 01:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQIg2-0001wa-Qt; Fri, 10 Feb 2023 01:58:14 +0000
Received: by outflank-mailman (input) for mailman id 493045;
 Fri, 10 Feb 2023 01:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+3fG=6G=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pQIg1-0001wU-1N
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 01:58:13 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe16::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e6f3b4c-a8e6-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 02:58:10 +0100 (CET)
Received: from AM6PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:20b:6e::14)
 by AS8PR08MB9118.eurprd08.prod.outlook.com (2603:10a6:20b:5b6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 01:58:01 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::e9) by AM6PR02CA0001.outlook.office365.com
 (2603:10a6:20b:6e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21 via Frontend
 Transport; Fri, 10 Feb 2023 01:58:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.19 via Frontend Transport; Fri, 10 Feb 2023 01:58:01 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Fri, 10 Feb 2023 01:58:00 +0000
Received: from 004a2ca34f67.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B8EA516A-6A66-4B6F-9ED5-D6B043AC1B02.1; 
 Fri, 10 Feb 2023 01:57:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 004a2ca34f67.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Feb 2023 01:57:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5723.eurprd08.prod.outlook.com (2603:10a6:102:89::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 01:57:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%4]) with mapi id 15.20.6064.035; Fri, 10 Feb 2023
 01:57:52 +0000
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
X-Inumbo-ID: 5e6f3b4c-a8e6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M8XVoSVQzj1eLY7upvJZiKmO3vJoeH8m934rCew6kk=;
 b=KfkIhEMwZAbeuIaN85oHrFysWpGIx3qGhGXNM0qxa91w0mHB6Djx03G0sKv7Aj98AGd0nVGXv1X9dUEsU3n6xaocKlBjKpf8m3OgoAS1j99uUXvT4WRRRxLqVb9RrGH2kZ04A+g6Wc0NKGgRFM7wQcFu7aY822q1EmTQA0uZqBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi2ohxfE4lK1qB+1jd3nyqVRSvVOcwrsTrKBr5mTcn4uQjTnqUt19JZLrbhZzq08qn/K2HyqLLRKeBXdDgfFWwP+qsEa9lvgntW7bh/dK+i6+81yspjvB18xU3MaI3wH5mZWyF1jqP4GyluMslHrTKh7jGnwCfl+Md8GvHIzL6OGydF2TK8g9fkcRdVYT9M0GflIfgUCZhCyLN+nI+OYZdbpTwz80EzhEEujG+H8Bc/iNd3q6NtJRqoMatPcCLp/NupNlpc9BF6EK1phqgXFFhDA6TA3VYCafZKc517xCQdoMmwSBh60uwEEDKc3RXWswsO5IlYHiyfNxfgPu+igBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M8XVoSVQzj1eLY7upvJZiKmO3vJoeH8m934rCew6kk=;
 b=hoHMpmOWSM3wDQc0h9CQJhmLc3GbhbXA54U/LSm5hbo7mri1I3Qg44DwlDygoZ21G7dlfEHk6ZuF9wWyUur+rod6lgBfDon8ud3XUOgQlBjiXDC9K/e+m0nRBScf4N955gX2JXOlEqEwW0PhkSQy3hbLdp5eELGHQQ+WpJKhNDVXolf8JFwI75uuKB56BAA5udV9UcPECaddsiLUVdIg06ClsXJtbB25zPnW2/o1Zz0m2U7mF6Q/Ow+6zrN2DWa5mQhCacFMzLWxq4HPTOSlZfMO8dE49lq0WZwrzbumNScignpMu83GXDn7/7kkPM2JjYh5t5Wu8KRwUueBOK48Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M8XVoSVQzj1eLY7upvJZiKmO3vJoeH8m934rCew6kk=;
 b=KfkIhEMwZAbeuIaN85oHrFysWpGIx3qGhGXNM0qxa91w0mHB6Djx03G0sKv7Aj98AGd0nVGXv1X9dUEsU3n6xaocKlBjKpf8m3OgoAS1j99uUXvT4WRRRxLqVb9RrGH2kZ04A+g6Wc0NKGgRFM7wQcFu7aY822q1EmTQA0uZqBY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: RE: [PATCH v2 1/4] docs/process: branching-checklist: Reword the
 section about Config.mk
Thread-Topic: [PATCH v2 1/4] docs/process: branching-checklist: Reword the
 section about Config.mk
Thread-Index: AQHZPKvv515bR3UnJEOFsOrA2YinZa7HazWA
Date: Fri, 10 Feb 2023 01:57:52 +0000
Message-ID:
 <AS8PR08MB79916656C845345C353CE29692DE9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230209172820.56292-1-julien@xen.org>
 <20230209172820.56292-2-julien@xen.org>
In-Reply-To: <20230209172820.56292-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 68CF94D2BF3B5E4DB2180453436FA4DC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5723:EE_|AM7EUR03FT034:EE_|AS8PR08MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8ef17a-c7da-475f-59fd-08db0b0a3d71
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VKaHRG/42uTAp6RXVTWVTirnU0ON4Ukbr1ZeFsU2F2LGV9QHPf49rUlosqjMO0ewcDilqmmeDkfqQvT9u27uKrTd9pTo8/cD1CgenFjxdjtBStL7bjwAI7nx4MD9tKj4fnPURRmJXQzI6o9Qx7mNXc8kGgm5SDZrDY33KEvtlWaIy3C3kO9YJwKpwG4DmSXCC1+bpUqCQdawT0fpTyUvxpiFXR8yvHKfc7Si0bIC3h7c+Ccp5JVBrQoOrpdoRiM7a9uB9L8+fJDXOXYr7rCca8eX8IgjG0Gevw8bSuR7jyJYtZRSzt6eoKFjEOy7usE54GGbUgKGnAh6y4Z31koUCpXI6ErDHqmtyGORt0k6P3KKPTaoAHYz0OblHtzlEMPpROELLGCGHVcs/eJp2oxYSRGGHTCjAfouvHH7CGunwRzaXOjN3QD27eftMvvkMQq34+qijS8lYWCbCIAQyx1t1Uqn/RvZvJjlvgXig89OkO3pXYoYOIqu+pws1tmeZ7KyoqGkBTxDqII48tUvwU3TIUbtblLOyYEM6cY7j2ybglBMgbsCK2LxM6nokoaB9HG37JiKKJlNyZWd+ErarS0PXl9z4l4wcl/tCf+/BREz8DCWpVHYVdwxr1nIiJBRowCmL+3XQFmw9VwfSSmvsbU4jjgE+SD5T+uI48USKKh4BHeqIxl/JdlOcm8HetslhG5+t9M0p0FDBVcOD5z1A+WTtg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199018)(122000001)(38070700005)(38100700002)(8676002)(86362001)(33656002)(7696005)(2906002)(4744005)(41300700001)(52536014)(4326008)(5660300002)(8936002)(9686003)(55016003)(64756008)(66446008)(6506007)(26005)(186003)(316002)(54906003)(83380400001)(110136005)(66946007)(66476007)(66556008)(478600001)(71200400001)(76116006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5723
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5094a81-df7d-49f6-7717-08db0b0a3837
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	47B/RLWuFmKeAK4EU2zc4+xJpfPBZ1BhrzLcCrH8qs8+CXvC2zHiV4WYR/GLyOa970+uTHqTZSfGKj1Cps9lI0n9m5TRMdSfrintzgTplGNmuTzQZwnk2nBWvn8JzUpEsQ/63sjwLn4mhkZXFJ5dAAvo8MDZpxwzxG1tclfWPMtFYjkK9ZVWJKqjXni8mHBF+JO5MS9EWlQdxdxEIERbzhlxTiA6EqY7DLVTzBlai2j2X7Odi/IR0UfacpEA+GMA6RTJ3yjzoLaH5ceRerYSadH/OJug5Z7OB0URiYhCoKXxNW+1zr93JYFB2qA+c0Ric3iRsW2Lwkmtr0gzcvK+hnI924YBSAw8WOe/LFblwHNOYBVUxytsHokfwtE7d2TX7p1/N5O2YUrbbljV1LpY5qKEmGVp1CynHYJ02yj9MCx1Qr56A4jNBfYC+R14NooXLthikerKHFdihW1Lf6xbEaJ1j330VNhVGkvxoMx1Z2Gueyw+ziOlvMHAtbZ7H8pqyoDflTjTGlwfiqA4RxXKCjJ9rBacPzXJFNdbVVlCfATnubymy3Y7JI4gxDwMTHGurT3YMoGTn7EzKWqxXpqsOxvoAa54i1JW8G9Jx7CLstHgHRdec3u+yB38WXWuWFwQY8mnOCTNnyr/BkPmzrKKRPmHJtTJV3a7+4+7BS/cgTswFrlsZKGvVVOSrI9u/9sxtex7c2WYQYK4sFdgjfyJ4g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199018)(36840700001)(40470700004)(46966006)(478600001)(33656002)(86362001)(41300700001)(8936002)(8676002)(70206006)(70586007)(82310400005)(5660300002)(52536014)(4744005)(4326008)(2906002)(36860700001)(81166007)(356005)(82740400003)(83380400001)(40480700001)(7696005)(186003)(55016003)(40460700003)(6506007)(54906003)(110136005)(316002)(47076005)(9686003)(26005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 01:58:01.1005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8ef17a-c7da-475f-59fd-08db0b0a3d71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9118

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v2 1/4] docs/process: branching-checklist: Reword the
> section about Config.mk
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Since at least Xen 4.12, the revision for external trees don't contain
> the word "unstable". So explicitely list the *_REVISION variables that

A small typo that can be fixed on commit: s/explicitely/explicitly

> need to be updated as part of the branching process.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Change looks good, thanks for updating the doc :)

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


