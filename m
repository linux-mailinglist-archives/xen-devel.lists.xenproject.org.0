Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01963BC6B1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 08:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150735.278669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ece-0007TA-Bf; Tue, 06 Jul 2021 06:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150735.278669; Tue, 06 Jul 2021 06:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ece-0007QW-80; Tue, 06 Jul 2021 06:31:56 +0000
Received: by outflank-mailman (input) for mailman id 150735;
 Tue, 06 Jul 2021 06:31:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dpqu=L6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m0ecb-0007QE-RW
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 06:31:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4f38b29-51f7-4c9b-a87c-885d1e958de7;
 Tue, 06 Jul 2021 06:31:50 +0000 (UTC)
Received: from AM7PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:20b:100::18)
 by AM4PR08MB2804.eurprd08.prod.outlook.com (2603:10a6:205:d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 06:31:48 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::2a) by AM7PR02CA0008.outlook.office365.com
 (2603:10a6:20b:100::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Tue, 6 Jul 2021 06:31:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 06:31:47 +0000
Received: ("Tessian outbound 71a9bd19c2b9:v97");
 Tue, 06 Jul 2021 06:31:47 +0000
Received: from 730b888f6353.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4C04F6FD-792D-4118-9581-C9621DD858D4.1; 
 Tue, 06 Jul 2021 06:31:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 730b888f6353.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 06:31:41 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4176.eurprd08.prod.outlook.com (2603:10a6:803:ec::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 06:31:18 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 06:31:18 +0000
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
X-Inumbo-ID: d4f38b29-51f7-4c9b-a87c-885d1e958de7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDDh4o70b3LaBcWZe4tHx3A6Kwpf4U137KGpOQq/x9k=;
 b=WCF9+Fz8RhHvh7b39uci6+Jqu+Zqi/YP7cz7UuqQdXUmeSi8JAsS/8t3wuJ+Du8BPn/me7tCSxEUdPF3bPbyBd7WwGiMn39BHg+3WN3RpRXxKjs9tJ9KI5chcMtS4ZY9l1F9a6DgXuM2StezYdzFRA5H1tqci4W+nsgO95AR6K4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kN1v/NltOip69T9fuetC/bdzSZQnJeOowm+wpN4W3IQC83YkbAmNNhTn8PIH2hwolhYtYAINntKlSJNzFFXVnDfoDgeUgMBOUIp6U3cP3dvpU9JhQncfamIaUXFoUAZ1joUxd3nUx7WZeNBNPYovohJ58u3IElVVIakZdg4rIlzsGpGMAcLdE047ejDiwm2yKdC8oa4cGcZv/il65T4bWXOqxu/SBhyr7RBBgXEKdyYc64vC4Q5Zfgj1Sb/zWdgFnoOD/2yfDVBTL4nXYQJg5+dCBAzQI0+fYQKcJIZVTF8YH/14I317QDOxSmFTL6cJCopTXtHc2B4mxZflnVyLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDDh4o70b3LaBcWZe4tHx3A6Kwpf4U137KGpOQq/x9k=;
 b=aWlNNAvfBmXchMqvU3K5oQBZSpwCfc1izClMRsBUl+vmCfFs3z6+ijxYUmoMZe06GDK+03wkwByxOBwOnXQxskRdkehR/9M0pgQjijOb/iyhmGDAbsLgw4/TmBMlEVDeKTqKBGNsbdbK5rRLHw2vomaMaDzlqKLdX8NJH5AI1aGl7OJccpb9Xzu6j67GNL+dv5OTF8EdTLoKiYaAl7nTTASa7VaTn0ocD8MkKLjDbWpfM31KvBJcxlrIRH5mGUVSCQ3l8uPdiXPHu7q+RGLmPATOuMKLYuKa1Hyd6QGQ8y38Lb02p1G5xJnGuhmEt8DH5rwQfpRXKzxbn0y9gVXR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDDh4o70b3LaBcWZe4tHx3A6Kwpf4U137KGpOQq/x9k=;
 b=WCF9+Fz8RhHvh7b39uci6+Jqu+Zqi/YP7cz7UuqQdXUmeSi8JAsS/8t3wuJ+Du8BPn/me7tCSxEUdPF3bPbyBd7WwGiMn39BHg+3WN3RpRXxKjs9tJ9KI5chcMtS4ZY9l1F9a6DgXuM2StezYdzFRA5H1tqci4W+nsgO95AR6K4=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH 8/9] xen/arm: check `xen,static-mem` property during
 domain construction
Thread-Topic: [PATCH 8/9] xen/arm: check `xen,static-mem` property during
 domain construction
Thread-Index: AQHXW0cAUmDBqGSIy0OSAkpietHoXKsxZ2CAgAQ9d/A=
Date: Tue, 6 Jul 2021 06:31:18 +0000
Message-ID:
 <VE1PR08MB52155D35A7B716DC7337311DF71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-9-penny.zheng@arm.com>
 <f613372a-eac8-f79b-2941-b7cce3e1e0e7@xen.org>
In-Reply-To: <f613372a-eac8-f79b-2941-b7cce3e1e0e7@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A4B16045A6BA6947A3D5CC1109CD6D03.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a70781a4-6f48-4431-72f6-08d94047bb51
x-ms-traffictypediagnostic: VI1PR08MB4176:|AM4PR08MB2804:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB2804A8ED025CAA492E7BBFB9F71B9@AM4PR08MB2804.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ezTO1uZK9Rpgcaw2HZFjoftKrF9Q0bvxdAZa2rhNmKZIh26y692zq4udKhDUm/JMEU3eqWw6tWa2YbYwCfu+eBas6WDVDBrs69oz7hCRQfFgjZ/Xii1WF8XtoaLENNqhpouPPILmeS94pwgfoZK+q38aTkyeDG8fAXLNn9ZQGFiMp2TkbdI8KZ04RivGYmAKpvEoP034Ci9N1Ef+FeW1f3AdQj8salDUhahws1gVwiryfZIwLhQ1BuAxb1HMmku/e4lclkDYS6bqB+mVDOANT6pVYLvddP03rqjGAo2v0u4/qeBLsqbDqTSiBc/T6TqYEQuLpZEv34TTj07lgAWlSNj6RhOomCHtX2sciFXnhEBh+XW9vNdSXAh6DVSsp710PDD6K/WEG0eJdGLpeuqxIwokyH08kb2HDkFogCTJfoDUPFXghVDCyk8ocSkk7oQJctFhdnkqBqZHzyNcS4Lg7Qk9NEKDq1Temp3aACXbbJeIy7LGkUAFPPo+ZqgXnOv49D+FyZyB4H0VE1mKK98ccTmMrdtm6GL4yqfDZ7fWhQJIi2gYl239LI6tpvXnfwevwPogdzu8BTTntAZWWo0RXcsKH4VOFVcl246xNXVcY5zuw3agcV0NL9IBp9LKg8WiqMo/r5yMlg2EwxZB3ZVBWRCRjGMfDm2A/ddTKjeXbd44RUtF/vKX+FPoEg0sTKsCPbxUJnUBXhNckE9RnH2bXQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(71200400001)(122000001)(7696005)(9686003)(316002)(66946007)(66446008)(64756008)(76116006)(55016002)(66476007)(86362001)(33656002)(38100700002)(2906002)(8676002)(4326008)(66556008)(110136005)(478600001)(54906003)(6506007)(186003)(26005)(5660300002)(53546011)(83380400001)(8936002)(52536014)(81973001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1RjeFVRQWluWVZJcmY5UGtpa2RZbndRMFVyekpLSW1xemYyUWJOSXZyTzFv?=
 =?utf-8?B?cUZMRE85dHEwVzQ5NkY0aUdIaXBVVkFFUlY4VUlJaHFEdHhJMGlwMjhxUjBr?=
 =?utf-8?B?SkdhRXVwajVUY1YrMmF2elpoMU1Ga0lkNVVqTDRHbFpCYndnaVFyb3ZhU0pQ?=
 =?utf-8?B?RTVGcnB2UEMvZDFXekVuWnRzTkc0S2s3cDlVb0orQ0tQZ1BDdkFrcVRHMDNK?=
 =?utf-8?B?OUQ0UTdoeFFMTzM1ZlhsNDFXWUdsMDhYeDZKMFdzYW1wNUhxNDVyMVI0K2RX?=
 =?utf-8?B?WC9RaHZDM25qUUpodmpKN3V4Z0R5K2FIWUxtMDU2WUs5UXgxWjVpZGNVZlhZ?=
 =?utf-8?B?MXBIZmlST25jNVFvTndENUZoSGFzeFN6M3poYktIQWI3OHM3V081ak0rMUpn?=
 =?utf-8?B?Zk9CUk10V3J4RUxNYjYvVHZ3eTV0SVZPczFsclNsaitveGkzajBjSDY3b1VI?=
 =?utf-8?B?VTdrS3AvcEQxWS9mOXRoWURtNXJLcWk5K2NZMXhsWkVmaXhodU9QYmdBVmNw?=
 =?utf-8?B?VDk5T28vSEhBeDNlL3AwWkNaRzRYWmVaUHVPY05rRFRIaVI4ZlQxSmh6Zkd1?=
 =?utf-8?B?R0RMVXVHSUFsZUg1cnZQYzF6OEttWFdhQWIrdEFaNWNLY0tWRWt2VzA5c1E1?=
 =?utf-8?B?UjdCYlpRdDBmMXNGTUZlWC9NdllGTlVsK3VMZFZKNU9LZ0ZSeVdaazk4aHdP?=
 =?utf-8?B?VTF2L3Y3cmxCMUUxaXFudXRJTHMzcXhsR09oa1ZpNjFBb1pKVHZWRlQ1M0ZP?=
 =?utf-8?B?NjVvMFFEbm5Gdjd2ckYzM2VZUEloV0VsakI0WHZuc3U5bzlWR01uUTd4MSsv?=
 =?utf-8?B?eXNkeGh1ZmIzdUFjSDRHUmU3cWhLMFRmY0JnL3QwS3lHYW9EamZZZlhRMEhE?=
 =?utf-8?B?cnlMdThvSTZ4UC9RVzZ5aGdsTk1mMlN6dXh5dDlLSnN4MmtGdXhVeElrZUhH?=
 =?utf-8?B?eE4xWnBUMndQZ0x6d3FlRFBDUUhRMXNjdXVQTjJkR3c0K1drZTBibjdWZUYz?=
 =?utf-8?B?UGZkckVWYlVoSDl3RTluSlE1UTgrWlVyQi8ycngvTEJucExTRTIxSWtLaXNO?=
 =?utf-8?B?c25OUCtXTlE4SGVORDlkWjFsSlluaGdEYitmTEtrOXhUTFgzT2x2QWVHcnMz?=
 =?utf-8?B?Nks4d1NIRmJzN3RxcHR6RkREWDlQaytIN0JBSVpFbkQ1RmtZNTVvMmtTZHg3?=
 =?utf-8?B?UHdENWlYa095K2luV2V4VHV0bzExQ25tTmQ2ODhwQS8xbnFyVTVkbkEvMCto?=
 =?utf-8?B?eHVlRmNObnA0ZENmYkFvSzVWMS8rYmNNVzh2S0hGOHhoWTF2RUpNTThpV0FG?=
 =?utf-8?B?UkRnM3NxcEsvVkEyT282UEJJcEJaSXJDbTk4ZUtHSnhKeGdPa2hqQW1KbDJo?=
 =?utf-8?B?a2p3NEpYWXFEUGVFdHpneDE0UERpSGJ5b0VueTJRNkY4VXBTL0FrY0lRdVVx?=
 =?utf-8?B?UjN6RjNsWEFnNFhMaW1iMU45M1IzRExXemd0MmlpZ3lIYUd4TEJrYytVcGVB?=
 =?utf-8?B?ZXJaMjhqZ3hQbURhY3VaOFc4ODhpUHdDY2lRWlQ1V1pIM2J1bFVRbUZMaktq?=
 =?utf-8?B?Vm12K1hVRy9lL3FqbllZWEd0anRROU5jT292NmdlSUxXSitySlEvdTdCSHo4?=
 =?utf-8?B?RUYwVmhDejNPeCt6cU9TeTRFWjNlOVVEd2FxNDRLOW43NjZNUnVRUllDRU1k?=
 =?utf-8?B?aG1aOFdaOFdueDhOa1crWmh6b3JxSGprRHFtTzRYMVZ2eG5kREpsKzc3Y0h4?=
 =?utf-8?Q?/w670o7Y9xRkjHPxUiRbL2cd5n/U6PdzCo8kAgY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4176
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13bdab12-8aa5-4950-ff51-08d94047a9d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P+dTrom9SAk9KIqcfWSIQtMI7DvUyke8e80CO2NMh3YuecKmn6ZaPGG3kgOiKfVdmXLunnhR163k/q8kR3zMgtnbFNgWtS0yylFHMsAws+rJVHDMPrhOF7Dg48QKDKll9w/Mss+f0ybPY9tPEbFo8tznfqQoskrpQhH31jRtQllYaldvXyfYMISeCUcpJcU/eN8jhfne1gLdCOdG0IjTw9VxjHQLRbJOnZM7sBOAshEN9UAS7zMZDZ2bj3XVUcC382nYyWnF1QhURxFhXq5ChFYn6IN9qATaw31KQ/mD0aBhVqyYJI9TrjlsvIyU/1d/4L0pc63SWK3t/QmY5Qg2ssk6bKo3hGEVD7rl2vsOa9FKm4e9zKrpJT1cYl0guXwST4HElkEZ+WaVApJBfMFEbRYPpqHSDd/meBHsCG39GHKXHCFXpTzgbTEOiw1HsHGpihvoLLyXjRkxG7PiRL6lfWis79c2d6U11H7rbL6n/lJOMegs4Hi14QyiZOJ2YdKzV1lU1er/kGoj6XKKC2XQ8QKUcoe0VGsZkO9i+PIjYac3bFbx7jgcp5r+kKE+DDpn6vM2RQfj/ZKlBnggfXoS7RTuchDLhi8oKUvKyE/fHDYt7m5Fht8mVKC4d5oFAKlW03ba43euPrp9W4VViKenL8z8UYy0dZalKkjsC1XpWW7J84KRWXU7N7vsANVMrrabG0NXheo5nynnXCNl5VINwOI3Pb3jJ6WKljc1kNwz0ew=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966006)(36840700001)(36860700001)(9686003)(82740400003)(83380400001)(478600001)(186003)(70586007)(82310400003)(8936002)(47076005)(52536014)(86362001)(5660300002)(2906002)(8676002)(26005)(356005)(81166007)(53546011)(316002)(6506007)(7696005)(4326008)(336012)(110136005)(33656002)(70206006)(54906003)(55016002)(81973001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 06:31:47.8425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a70781a4-6f48-4431-72f6-08d94047bb51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2804

SGkgDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIEp1bHkgMywgMjAyMSA5OjI2IFBN
DQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgamJldWxpY2hAc3Vz
ZS5jb20NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47
IFdlaSBDaGVuDQo+IDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDgv
OV0geGVuL2FybTogY2hlY2sgYHhlbixzdGF0aWMtbWVtYCBwcm9wZXJ0eSBkdXJpbmcNCj4gZG9t
YWluIGNvbnN0cnVjdGlvbg0KPiANCj4gSGkgUGVubnksDQo+IA0KPiBPbiAwNy8wNi8yMDIxIDAz
OjQzLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBUaGlzIGNvbW1pdCBjaGVja3MgYHhlbixzdGF0
aWMtbWVtYCBkZXZpY2UgdHJlZSBwcm9wZXJ0eSBpbiAvZG9tVXgNCj4gPiBub2RlLCB0byBkZXRl
cm1pbmUgd2hldGhlciBkb21haW4gaXMgb24gU3RhdGljIEFsbG9jYXRpb24sIHdoZW4NCj4gPiBj
b25zdHJ1Y3RpbmcgZG9tYWluIGR1cmluZyBib290LXVwLg0KPiA+DQo+ID4gUmlnaHQgbm93LCB0
aGUgaW1wbGVtZW50YXRpb24gb2YgYWxsb2NhdGVfc3RhdGljX21lbW9yeSBpcyBtaXNzaW5nLA0K
PiA+IGFuZCB3aWxsIGJlIGludHJvZHVjZWQgbGF0ZXIuIEl0IGp1c3QgQlVHKCkgb3V0IGF0IHRo
ZSBtb21lbnQuDQo+ID4NCj4gPiBBbmQgaWYgdGhlIGBtZW1vcnlgIHByb3BlcnR5IGFuZCBgeGVu
LHN0YXRpYy1tZW1gIGFyZSBib3RoIHNldCwgaXQNCj4gPiBzaGFsbCBiZSB2ZXJpZmllZCB0aGF0
IGlmIHRoZSBtZW1vcnkgc2l6ZSBkZWZpbmVkIGluIGJvdGggaXMgY29uc2lzdGVudC4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+
IC0tLQ0KPiA+IGNoYW5nZXMgdjI6DQo+ID4gLSByZW1vdmUgcGFyc2luZyBwcm9jZWR1cmUgaGVy
ZQ0KPiA+IC0gY2hlY2sgdGhlIGNvbnNpc3RlbmN5IHdoZW4gYHhlbixzdGF0aWMtbWVtYCBhbmQg
YG1lbW9yeWAgYXJlIGJvdGgNCj4gPiBkZWZpbmVkDQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
DQo+IC0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gaW5kZXggMjgyNDE2ZTc0ZC4uNDE2
NmQ3OTkzYyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4g
PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiBAQCAtMjQyNCwyMyArMjQy
NCw0NyBAQCBzdGF0aWMgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tVShzdHJ1Y3QgZG9tYWluDQo+
ICpkLA0KPiA+ICAgew0KPiA+ICAgICAgIHN0cnVjdCBrZXJuZWxfaW5mbyBraW5mbyA9IHt9Ow0K
PiA+ICAgICAgIGludCByYzsNCj4gPiAtICAgIHU2NCBtZW07DQo+ID4gKyAgICB1NjQgbWVtLCBz
dGF0aWNfbWVtX3NpemUgPSAwOw0KPiA+ICsgICAgY29uc3Qgc3RydWN0IGR0X3Byb3BlcnR5ICpw
cm9wOw0KPiA+ICsgICAgYm9vbCBzdGF0aWNfbWVtID0gZmFsc2U7DQo+ID4gKw0KPiA+ICsgICAg
ZC0+bWF4X3BhZ2VzID0gfjBVOw0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIEd1ZXN0IFJBTSBj
b3VsZCBiZSBvZiBzdGF0aWMgbWVtb3J5IGZyb20gc3RhdGljIGFsbG9jYXRpb24sDQo+ID4gKyAg
ICAgKiB3aGljaCB3aWxsIGJlIHNwZWNpZmllZCB0aHJvdWdoICJ4ZW4sc3RhdGljLW1lbSIgcGhh
bmRsZS4NCj4gPiArICAgICAqLw0KPiA+ICsgICAgcHJvcCA9IGR0X2ZpbmRfcHJvcGVydHkobm9k
ZSwgInhlbixzdGF0aWMtbWVtIiwgTlVMTCk7DQo+ID4gKyAgICBpZiAoIHByb3AgKQ0KPiA+ICsg
ICAgew0KPiA+ICsgICAgICAgIHN0YXRpY19tZW0gPSB0cnVlOw0KPiA+ICsgICAgICAgIC8qIHN0
YXRpY19tZW1fc2l6ZSA9IGFsbG9jYXRlX3N0YXRpY19tZW1vcnkoLi4uKTsgKi8NCj4gPiArICAg
ICAgICBCVUcoKTsNCj4gPiArICAgIH0NCj4gDQo+IEkgd291bGQgcHJlZmVyIGlmIHRoZSBzdGF0
aWMgbWVtb3J5IGlzIGFsbG9jYXRlZCBjbG9zZSB0bw0KPiBhbGxvY2F0ZV9tZW1vcnkoKSBiZWxv
dy4gQUZBSUNULCB0aGUgcmVhc29uIHlvdSBhbGxvY2F0ZSBoZXJlIGlzIGJlY2F1c2UgeW91DQo+
IHdhbnQgdG8gaGF2ZSB0aGUgcHJvcGVydHkgIm1lbW9yeSIgb3B0aW9uYWwuDQo+IA0KPiBIb3dl
dmVyLCBJIGFtIG5vdCBlbnRpcmVseSBjb252aW5jZWQgdGhpcyBpcyBhIGdvb2QgaWRlYSB0byBt
YWtlIG9wdGlvbmFsLiBJdA0KPiB3b3VsZCBiZSBlYXNpZXIgZm9yIGEgcmVhZGVyIHRvIGZpZ3Vy
ZSBvdXQgZnJvbSB0aGUgZGV2aWNlLXRyZWUgaG93IG11Y2gNCj4gbWVtb3J5IHdlIGdpdmUgdG8g
dGhlIGd1ZXN0Lg0KPiANCg0KSG1tbSwgbm93IEkgdGhpbmsgbWF5YmUgSSB1bmRlcnN0YW5kIHdy
b25nbHkgd2hhdCB5b3Ugc3VnZ2VzdGVkIGluIHYxLg0KIg0KQ291bGQgd2UgYWxsb2NhdGUgdGhl
IG1lbW9yeSBhcyB3ZSBwYXJzZT8NCiINCkkganVzdCBzaW1wbHkgdGhpbmsgaXQgbWVhbnMgdGhl
IGNvZGUgc2VxdWVuY2UsIHB1dHRpbmcgYWxsb2NhdGlvbiBpbW1lZGlhdGVseQ0KYWZ0ZXIgcGFy
c2luZy4gOy8NCg0KUmUtaW52ZXN0aWdhdGluZyB0aGUgZG9jcyBvbiAibWVtb3J5IjoNCg0KIg0K
LSBtZW1vcnkNCg0KICAgIEEgNjQtYml0IGludGVnZXIgc3BlY2lmeWluZyB0aGUgYW1vdW50IG9m
IGtpbG9ieXRlcyBvZiBSQU0gdG8NCiAgICBhbGxvY2F0ZSB0byB0aGUgZ3Vlc3QuDQoiDQpJZiB5
b3UgcHJlZmVyICJtZW1vcnkiIG1hbmRhdGUsIHRoZW4gdGJoLCBpdCB3aWxsIG1ha2UgdGhlIGNv
ZGUNCmhlcmUgbW9yZSBlYXNpbHktcmVhZCwgbm8gaWZzLg0KQnV0IG1heWJlIEkgc2hhbGwgcHV0
IG1vcmUgaW5mbyBvbiBkb2NzIHRvIGNsYXJpZnkgdGhhdCBldmVuIHRob3VnaCB1c2VyIHVzaW5n
DQoieGVuLCBzdGF0aWMtbWVtIiB0byByZWZlciB0byBzdGF0aWMgbWVtb3J5IGFsbG9jYXRpb24s
IHRoZXkgc2hhbGwgc3RpbGwgdXNlDQoibWVtb3J5IiBwcm9wZXJ0eSB0byB0ZWxsIGhvdyBtdWNo
IG1lbW9yeSB3ZSBnaXZlIHRvIHRoZSBndWVzdC4NCg0KPiA+DQo+ID4gICAgICAgcmMgPSBkdF9w
cm9wZXJ0eV9yZWFkX3U2NChub2RlLCAibWVtb3J5IiwgJm1lbSk7DQo+ID4gLSAgICBpZiAoICFy
YyApDQo+ID4gKyAgICBpZiAoICFzdGF0aWNfbWVtICYmICFyYyApDQo+ID4gICAgICAgew0KPiA+
ICAgICAgICAgICBwcmludGsoIkVycm9yIGJ1aWxkaW5nIERvbVU6IGNhbm5vdCByZWFkIFwibWVt
b3J5XCIgcHJvcGVydHlcbiIpOw0KPiA+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAr
ICAgIH0gZWxzZSBpZiAoIHJjICYmIHN0YXRpY19tZW0gKQ0KPiA+ICsgICAgew0KPiA+ICsgICAg
ICAgIGlmICggc3RhdGljX21lbV9zaXplICE9IG1lbSAqIFNaXzFLICkNCj4gPiArICAgICAgICB7
DQo+ID4gKyAgICAgICAgICAgIHByaW50aygiTWVtb3J5IHNpemUgaW4gXCJtZW1vcnlcIiBwcm9w
ZXJ0eSBpc24ndCBjb25zaXN0ZW50IHdpdGgiDQo+ID4gKyAgICAgICAgICAgICAgICAgICAidGhl
IG9uZXMgZGVmaW5lZCBpbiBcInhlbixzdGF0aWMtbWVtXCIuXG4iKTsNCj4gPiArICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICAgICAgIH0gPiAtICAgIGtp
bmZvLnVuYXNzaWduZWRfbWVtID0gKHBhZGRyX3QpbWVtICogU1pfMUs7DQo+ID4gKyAgICBraW5m
by51bmFzc2lnbmVkX21lbSA9IHN0YXRpY19tZW0gPyAwIDogKHBhZGRyX3QpbWVtICogU1pfMUs7
ID4NCj4gPiAtICAgIHByaW50aygiKioqIExPQURJTkcgRE9NVSBjcHVzPSV1IG1lbW9yeT0lIlBS
SXg2NCJLQiAqKipcbiIsIGQtDQo+ID5tYXhfdmNwdXMsIG1lbSk7DQo+ID4gKyAgICBwcmludGso
IioqKiBMT0FESU5HIERPTVUgY3B1cz0ldSBtZW1vcnk9JSJQUkl4NjQiS0IgKioqXG4iLA0KPiA+
ICsgICAgICAgICAgICBkLT5tYXhfdmNwdXMsDQo+ID4gKyAgICAgICAgICAgIHN0YXRpY19tZW0g
PyBzdGF0aWNfbWVtX3NpemUgOiAoa2luZm8udW5hc3NpZ25lZF9tZW0pID4+DQo+ID4gKyAxMCk7
DQo+IA0KPiANCj4gSWYgd2UgbWFuZGF0ZSB0aGUgcHJvcGVydHkgIm1lbW9yeSIsIHRoZW4ga2lu
Zm8udW5hc3NpZ25lZF9tZW0gZG9lc24ndA0KPiBuZWVkIHRvIGJlIHRvdWNoZWQuIEluc3RlYWQs
IHlvdSBjb3VsZCBzaW1wbHkgY2hlY2sgdGhlDQo+IGtpbmZvLnVuYXNzaWduZWRfbWVtIGlzIGVx
dWl2YWxlbnQgdG8gc3RhdGljX21lbV9zaXplLg0KPiANCg0KVHJ1ZSwgdHJ1ZS4gDQoNCj4gPg0K
PiA+ICAgICAgIGtpbmZvLnZwbDAxMSA9IGR0X3Byb3BlcnR5X3JlYWRfYm9vbChub2RlLCAidnBs
MDExIik7DQo+ID4NCj4gPiAgICAgICBpZiAoIHZjcHVfY3JlYXRlKGQsIDApID09IE5VTEwgKQ0K
PiA+ICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiAtICAgIGQtPm1heF9wYWdlcyA9IH4w
VTsNCj4gPg0KPiA+ICAgICAgIGtpbmZvLmQgPSBkOw0KPiA+DQo+ID4gQEAgLTI0NTIsNyArMjQ3
Niw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb21VKHN0cnVjdCBkb21haW4gKmQs
DQo+ID4gICAgICAgLyogdHlwZSBtdXN0IGJlIHNldCBiZWZvcmUgYWxsb2NhdGUgbWVtb3J5ICov
DQo+ID4gICAgICAgZC0+YXJjaC50eXBlID0ga2luZm8udHlwZTsNCj4gPiAgICNlbmRpZg0KPiA+
IC0gICAgYWxsb2NhdGVfbWVtb3J5KGQsICZraW5mbyk7DQo+ID4gKyAgICBpZiAoICFzdGF0aWNf
bWVtICkNCj4gPiArICAgICAgICBhbGxvY2F0ZV9tZW1vcnkoZCwgJmtpbmZvKTsNCj4gPg0KPiA+
ICAgICAgIHJjID0gcHJlcGFyZV9kdGJfZG9tVShkLCAma2luZm8pOw0KPiA+ICAgICAgIGlmICgg
cmMgPCAwICkNCj4gPg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQoN
CkNoZWVycywNCg0KLS0NClBlbm55IFpoZW5nDQo=

