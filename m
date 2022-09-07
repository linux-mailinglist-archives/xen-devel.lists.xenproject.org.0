Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557FC5AFE15
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 09:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400878.642508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVppU-00027A-ED; Wed, 07 Sep 2022 07:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400878.642508; Wed, 07 Sep 2022 07:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVppU-000244-An; Wed, 07 Sep 2022 07:50:36 +0000
Received: by outflank-mailman (input) for mailman id 400878;
 Wed, 07 Sep 2022 07:50:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVppT-00023w-3r
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 07:50:35 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00059.outbound.protection.outlook.com [40.107.0.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfe6b840-2e81-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 09:50:32 +0200 (CEST)
Received: from AS9P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::7)
 by DB9PR08MB6572.eurprd08.prod.outlook.com (2603:10a6:10:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 07:50:30 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::48) by AS9P251CA0003.outlook.office365.com
 (2603:10a6:20b:50f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Wed, 7 Sep 2022 07:50:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Wed, 7 Sep 2022 07:50:29 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Wed, 07 Sep 2022 07:50:29 +0000
Received: from cb8704915c56.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4244D53D-5C48-42CE-B7BB-AC04BED23F62.1; 
 Wed, 07 Sep 2022 07:50:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb8704915c56.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 07:50:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6128.eurprd08.prod.outlook.com (2603:10a6:102:f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 07:50:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 07:50:20 +0000
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
X-Inumbo-ID: bfe6b840-2e81-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cBm7Yeh332e27Lco9Zk5bQ/hMgxW4NHNwycEw62FadC6TAdK+uicw2zPY6LyIfqluIJzHTovrlLEtvtlJPGBzFEAlOeSLLgRmkuoBUm94WuudQpXX9R74UIQC0pt7Ng432F4FL1WLIR2LOWlih22zGxkTVn7HusGaCvHXI5SJfPrxWCIy7TG6AugO/pVgAuyQoAk7ZfQsLpgFmVyNG7y9Vjedo/gnO1KUL7ZQebG4d/KSipLUjRwtAYqo4smm68lcLglMPVNmiZr5NrIYsqgbd6nN4fOlCAGRP1kJtzhhDiai5WOWy/oqVi+ZufgqG3wOe/WwlcdGZ5/xPN6pUKj/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBhxPpkOK05MpnlHBZB/4o/irs1HOP6seUR8RbDz1VM=;
 b=XqhzWWsBSNYXuYNpW4GTybFrzEGNY6x8Awle7xo1dxxWwVFw45yyabXBjnJyXz9bKtcp/c7pxiJQpZaSHOxQdyTt0ZGwqymFA6YoyeEc+wHovZwfzYm8SeDwEcPe+5o9tsDf+9JUQo88pOi4qWaFzeBpAijR0JQhG9wN9NXhJTv4khlpVR/idJNPvhZBoyYiPEia/0+F8bakARF+NSJ5iMYjWHHfCsiD++xU8kRR48Vl2ZqH0fZNjrcbjEG/f7STQzvTvp5Jg3dHH46jq0/Lf9oUsLenBeVoz44PyLbk7/Ku/94dT1xIoya54pQFco4YEQ/B4foyNMLpfZxrQUWiVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBhxPpkOK05MpnlHBZB/4o/irs1HOP6seUR8RbDz1VM=;
 b=0jSPMKcPVSEi0ixYewP94I0I41P4QXcXR10gtQWjbAwN2VjSog5YzuWa8b+fFZ33W57IdnQTLIFH8J/yAuRb/mH27ApxWH8N9qZlCm12B7O9Iygnm2vh+o+TawlqaTnC4YqYHVEd3SL4BTOTLAidpYg9+AZ2PPZfsiDlScL8yj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15d69d99e37a89b8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvLwNkCl/CGoLKJQTpL56Mp6K/gK2fdGqFbNyGm9uZ7a0+pV0ou+u+mK1pj60DfWQK1EFeie1wPkPyTRgFRNdiK7NUsdmbsSes+17oS4UGKpUgi8NYzMBMEoI6/1MsrBDwPcU19wtY1Du4/AXbYYaGsbgrBoYDzLPCaWV4g58RFOv+cC+Liwsnao9y43vvzKQk+NC7aH7M/vBoQCrR8ASJOY5Nnmt/KmbAO9qgxmE67MNHCukfnGRya1CqGmK+64brfmLMSJbNQt+i2bSB+v/TuCzX+qq5dGQkKpvhzl46ZjUBG5xHW5J87h9yyBxWeNhUJvkN9iKKtsFFZ8JH+xGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBhxPpkOK05MpnlHBZB/4o/irs1HOP6seUR8RbDz1VM=;
 b=P5RFMuIfKU9gMk0JYHBmhyUZ/kprdBcJanCb6nhnCqoh54H4i+YwBkcv/Jc+lY8/eFs/aNrLOvuM/ZwrmZPYVzow8fP7ehCxIf6VFsa15YvDMzyuP1GAD0JlJSsTA5UjcZVzNyL4P47NqpDzF8KbdCn65uvtfqXSJVAhrN/e2maBDfqmjc2kWiDiVpRMFSjH+nUpOx2OC2fiX9ZzztGlNHnfeRMsQAAhWpKsEnIh9SgJ/ijYqd5jXUSmez7AanFacAX3spDzAP1EjwefHeonrJceXOKVdmKoWVgaFl/8hhaVgPTazVwWMg76I3qCEF/KMjmJZ5gmNewV3ETYy+UOhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBhxPpkOK05MpnlHBZB/4o/irs1HOP6seUR8RbDz1VM=;
 b=0jSPMKcPVSEi0ixYewP94I0I41P4QXcXR10gtQWjbAwN2VjSog5YzuWa8b+fFZ33W57IdnQTLIFH8J/yAuRb/mH27ApxWH8N9qZlCm12B7O9Iygnm2vh+o+TawlqaTnC4YqYHVEd3SL4BTOTLAidpYg9+AZ2PPZfsiDlScL8yj0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Thread-Topic: [PATCH v4 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Thread-Index: AQHYwdce71y3zMqBoEG+YO6j4jrBhq3SnZgAgAD7rYA=
Date: Wed, 7 Sep 2022 07:50:20 +0000
Message-ID: <89733B19-C737-4A4C-80D4-42C4169331A5@arm.com>
References: <cover.1662455798.git.rahul.singh@arm.com>
 <b2edc092-5c7d-70b5-7525-810e21ac1370@xen.org>
In-Reply-To: <b2edc092-5c7d-70b5-7525-810e21ac1370@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5fdcec2a-0eff-4b6b-b129-08da90a5a274
x-ms-traffictypediagnostic:
	PA4PR08MB6128:EE_|AM7EUR03FT023:EE_|DB9PR08MB6572:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zvLDjKZt04ZJOjYV2QX+YGTcdUMuwZzK6ZbYILkLA2C1PyBMlnHzf50WzEUEiWJYW/VCpH1TaQL90fsD0dRFLWhOiMDp51kuf3wvZXxm78w9Y2mubdSwabopQGPgU2P8/vJMNR48LRKyD6sNuFu+TBu5nIxxeMjH0A3Dy2Kkts1K/Vz4bDmGfS0Fw4Z6ksFfOjoQQ9QZOzlgrMwo8OF78ujDEjfQ00Dfpu3L90pVu11plqdKVf+ZkhB0x2YUFvuPZgKuIvTzW0HmTgsBCRpVZN2XfhbM9DfHVFyqRKBCRhh7BmJEkhq7jnYHgTmibO8g/+nn04BhIPdM0WbmMLfcnkANkvbpnml6JT8Nn5DSE//zLfVhhOdDvnjf6m50Lrfxlh7KL53Rz2W4f1llW5bpMGco/4WVWZKHZe7+3giFOT1DB8QMGd5gQlIAJbE7xEo0uvacef/7ZHonNZH1rZqv6pNYPr5sdhFmKogXrnXYyA1xpPS0vpyiN/D3lPO5V1DAkxp3OFWPV4LyZvHHWyfL9b0ThAXGIk2VAXEbxD6qNE0EOJqd6wHX/vnzJ06M0ueaGHtB+vkpjKpIwbYZ+2FzyNkwoowAD7sGWdQ/fyw/UBvLVo0n38GMHafgzeTfBcHXOOmfCNHvazkWLPxJt741BueePMKHOEzjJn+0FbPP1JWgWTrpTVPVrePvCuXefjMS1lTxOp38zIemBxta3MV/ernmarvMFZXN1O1VH9M9IN4S4dJ0Jj/ld+KUHaIFYyOR7S8HZ7IIADDZfAOBeV3YXoF0qv27zv6wPNfUMwoqe5QOz9cvdLQJ+BkDS9JNoUxW2zW7JDOB6AVmy02iB/JZRA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(38070700005)(122000001)(38100700002)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(76116006)(91956017)(6916009)(316002)(54906003)(2906002)(5660300002)(8936002)(186003)(2616005)(83380400001)(6486002)(966005)(71200400001)(478600001)(6506007)(6512007)(26005)(53546011)(41300700001)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AC2FBAA8B24B1041B97A51595C117AE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6128
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e681cabf-69bb-43d0-bfe6-08da90a59ce0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r/sUKHneIMXFtTFLEZGHuw3fb5BsFJPf/xeGKGrvzZ13ox1Q69Q1g/ee/843peMwEtKb9gXD9PM4p3H5J1T43QiW+A8VmzrBNHT+Qa5gRb5qaSzaqa4lmorSYbUA5OyjTQiIt66pdWRtpNBzTLpaF8M/oxuJZ7LnxPXe9TUrW1sic/U96T8vvb7IjvDrsE532j8exNqwJzTX4EDTgzO7myz2wnSraHaa687bR/KzPmtlmm9lTamxABDvH2Jyr8AbMWGJh6LbssWSmMtQrwrNwgXViApoKmIQNEfNlSKBV1ntDmLz2KL2vS6Jql8WfcJqclpezEweyUBf+aii3E/Rijwf9iCFV+0r297dLznd2kl9hOIk+vgn1CM5Xjx/woSQw3v54dbTZ0pyTVq6BYdj7wIbV3/CumRLOZCbyXQKunpzBWFBtt6hjU1QL6niOONaSwHTDXbQw6Mgm73Z0g+RM4vtlAAzAzFVtGI0+872a/IVHJMjfdZkOQ9V41qsLRrCiIyBPKlkeRzOdOqE6tLKGL4Sx62NY+jHt+GG0jwB0y2IAVtJFaWJiGtFTloN0K7wz/7suDKzCHpvEvPfFu/zNRJN6CV5CFjakTApLJnkca9nelvCZznxhsfrXxnxc4u0VdDQGtz/Vjv3LOgp9J/NchGaG3Dm5JvIUfs+Q9aS9KV37MRKStkPxPUvtYC6JtT9VW+6QRzFLWu3EU8+zrW4GDm9IVkdENw61pybU+bMdCZpxtPZp49D8ZcdMFoq3FyRRVCFnqFNk7xTRK4bCwfO7J4z2ol1vw8EJU6KQVI5jMg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(36840700001)(46966006)(40470700004)(5660300002)(2616005)(53546011)(6862004)(8936002)(40480700001)(336012)(186003)(82310400005)(2906002)(41300700001)(26005)(6512007)(6506007)(33656002)(36756003)(107886003)(86362001)(47076005)(83380400001)(966005)(6486002)(478600001)(356005)(81166007)(8676002)(70206006)(54906003)(70586007)(4326008)(316002)(36860700001)(82740400003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 07:50:29.5281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdcec2a-0eff-4b6b-b129-08da90a5a274
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6572

Hi Julien

> On 6 Sep 2022, at 17:49, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 06/09/2022 10:55, Rahul Singh wrote:
>> This patch series merge the applicable Linux fixes to Xen.
>> Bixuan Cui (1):
>>   xen/arm: smmuv3: Change *array into *const array
>> Christophe JAILLET (1):
>>   xen/arm: smmuv3: Avoid open coded arithmetic in memory allocation
>> Gustavo A. R. Silva (1):
>>   xen/arm: smmuv3: Fix fall-through warning for Clang
>> Jean-Philippe Brucker (2):
>>   xen/arm: smmuv3: Fix endianness annotations
>>   xen/arm: smmuv3: Move definitions to a header
>> Robin Murphy (1):
>>   xen/arm: smmuv3: Remove the page 1 fixup
>> Zenghui Yu (2):
>>   xen/arm: smmuv3: Fix l1 stream table size in the error message
>>   xen/arm: smmuv3: Remove the unused fields for PREFETCH_CONFIG command
>> Zhen Lei (1):
>>   xen/arm: smmuv3: Remove unnecessary oom message
>> Zhou Wang (1):
>>   xen/arm: smmuv3: Ensure queue is read after updating prod pointer
>=20
> I didn't get the full series in my inbox. So I used the branch Bertrand p=
ushed on gitlab [1]. That said, I had to tweak all the commit messages to r=
emove the tags Issue-Id and Change-Id.

Very sorry for that (should never do things in background during meetings).

>=20
> I have also added Bertrand's reviewed-by tag on patch #3.
>=20
> It is now fully committed.

Thanks a lot
Cheers
Bertrand

>=20
> Cheers,
>=20
> [1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/tree/tem=
p/smmuv3-fixes
>=20
>>  xen/drivers/passthrough/arm/smmu-v3.c | 741 ++------------------------
>>  xen/drivers/passthrough/arm/smmu-v3.h | 672 +++++++++++++++++++++++
>>  2 files changed, 708 insertions(+), 705 deletions(-)
>>  create mode 100644 xen/drivers/passthrough/arm/smmu-v3.h
>=20
> --=20
> Julien Grall


