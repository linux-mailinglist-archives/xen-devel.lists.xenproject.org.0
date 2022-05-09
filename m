Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7910451F95E
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 12:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324345.546338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0Jv-0008R0-Cx; Mon, 09 May 2022 10:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324345.546338; Mon, 09 May 2022 10:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0Jv-0008OY-AB; Mon, 09 May 2022 10:08:51 +0000
Received: by outflank-mailman (input) for mailman id 324345;
 Mon, 09 May 2022 10:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11oC=VR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1no0Jt-0008OS-HP
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 10:08:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe02::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04bcc21b-cf80-11ec-a406-831a346695d4;
 Mon, 09 May 2022 12:08:48 +0200 (CEST)
Received: from AM6PR04CA0049.eurprd04.prod.outlook.com (2603:10a6:20b:f0::26)
 by DB7PR08MB3244.eurprd08.prod.outlook.com (2603:10a6:5:17::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 10:08:46 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::8d) by AM6PR04CA0049.outlook.office365.com
 (2603:10a6:20b:f0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 10:08:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 10:08:45 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Mon, 09 May 2022 10:08:45 +0000
Received: from dea0c9bfe622.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0DFDE5AA-A4E0-44E8-BE26-EDF900733E6D.1; 
 Mon, 09 May 2022 10:08:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dea0c9bfe622.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 May 2022 10:08:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB5498.eurprd08.prod.outlook.com (2603:10a6:10:11c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 10:08:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 10:08:36 +0000
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
X-Inumbo-ID: 04bcc21b-cf80-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WrSKzBJTanAkqMLP45F3XWtKC+2oGaZ27lDjW1mYwIZQvf0N0vhoIvBkg3o7VXQ3VqYj7tXNkHvA1ja8UUPjtoHYwSBOCtjKOoNQ3MnQmtH4SE95/9BBiMYzg1EKSjN18SIr4UYoTEySD+VDJ1Leem0rSzYzBx5o6JBLR4W7rQDG6Siji24hkJW/GQzaai9GAOob2+LlV0BaqFdlTktIfFcysfKM6trDUxKVPmFSFloysaAUkOESWFoRpMbMoOX6fK3MYlLXuGvVykjJndlIq9oATJAwJSKtg5Cw1DV+02uxDBIRtVlS3xhlDSo2HNK+SmgHTh47hzJ78Z6h0rNfOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMD+1rX2smqdWe5glCzpCqzZ041JJCDEaklYaBOfhsM=;
 b=UT8Dazjp8r5Y8PdtG/bgPb/4KHWugfD+4EHJmQg+GDUqZiyZdlno5wDaUXX3JO1NXjKL0/GODf6Ah0nX+qHg+tlfAx6mBHwViZWEhkusVoihvo2UYZAh7xDHFHd+7v31ABz4YEZaRtnEzi6sAaklrMEHBxL/Z7aLEv53ebsShkPKInK2l3gpq3iR/vMCnybJukegEaUAXu4GxdIzVXZjBCom5pu34d4fUaGyJXDr3Sl8XnFecya86RsGyJMDX9AloGp6NXR5zU8wsuPb4ysvy5wbxj1DQ+nSb3gezojV0WGQWDUBX5gb3yAz8xWbXOUt/Y287BRB2xF0eKXsenAPiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMD+1rX2smqdWe5glCzpCqzZ041JJCDEaklYaBOfhsM=;
 b=bda58VfYaAluWBzZ4rvzhDbHjJPvIOJROYE+pZUWTfFw5ty+Y9vI6XlhmfajJlXTYj0ZLwSSBNjwBiZNFD78UP9C8gsgq2Wt4hKLNQ0BZ3P54MQD5Wiw+sCpDbAwx1vMPOjKCDikVxI3OqOfsSD6nV9yPdgrcdQ1h9lKJ8dWCYE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac1fe656c88eda96
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z46g1YaqoAcsJtJYfsqPk/oFn90NPJxtJauA1iQH2YAwrtEcdyAZJnWRVaIdh3QwJz66I9I0kvIH3UqCf4QUfefCj/qTgLsrFDyuGsstDrzTxNYN0QjLY0N4JMPAyMVRCzp8TZRsB+HjaTrZqO9KFG1T0yaigo+Cvq1GWFNoZfnjf64ifgDIbbx5RUZDF52ODUq9SfB7QqjHH2YZJOv601cD7e9ZDmxnz3gI90Jr63zdicTFtunTjFjopEZj0lB1yEpAkjZg7tuBB2bN/09OOQBu6MzGgALSbLFEy2IwM56UCu0YZCql9ds4CbBwnlt/gAYFaZhQFiYpch9hpKbPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMD+1rX2smqdWe5glCzpCqzZ041JJCDEaklYaBOfhsM=;
 b=EMms+gqD+nD9BM9RQruzJ+OBvANTHvkNamIlMgeoq6tF0BC8R/RIQpUMBk3X2OpWD4hzbB/v57oDTYsteuCDurBb9ZGEeWxLGxIXoHRvAlYFPscAeyYS3aMUDqev+70o5WHwbbG8xpU/GCHhMAjlRYtbdqUzkQA+RDjSwq6QxPX7clklkR0Yu+KKPlztztYNTT+8nTeufLs4W4WfpUzdX7aW+of6QUB2bamwFpX4AxH3HYUy1LaFnFv7Kt+n2mdDyMkUtoS31Jopmk9CxIk1xC5gruJE8CnwUr0QeH6g65CWQG+GfwP4+mLCqKMZeb0+CrMXkP1xdOa9L2AgnME+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMD+1rX2smqdWe5glCzpCqzZ041JJCDEaklYaBOfhsM=;
 b=bda58VfYaAluWBzZ4rvzhDbHjJPvIOJROYE+pZUWTfFw5ty+Y9vI6XlhmfajJlXTYj0ZLwSSBNjwBiZNFD78UP9C8gsgq2Wt4hKLNQ0BZ3P54MQD5Wiw+sCpDbAwx1vMPOjKCDikVxI3OqOfsSD6nV9yPdgrcdQ1h9lKJ8dWCYE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: Add sb instruction support
Thread-Topic: [PATCH 3/3] xen/arm: Add sb instruction support
Thread-Index: AQHYXtGbLw8lUArxPEOQFl634Avmjq0NftKAgADToQCAAAuUAIAH/dMA
Date: Mon, 9 May 2022 10:08:36 +0000
Message-ID: <15DEAB6E-3130-49E8-87BD-AC82C08C7698@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
 <6571ead7-ff94-acb5-1e55-53ae69944bf0@xen.org>
 <E67D129C-DCA4-479E-B8B8-4C7DF8CC92B9@arm.com>
 <d8889ee4-7790-ab93-a5d1-708aa541dd1b@xen.org>
In-Reply-To: <d8889ee4-7790-ab93-a5d1-708aa541dd1b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1992bf01-2ae1-4895-41bf-08da31a3e754
x-ms-traffictypediagnostic:
	DB8PR08MB5498:EE_|VE1EUR03FT029:EE_|DB7PR08MB3244:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3244BEB76D66F09A8EA4F5029DC69@DB7PR08MB3244.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SZT/yyZ4e/K4nNghjsYsn2oQKtwaBmHKbs+ix0wmQQvoHT0laKD+38UaTI92oFH5h7bidacVJabi3YkkRvm33/PXwyqdrZTclagWo07+HgPz4t7Gvct1FqiuWoQLc5yHxBbSo/R52o0ugjD9eNVkdAdeCRpYWzt2drhjpUslZ+Qq28OvDCs+hrM4AZfRZ0zsxWrjsgsnAIheAZ5OwMWbK41l36xxq8fWZXjn2Sx4blKQPFVYDDhfSmmdpozlyV1DBFby4YzB7tJCtzPa8ixHQyypQ6n/go0sIkkZQQEmutOZoiWAtV22nHmv2mYvvUAs4lmeREAgFKTorxd5wy5CkJDT/KkdEhainVpgK5wBDVHhMBiXqUv+4XezksMf3ecqP7zIUEGSE2ISVXwbpKmd1Kr8Ex5HUboJkMM8j/qklZsDatIBUsecRPikO6ukv8+HKOW7cLjWisL1BeIH5wd2GQR8t94kVpWUeJfTUwk7nFOWEAEOCocJafYiJ614eQZ399gHKLC3fcrhgadFBS87sNCZ1zPWGvLE+yNoA0g8AwoMgid4N96royVtzD7qbBHvxckC/BpJbI2ECeGYqHYNgqEOJOf+foOrjp+XWZz8NpQg2Dq2rj6AmXuPtW6i+L+gVpsmT4eq9/uyxunmHZeodh2quizFygDH7jdfzhl7e/g3C6qmRj9Tub2odhvVxbJa1MLHsygF+7epu0bnErNXl9iK9Gzk6RhwaCehuaZc1bF71o44Uu7YjVKzco4pQCXH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(508600001)(6512007)(26005)(6486002)(86362001)(186003)(2616005)(316002)(6506007)(2906002)(5660300002)(36756003)(122000001)(91956017)(66556008)(4326008)(66476007)(8676002)(64756008)(6916009)(54906003)(66446008)(76116006)(66946007)(38100700002)(38070700005)(8936002)(33656002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CB0CE77BE888F4E8A5F5806BCC5E0D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5498
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	619f2a3e-e1b0-474b-f4bf-08da31a3e1db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4vRCyOrffJYaHpEN2svwxWyldV+9Y5oOZv10Go2ahcmYRE591/M77mS1WTcQcxvk6tD8/lyim8uXU9jDTqsfdtTqt4GOeo1qBM7jTf2ah9Ogr/bNXFC6DluYvKYqQPtyc+rYdswGDEQtWrfL3q637Ns/iqBT2ps7mJCefBBHAYReXTsrkETFD8MIQM0eU5SH9TQWh488JT4J2+06kD8AACEAlpim1mS9id8Zi6JYpBrbDvptXUj3cFxC1IniC30w2cxdjC168CGmZdKXjZpc7NKLpvAQ8QnHig9wDDNkjifrmjkyBFku1z3J3EDtMcq5WrpWRoHmABTXQiMf3NYBkW/LuiDqsTjYtV+vo2GZx0ALK5Bq9zG/At5sVn22IZgITNoxFMt3kRezOF2ZLqdShedN8xudfY7AnxYSSz7G2QQO/KZCQYBOCTHvPi7S94BA/8ClsQVwMTQJQVloAJ4gSr7rNlBC4CsErjZ85Er6oRNKzglWh8W02mhvo+0tUlpeR5sLRJ6xCljCBtnyRN1mPZ1Gt8oC0TSyVbybaX62mD4A67Ih8sG68HP2NPwFtLw7Nu44lmNbHzQVbHPb4jGP97dbWJHHSFKeMPr8hu2dpxO7F+x2zknUqYZi2c5vuoHlYpylgWsNWz0EMvCmnI7SLCAtd64URNHdNlldlWM1zpr6T2j8CXsFdWoxIy2fDzBw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(81166007)(82310400005)(26005)(36756003)(2616005)(356005)(8936002)(53546011)(8676002)(70586007)(6862004)(4326008)(70206006)(54906003)(107886003)(47076005)(336012)(36860700001)(6486002)(6512007)(40460700003)(508600001)(33656002)(2906002)(5660300002)(6506007)(186003)(86362001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 10:08:45.5741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1992bf01-2ae1-4895-41bf-08da31a3e754
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3244

SGkgSnVsaWVuLA0KDQo+IE9uIDQgTWF5IDIwMjIsIGF0IDA5OjA2LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMDQvMDUvMjAyMiAwODoyNCwg
QmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIEJlcnRyYW5k
LA0KPiANCj4+PiBPbiAzIE1heSAyMDIyLCBhdCAxOTo0NywgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4gd3JvdGU6DQo+Pj4+IEEgbmV3IGNwdWVycmF0YSBjYXBhYmlsaXR5IGlzIGludHJv
ZHVjZWQgdG8gZW5hYmxlIHRoZSBhbHRlcm5hdGl2ZQ0KPj4+IA0KPj4+ICdzYicgaXMgZGVmaW5p
dGVseSBub3QgYW4gZXJyYXR1bS4gRXJyYXRhIGFyZSBmb3Igc3R1ZmYgdGhhdCBhcmUgbWVhbnQg
dG8gYmUgc3BlY2lmaWMgdG8gb25lIChvciBtdWx0aXBsZSkgQ1BVIGFuZCB0aGV5IGFyZSBub3Qg
cGFydCBvZiB0aGUgYXJjaGl0ZWN0dXJlLg0KPj4+IA0KPj4+IFRoaXMgaXMgdGhlIGZpcnN0IHRp
bWUgd2UgaW50cm9kdWNlIGEgZmVhdHVyZSBpbiBYZW4uIFNvIHdlIG5lZWQgdG8gYWRkIGEgbmV3
IGFycmF5IGluIGNwdWZlYXR1cmUuYyB0aGF0IHdpbGwgY292ZXIgJ1NCJyBmb3Igbm93LiBJbiBm
dXR1cmUgd2UgY291bGQgYWRkIGZlYXR1cmUgbGlrZSBwb2ludGVyIGF1dGgsIExTRSBhdG9taWNz
Li4uDQo+PiBJIGFtIG5vdCBxdWl0ZSBzdXJlIHdoeSB5b3Ugd291bGQgd2FudCB0byBkbyB0aGF0
Lg0KPj4gVXNpbmcgdGhlIHNiIGluc3RydWN0aW9uIGlzIGRlZmluaXRlbHkgc29tZXRoaW5nIHRv
IGRvIHRvIHNvbHZlIGVycmF0YXMsIGlmIGEgQ1BVIGlzIG5vdCBpbXBhY3RlZCBieSB0aG9zZSBl
cnJhdGFzLCB3aHkgd291bGQgeW91IHdhbnQgdG8gdXNlIHRoaXMgPw0KPiANCj4gSSBhZ3JlZSB0
aGF0IFNCIGlzIHVzZWQgdG8gc29sdmUgZXJyYXRhIGJ1dCB0aGUgaW5zdHJ1Y3Rpb24gaXRzZWxm
IGlzIG5vdCBhIHdvcmthcm91bmQgKGl0IG1heSBiZSBwYXJ0IG9mIGl0IHRob3VnaCkuIEluc3Rl
YWQsIHRoaXMgaXMgYSBtb3JlIGVmZmljaWVudCB3YXkgdG8gcHJldmVudCBzcGVjdWxhdGlvbiBh
bmQgd2lsbCByZXBsYWNlIGRzYi9pc2IuDQo+IA0KPiBTcGVjdWxhdGlvbiBpcyBuZXZlciBnb2lu
ZyB0byBkaXNhcHBlYXIgZnJvbSBwcm9jZXNzb3IuIFNvLCBpbiB0aGUgZnV0dXJlLCB0aGVyZSBt
aWdodCBiZSB2YWxpZCByZWFzb24gZm9yIHVzIHRvIHNheSAiV2UgZG9uJ3Qgd2FudCB0aGUgcHJv
Y2Vzc29yIHRvIHNwZWN1bGF0ZSIuIFRoaXMgd291bGQgbWVhbiB1c2luZyBTQi4NCg0KSWYgdGhl
IG5lZWQgYXJpc2UgdGhlbiB3ZSB3aWxsIGNoZWNrIGRlcGVuZGluZyBvbiB0aGF0IGhvdyB3ZSBj
YW4gc3VwcG9ydCBpdCBidXQgaW4gdGhlIGN1cnJlbnQgc3RhdHVzIGFzIHRoZXJlIGlzIG5vIHVz
ZSBjYXNlIEkgZG9u4oCZdCB0aGluayB3ZSBuZWVkIHRoYXQuDQoNCkNoZWVycw0KQmVydHJhbmQN
Cg0K

