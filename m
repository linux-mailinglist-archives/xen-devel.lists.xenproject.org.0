Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1068502688
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 10:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305612.520680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfH0N-0004XY-Bs; Fri, 15 Apr 2022 08:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305612.520680; Fri, 15 Apr 2022 08:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfH0N-0004VC-7m; Fri, 15 Apr 2022 08:08:35 +0000
Received: by outflank-mailman (input) for mailman id 305612;
 Fri, 15 Apr 2022 08:08:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y4D=UZ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nfH0L-0004V6-Av
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 08:08:33 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe07::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ceb3bc0-bc93-11ec-a405-831a346695d4;
 Fri, 15 Apr 2022 10:08:31 +0200 (CEST)
Received: from AM7PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:20b:130::30)
 by DB6PR0802MB2357.eurprd08.prod.outlook.com (2603:10a6:4:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 08:08:28 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::66) by AM7PR03CA0020.outlook.office365.com
 (2603:10a6:20b:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Fri, 15 Apr 2022 08:08:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Fri, 15 Apr 2022 08:08:26 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Fri, 15 Apr 2022 08:08:25 +0000
Received: from cd53b77d6ea3.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E9F91C9-A4CC-4CE4-BE85-FB86F76AF5D6.1; 
 Fri, 15 Apr 2022 08:08:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd53b77d6ea3.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Apr 2022 08:08:15 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DBAPR08MB5704.eurprd08.prod.outlook.com (2603:10a6:10:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 08:08:11 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::b97d:6bc0:1ce6:ee38]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::b97d:6bc0:1ce6:ee38%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 08:08:11 +0000
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
X-Inumbo-ID: 3ceb3bc0-bc93-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goLkyhFvV4U6s/r0VYqj7UwQNHDJmEgbRbA6FqI02P0=;
 b=PFX3vjQaLISTxAAIjRxY6iY3KnJRG+yRA8UKjmOyDa3jJtH4umSyMDcGaglOHcNHlm+5nu71WAHB+R2A5mUx3ahVEmZcswMCERHDqvzHzt1IvusJ2BzjcqKeTw+C4+buA3UJE+IO4a6N/CTcN7BCNqeJTMeGIto3gNU1ZJ2hroU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+FuUY2dUrgEUhBmShTUL4WYhV/t8L6lkPBIVcg2uZ70qVRntyy1BmeH7UjkHiOl8yqXzcRgWvxhnwWfRtqdYMCZIS7hZx9NS6Y1Z3ar9s63xQgzjFPJ9KM5nEAEP5delmDadBF5tjSJCSdI+R0f0LeZeOt0NK+KFAwQU8RF1lvS1tn9N/sg0XsRhKEwq5cRZ0QtZhWompDgVvuRBiMC50YMziVvbxYAv81Jm1Myy9dbK9iHEnPatnzCgHcY1+lAEyC+eM8rqZLYUdejYCXtsHAqZwIeJR70Yq+dUGChwluJ9bAOsaYH4IzfuZSlQ8bw+g+/nnYKRT+gIe7pwnHlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goLkyhFvV4U6s/r0VYqj7UwQNHDJmEgbRbA6FqI02P0=;
 b=lth2uKdAqtIYrs3zaNX5fx6ikvg0lQEaoO1rWwqF/ElyGQfnAH7qpkzU/uI81V/6xCozcB/Lv5tDePeVJaAl+p+OUVXhfE3hJCvwxlV7BHk4UNq7qRCEoPIyEsWlLnHuQCvygg446ZnxUq+TqQT4GKRBMUQxcENp6p5luMQEfdWeQtxA3T33KPaG4aNkxcMAb6CALETLbAzYmFnKmP/iKiHpY/e11FLdrhcGuSVvSjNpraajMQOM3I8DcwE1fOK89wAiqkys5G+G8Rexiczjt2Aap8eyIB55wa3H/0OSxdaUcYG+VVDKJCwvVyzmuWT+H4OwDV5gencU3RSSpp+I8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goLkyhFvV4U6s/r0VYqj7UwQNHDJmEgbRbA6FqI02P0=;
 b=PFX3vjQaLISTxAAIjRxY6iY3KnJRG+yRA8UKjmOyDa3jJtH4umSyMDcGaglOHcNHlm+5nu71WAHB+R2A5mUx3ahVEmZcswMCERHDqvzHzt1IvusJ2BzjcqKeTw+C4+buA3UJE+IO4a6N/CTcN7BCNqeJTMeGIto3gNU1ZJ2hroU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Penny Zheng <penzhe01@a011292.shanghai.arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>
Subject: RE: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
Thread-Topic: [PATCH v1 02/13] xen/arm: introduce a special domain
 DOMID_SHARED
Thread-Index:
 AQHYNQ8BtyFeP2p9kkWMo7TCkVRwI6zE4SIAgADZHwCAA9xiAIAAvMUAgB0mG4CACUwasA==
Date: Fri, 15 Apr 2022 08:08:11 +0000
Message-ID:
 <DU2PR08MB7325F469140EFE83F2F8F91DF7EE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-3-Penny.Zheng@arm.com>
 <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com>
 <alpine.DEB.2.22.394.2203181443440.2910984@ubuntu-linux-20-04-desktop>
 <30a6ef6f-d37c-b66c-d5af-be2208766057@suse.com>
 <alpine.DEB.2.22.394.2203211256370.2910984@ubuntu-linux-20-04-desktop>
 <f8627956-8b01-6a5d-d69a-d2da16d74726@xen.org>
In-Reply-To: <f8627956-8b01-6a5d-d69a-d2da16d74726@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C3A6C2EEE8E32145B632735585840FB6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b7ac04a4-78c8-4e41-68be-08da1eb71e32
x-ms-traffictypediagnostic:
	DBAPR08MB5704:EE_|AM5EUR03FT064:EE_|DB6PR0802MB2357:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB23573C4F0750EA997074284DF7EE9@DB6PR0802MB2357.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lFsekelK1Yic2TjUnpATYnF8onU6D2n83QKOomqkKutoATuw5M7VRVkST2BOBIsO7riBi2l3my/W8cF6hpPlJSu0Wxa4Q4cTjeSfbBk0uxkaVPRXhxkl1Hj7a3O7AnRIsRg6QMOXV1XMK21wZqPWdNpVQZnn71tqGxCTsOWunMEI2GwlwiuSYE9dvJyHANjQSFadUT19F7i4kWMa1Mo5IMWWCqpuYQIEgvP9R34rIhCd2NLIhMmJ8aWucW93LjBEj7e3FzdP9sC3q4YlJy5BdTlVv+YplRZVP9OT6+3v+2panQj8xJ8ps5gAqU7uwu5XTThozla7uDoNXDfu7EHQS6JKfRpDEiFU/9RK0JZP/OHFWD3ZjOK4iCa+6xWM4yAe9KnNwApj05WmkvgvgbBrOTrtELWF3dYBvQOJBf3zv8P4V/7Ui5gFabImKfLDjvLe+875IeKE96w4kMjS3JGS/kpp/rL99b0JATY9OoBcnRao0SIkcpXLKF1i/jFgNUzrt2A6npvLuus0YILQYLIy26v39CdaCKS++d3xrw4SAK+atCw1EESBoS33pJd4wloiO25meigr/CslkM7th7fSY+klyVDXqV9vyPc+uxhK84mhaICfxaunbNtgEv4Di4nNzZZdH17g7v4ijDH5xTg9Xl2Mfv6chyhFQeeomNrrN7YVKqcBtBIwTtnqFt/tHfN05rIPxiYVwk/qugWHLdDR3w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(54906003)(110136005)(86362001)(316002)(83380400001)(9686003)(26005)(186003)(508600001)(122000001)(2906002)(6506007)(33656002)(5660300002)(53546011)(4326008)(64756008)(52536014)(66476007)(66946007)(66556008)(66446008)(55016003)(7696005)(8676002)(38070700005)(38100700002)(76116006)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5704
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0042a807-7521-4c78-3f05-08da1eb71597
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rWv3R0XBWuwgyBzN0LnlGL7CIk0svLkYbP6X1zdNrVYAG3OE1d/4jq1ChPKET87IMoa2ppO1ptWm14j9hyxOyd65swjAUmWPdCx1U0URKUfkrJI/b2k6xN+rd+bfvokzXrAJzdDWo+dL9QoySojXNbCTU5acI3HuIHDSSVaagviaICDLJ05mN/ENbxzhUHmNiRrBCwkWgHqmDe8Y9yrd//oRjuiWeBXRsLodpJtyjJxo0cLQVZgNTnIJhVzuTCUvtfzM5Sq9bj4LirIUWVSAHvj3LDLukuR4kjim5r54Wzrl08cdv1nHM1fN0eFIt6Q3Kb0yUHe7w3NBSSvYXhbRyZu/5jmODhPD07m5vPUSLncMySpuazgdZ4iSUK7pr0N6st7kinl/Hi69CoRq8/RGW8i8ewo5B7NiEgeQ3MWpdYrvlMZ5FNq7r8Ru+n7uF41mfXycPxBiJu5MQ+RnsVTJtgyU0s83fXEu9RgHqX4HSHeRF9nQkU+LwxUwblDLLl+xPfxToNjV1meq1J3pCwIzOxLBeeYL0fxyCwb95eMejMPg7XS+9cHIxSxqAwcP+Rr2MhyxiH9xHGhqymuKDbEo/xYHyODxQvwaORkpseGwEIfFLN0eGMR+Up/BLHa7c9IhGStv6BSp8k0az8aIRlwojYkHHG+x7vOreOMaK9RlACHXYJnNZFceTWV4IaVaHG1D
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(55016003)(9686003)(53546011)(7696005)(316002)(70206006)(6506007)(508600001)(70586007)(4326008)(356005)(26005)(81166007)(40460700003)(86362001)(33656002)(83380400001)(336012)(82310400005)(186003)(110136005)(2906002)(8676002)(54906003)(52536014)(8936002)(5660300002)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 08:08:26.0033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ac04a4-78c8-4e41-68be-08da1eb71e32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2357

SGkgSnVsaWVuIGFuZCBTdGVmYW5vDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIEFw
cmlsIDksIDIwMjIgNToxMiBQTQ0KPiBUbzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgSmFuIEJldWxpY2gNCj4gPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDYzog
UGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT47IFBlbm55
IFpoZW5nDQo+IDxwZW56aGUwMUBhMDExMjkyLnNoYW5naGFpLmFybS5jb20+OyBCZXJ0cmFuZCBN
YXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0K
PiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPjsNCj4gV2VpIExpdSA8d2xAeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDAyLzEzXSB4ZW4vYXJtOiBpbnRyb2R1Y2Ug
YSBzcGVjaWFsIGRvbWFpbg0KPiBET01JRF9TSEFSRUQNCj4gDQo+IEhpIFN0ZWZhbm8sDQo+IA0K
PiBPbiAyMS8wMy8yMDIyIDIwOjAzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+ID4gT24g
TW9uLCAyMSBNYXIgMjAyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+IE9uIDE4LjAzLjIwMjIg
MjI6NTAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gPj4+IE9uIEZyaSwgMTggTWFyIDIw
MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+Pj4+IE9uIDExLjAzLjIwMjIgMDc6MTEsIFBlbm55
IFpoZW5nIHdyb3RlOg0KPiA+Pj4+PiBJbiBjYXNlIHRvIG93biBzdGF0aWNhbGx5IHNoYXJlZCBw
YWdlcyB3aGVuIG93bmVyIGRvbWFpbiBpcyBub3QNCj4gPj4+Pj4gZXhwbGljaXRseSBkZWZpbmVk
LCB0aGlzIGNvbW1pdHMgcHJvcG9zZSBhIHNwZWNpYWwgZG9tYWluDQo+ID4+Pj4+IERPTUlEX1NI
QVJFRCwgYW5kIHdlIGFzc2lnbiBpdCAweDdGRjUsIGFzIG9uZSBvZiB0aGUgc3lzdGVtIGRvbWFp
bnMuDQo+ID4+Pj4+DQo+ID4+Pj4+IFN0YXRpY2FsbHkgc2hhcmVkIG1lbW9yeSByZXVzZXMgdGhl
IHNhbWUgd2F5IG9mIGluaXRpYWxpemF0aW9uDQo+ID4+Pj4+IHdpdGggc3RhdGljIG1lbW9yeSwg
aGVuY2UgdGhpcyBjb21taXRzIHByb3Bvc2VzIGEgbmV3IEtjb25maWcNCj4gPj4+Pj4gQ09ORklH
X1NUQVRJQ19TSE0gdG8gd3JhcCByZWxhdGVkIGNvZGVzLCBhbmQgdGhpcyBvcHRpb24gZGVwZW5k
cw0KPiBvbiBzdGF0aWMgbWVtb3J5KENPTkZJR19TVEFUSUNfTUVNT1JZKS4NCj4gPj4+Pj4NCj4g
Pj4+Pj4gV2UgaW50ZW5kcyB0byBkbyBzaGFyZWQgZG9tYWluIGNyZWF0aW9uIGFmdGVyIHNldHVw
X3ZpcnRfcGFnaW5nIHNvDQo+ID4+Pj4+IHNoYXJlZCBkb21haW4gY291bGQgc3VjY2Vzc2Z1bGx5
IGRvIHAybSBpbml0aWFsaXphdGlvbi4NCj4gPj4+Pg0KPiA+Pj4+IFRoZXJlJ3Mgbm90aGluZyBz
YWlkIGhlcmUsIGluIHRoZSBlYXJsaWVyIHBhdGNoLCBvciBpbiB0aGUgY292ZXINCj4gPj4+PiBs
ZXR0ZXIgYWJvdXQgdGhlIHNlY3VyaXR5IGFzcGVjdHMgb2YgdGhpcy4gVGhlcmUgaXMgYSByZWFz
b24gd2UNCj4gPj4+PiBoYXZlbid0IGJlZW4gYWxsb3dpbmcgYXJiaXRyYXJ5LCB1bi1zdXBlcnZp
c2VkIHNoYXJpbmcgb2YgbWVtb3J5DQo+ID4+Pj4gYmV0d2VlbiBkb21haW5zLiBJdCB3YW50cyBj
bGFyaWZ5aW5nIHdoeSBlLmcuIGdyYW50cyBhcmVuJ3QgYW4NCj4gPj4+PiBvcHRpb24gdG8gYWNo
aWV2ZSB3aGF0IHlvdSBuZWVkLCBhbmQgaG93IHlvdSBtZWFuIHRvIGVzdGFibGlzaA0KPiA+Pj4+
IHdoaWNoIGRvbWFpbnMgYXJlIC8gYXJlbid0IHBlcm1pdHRlZCB0byBhY2Nlc3MgYW55IGluZGl2
aWR1YWwgcGFnZQ0KPiBvd25lZCBieSB0aGlzIGRvbWFpbi4NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4g
SSdsbCBsZXQgUGVubnkgd3JpdGUgYSBmdWxsIHJlcGx5IGJ1dCBJJ2xsIGNoaW1lIGluIHRvIHRy
eSB0byBoZWxwDQo+ID4+PiB3aXRoIHRoZSBleHBsYW5hdGlvbi4NCj4gPj4+DQo+ID4+PiBUaGlz
IGlzIG5vdCBhcmJpdHJhcnkgdW4tc3VwZXJ2aXNlZCBzaGFyaW5nIG9mIG1lbW9yeSBiZXR3ZWVu
DQo+ID4+PiBkb21haW5zLCB3aGljaCBpbmRlZWQgaXMgY29uY2VybmluZy4NCj4gPj4+DQo+ID4+
PiBUaGlzIGlzIHN0YXRpY2FsbHktY29uZmlndXJlZCwgc3VwZXJ2aXNlZCBieSB0aGUgc3lzdGVt
DQo+ID4+PiBjb25maWd1cmF0b3IsIHNoYXJpbmcgb2YgbWVtb3J5IGJldHdlZW4gZG9tYWlucy4N
Cj4gPj4+DQo+ID4+PiBBbmQgaW4gZmFjdCBzYWZldHkgKHdoaWNoIGlzIGp1c3QgYSBkaWZmZXJl
bnQgYXNwZWN0IG9mIHNlY3VyaXR5KSBpcw0KPiA+Pj4gb25lIG9mIHRoZSBwcmltYXJ5IGdvYWxz
IGZvciB0aGlzIHdvcmsuDQo+ID4+Pg0KPiA+Pj4gSW4gc2FmZXR5LWNyaXRpY2FsIGVudmlyb25t
ZW50cywgaXQgaXMgbm90IGNvbnNpZGVyZWQgc2FmZSB0bw0KPiA+Pj4gZHluYW1pY2FsbHkgY2hh
bmdlIGltcG9ydGFudCBjb25maWd1cmF0aW9ucyBhdCBydW50aW1lLiBFdmVyeXRoaW5nDQo+ID4+
PiBzaG91bGQgYmUgc3RhdGljYWxseSBkZWZpbmVkIGFuZCBzdGF0aWNhbGx5IHZlcmlmaWVkLg0K
PiA+Pj4NCj4gPj4+IEluIHRoaXMgY2FzZSwgaWYgdGhlIHN5c3RlbSBjb25maWd1cmF0aW9uIGtu
b3dzIGEgcHJpb3JpIHRoYXQgdGhlcmUNCj4gPj4+IGFyZSBvbmx5IDIgVk0gYW5kIHRoZXkgbmVl
ZCB0byBjb21tdW5pY2F0aW9uIG92ZXIgc2hhcmVkIG1lbW9yeSwgaXQNCj4gPj4+IGlzIHNhZmVy
IHRvIHByZS1jb25maWd1cmUgdGhlIHNoYXJlZCBtZW1vcnkgYXQgYnVpbGQgdGltZSByYXRoZXIN
Cj4gPj4+IHRoYW4gbGV0IHRoZSBWTXMgYXR0ZW1wdCB0byBzaGFyZSBtZW1vcnkgYXQgcnVudGlt
ZS4gSXQgaXMgZmFzdGVyIHRvby4NCj4gPj4+DQo+ID4+PiBUaGUgb25seSB3YXkgdG8gdHJpZ2dl
ciB0aGlzIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGNvbmZpZ3VyYXRpb24NCj4gPj4+IHNob3VsZCBi
ZSB2aWEgZGV2aWNlIHRyZWUsIHdoaWNoIGlzIGF0IHRoZSBzYW1lIGxldmVsIGFzIHRoZSBYU00N
Cj4gPj4+IHJ1bGVzIHRoZW1zZWx2ZXMuDQo+ID4+Pg0KPiA+Pj4gSG9wZWZ1bGx5IEkgbWFkZSB0
aGluZ3MgY2xlYXJlciBhbmQgbm90IG11cmtpZXIgOi0pDQo+ID4+DQo+ID4+IEl0IGFkZHMgc29t
ZSBoZWxwZnVsIGJhY2tncm91bmQsIHllcywgYnV0IGF0IHRoZSBzYW1lIHRpbWUgaXQgZG9lc24n
dA0KPiA+PiBhZGRyZXNzIHRoZSBzZWN1cml0eSBjb25jZXJuIGF0IGFsbDogSG93IGFyZSBhY2Nl
c3MgcGVybWlzc2lvbnMNCj4gPj4gbWFuYWdlZCB3aGVuIHRoZSBvd25pbmcgZG9tYWluIGlzIGEg
c3BlY2lhbCBvbmU/IEkgaGF2ZW4ndCBzcG90dGVkDQo+ID4+IGFueSByZWNvcmRpbmcgb2YgdGhl
IGRvbWFpbnMgd2hpY2ggYXJlIGFjdHVhbGx5IHBlcm1pdHRlZCB0byBtYXAgLw0KPiA+PiBhY2Nl
c3MgdGhlIHBhZ2VzIGluIHF1ZXN0aW9ucy4gKEJ1dCBvZiBjb3Vyc2UgSSBhbHNvIG9ubHkgbG9v
a2VkIGF0DQo+ID4+IG5vbi1Bcm0tc3BlY2lmaWMgY29kZS4gSSdkIGV4cGVjdCBzdWNoIGNvZGUg
bm90IHRvIGxpdmUgaW4gYXJjaC0NCj4gPj4gc3BlY2lmaWMgZmlsZXMuKQ0KPiA+DQo+ID4gQWxs
IHRoaXMgc3RhdGljIG1lbW9yeSBzaGFyaW5nIGlzIHN0YXRpY2FsbHkgZG9uZSBhdCBfX2luaXQg
dGltZSBvbmx5Lg0KPiA+IEl0IHNob3VsZCBub3QgYmUgcG9zc2libGUgdG8gdHJpZ2dlciBhbnkg
ZnVydGhlciBtZW1vcnkgc2hhcmluZyBhdA0KPiA+IHJ1bnRpbWUgKGlmIHRoZXJlIGlzLCB0aGF0
IHdvdWxkIGJlIGEgYnVnKS4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIGNvZGUsIGdldF9wZ19vd25l
cigpIHdpbGwgYmUgYWJsZSB0byBoYW5kbGUgRE9NSURfU0hBUkVELg0KPiBTbyBhbnlvbmUgdGhh
dCBpcyBwZXJtaXR0ZWQgdG8gYWNjZXNzIERPTUlEX1NIQVJFRCB3aWxsIGJlIGFibGUgdG8gbWFw
IGFueQ0KPiBtZW1vcnkgcmVnaW9uIGF0IHJ1bnRpbWUuDQo+IA0KPiA+IFRoZXJlIGFyZSBubyBu
ZXcgaW50ZXJmYWNlcyBmb3IgdGhlIGd1ZXN0IHRvIG1hcCB0aGlzIG1lbW9yeSBiZWNhdXNlDQo+
ID4gaXQgaXMgYWxyZWFkeSAicHJlLW1hcHBlZCIuDQo+IA0KPiBJdCBjYW4gdmlhIFhFTk1BUFNQ
QUNFX2dtZm5fZm9yZWlnbiAoYXNzdW1pbmcgcHJvcGVyIHBlcm1pc3Npb24pLg0KPiANCg0KQ29y
cmVjdCBtZSBpZiBJJ20gd3Jvbmc6DQpUaGUgZXhpc3RpbmcgWEVOTUFQU1BBQ0VfZ21mbl9mb3Jl
aWduIG9ubHkgYWxsb3dzIHByaXZpbGVnZWQgRG9tMCB0byBtYXANCm1lbW9yeSBwYWdlcyBmcm9t
IG9uZSBmb3JlaWduIERvbVUgdG8gaXRzZWxmLiBTbyBJdCBjYW4gaGFwcGVuIHRoYXQgRG9tMCBp
cw0KdXNpbmcgWEVOTUFQU1BBQ0VfZ21mbl9mb3JlaWduIHRvIChtYWxpY2lvdXNseT8pIGFjY2Vz
cyBzaGFyZWQgbWVtb3J5IG93bmVkDQpieSBET01JRF9TSEFSRUQsIGFuZCBmb3Igbm93IG9ubHkg
RG9tMCBjb3VsZC4NCg0KU28sIG1heWJlIHdlIHNob3VsZCBlbmhhbmNlIHRoZSBjaGVjayBvZiB4
c21fbWFwX2dtZm5fZm9yZWlnbigpIHRvIGZvcmJpZCB0aGUNCmFjY2VzcyB0byBET01JRF9TSEFS
RUQsIGhtbSwgYnV0IHN0YXRpYyBzaGFyZWQgbWVtb3J5IHJlZ2lvbiBjb3VsZCBhY3R1YWxseSBi
ZSBvd25lZA0KYnkgYW55IGFyYml0cmFyeSBkb21haW4uDQoNClNvLCBob3cgYWJvdXQgd2UgYWRk
IHJlc3RyaWN0aW9uIG9uIHRoZSBwYWdlIGl0c2VsZj8NClBhZ2VzIG9mIHN0YXRpYyBzaGFyZWQg
bWVtb3J5IHJlZ2lvbiBhcmUgc3RhdGljIG1lbW9yeSh3aXRoIFBHQ19yZXNlcnZlZCBmbGFnIG9u
KSwNCnNvIG1heWJlIHdlIGNvdWxkIHJlc3RyaWN0IFhFTk1BUFNQQUNFX2dtZm5fZm9yZWlnbiB0
byBhY2Nlc3MgYW55IFBHQ19yZXNlcnZlZCBwYWdlcz8NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0K
DQpDaGVlcnMsDQoNCi0tDQpQZW5ueSBaaGVuZw0KPiBKdWxpZW4gR3JhbGwNCg==

