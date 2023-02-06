Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5068C095
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490525.759265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2uf-0006cL-VH; Mon, 06 Feb 2023 14:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490525.759265; Mon, 06 Feb 2023 14:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2uf-0006a9-S3; Mon, 06 Feb 2023 14:56:09 +0000
Received: by outflank-mailman (input) for mailman id 490525;
 Mon, 06 Feb 2023 14:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzyl=6C=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pP2ue-0006a3-9t
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:56:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fad1d1b-a62e-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 15:56:02 +0100 (CET)
Received: from DB7PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:52::30)
 by DBBPR08MB6298.eurprd08.prod.outlook.com (2603:10a6:10:1f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:55:57 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::61) by DB7PR02CA0017.outlook.office365.com
 (2603:10a6:10:52::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 14:55:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 14:55:56 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Mon, 06 Feb 2023 14:55:56 +0000
Received: from 3e93cb7afcfd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 337D8818-0729-4996-89E0-AC142F1B8222.1; 
 Mon, 06 Feb 2023 14:55:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3e93cb7afcfd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Feb 2023 14:55:49 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB10112.eurprd08.prod.outlook.com (2603:10a6:20b:64e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:55:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 14:55:48 +0000
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
X-Inumbo-ID: 5fad1d1b-a62e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkCoKdqI9O51GEANP5YqtjyZlKvcMxG7gGMEGuJdtak=;
 b=qgTJ9cErhS6RdEK91Dwy8gqwB+kBdGtmyBgWK0sIr1zo7EYHp6zo37NgwnZtk2fUH3eHkzcDAU2fGVn2iWoomVHuWIRElUd+WKXnbS17bQnooWs7d6uIU3h2NMu6yfskA6FpeHDyaV7HIaWrR6ryucT9fPAM6KnbbKOC6XDKNwA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: abd9b1982ef7bdcc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVCTsS0YP6IAu1j/8gJFiMabtdFrJ59ETJ2ecCoWrcTTex93z/KiCsJIf/Ls6BuBUkgsfeDqYMFb/Sc1Y3BANc/IsuqCOFCtcZN9q3wOzPAqCOaYTfZD8pjsmKBqyDDbpCAtHvTzXnDHM0GqS2V14FA5KVWjVpb3Q+I1jduX7PN3T0Cig/+Ahb+MF4nahj8sAKzUH0QvQ2UTfT3GSJGVlZc+U/IfOXdiRf5wldRyr6OEbjgjtfgnV9EGJXP0lJRYlXSdVJJXpcky3jKdW9YPqwVdJCo+TC2WGwXRelP2YUbVXy6SLCAXunmWASmS2FcZAgEaqyoboEouIjrkV6P2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkCoKdqI9O51GEANP5YqtjyZlKvcMxG7gGMEGuJdtak=;
 b=WzyAVN68liEeUvG6eRNIR5Ev5gu0whNINCCds0GZkQFkdp7OcPsdEFpJpKjEIdjDFxKq1SZxzsB4Harm6IJNfTm52RZlcOFLlhtC5exnxUHtikKisAIEUw0cH2qVeDYmgIzXSC6TdsWIdwk2GjwpyOTE54M28d+3ZT4uGuVJiP9o5cC5MPyTpEEcld+zhvYjySKRlk1lS7z1Co0ZaqQWnRarSAqauQoBtlGXHnTYlNSRsbwRngeKXs2iBnS982z0FtGtJOdWzwrKi+f7utdWjfmaBabUZhaIzCKJ4mfGKYDgtkvmD3blAKwhPIgiBgqf/sWbWfVyDDs1rk0goY209g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkCoKdqI9O51GEANP5YqtjyZlKvcMxG7gGMEGuJdtak=;
 b=qgTJ9cErhS6RdEK91Dwy8gqwB+kBdGtmyBgWK0sIr1zo7EYHp6zo37NgwnZtk2fUH3eHkzcDAU2fGVn2iWoomVHuWIRElUd+WKXnbS17bQnooWs7d6uIU3h2NMu6yfskA6FpeHDyaV7HIaWrR6ryucT9fPAM6KnbbKOC6XDKNwA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 2/2] xen/device_tree: remove incorrect and unused
 dt_irq() and dt_irq_flags() macros
Thread-Topic: [PATCH v3 2/2] xen/device_tree: remove incorrect and unused
 dt_irq() and dt_irq_flags() macros
Thread-Index: AQHZOAMXy1ML+LQFIECFNoctrCf/pa7CAoAAgAACbgCAAAEwgA==
Date: Mon, 6 Feb 2023 14:55:47 +0000
Message-ID: <D83DC60A-267B-49B5-A2EF-A311BE0C6DF3@arm.com>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-3-burzalodowa@gmail.com>
 <C6297387-8616-43BE-9640-3AE99BE164D6@arm.com>
 <1217f21a-5734-26eb-4c32-cc92a7b25f69@gmail.com>
In-Reply-To: <1217f21a-5734-26eb-4c32-cc92a7b25f69@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB10112:EE_|DBAEUR03FT008:EE_|DBBPR08MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: ed221aaf-f7eb-4c72-4b0e-08db085240a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2G1BJ6kZeh7ya/71GVWEuig9jdAT32CpAyV9A9TIuTFpIKTZ+cQbnVD8qq/jwZL5Aap4smnuZXxkdm/Tz4FGJILT8rHZ6TB0noKPPtIYdb2ADFup+x3vwfwOu5yKO35qzShYJ5zNs3+A0cbf1ltlyQfWLp22IJ/uViHN8lBsJHx95SXOkOwuH404YnutA0aqBjkiL2wWDFnHtXw+46tfIwvODhsZ0gOgvlZP/7yvjLtd57LrOlA+Znu5+8dwxfxYtp6Iy2Y0pSFV76yh5fN0haNdkM4GyjCg0Qpy+4Y3CU1uI5IP47FG2XcJuCKS5qwJIiXsNnTg/K7YRAY+gqg4sqmPECFsNxU29WPTyqrFQQvsxSyhmQpIPfpgV9p4ROw69pebE0yMdurhhF9d9Nq3JwRVODKpauTkblrXHULBlzi/hpCC+Rd8QKRhowBTpIIt5nPJA7/4eGYGgXdjnruaOS6qNI9omx++efoTDt+r0P7atWJpLnTrAY7hQb92mv0T9TRxvbf7bt1+iJBfTR9C5og1ReNzla6f2eVlqXMom68Gw60IELIX8UYqIauLcF3B6V8Ug1a3Pi/bybIZFt6BC1sIleAotqABXHROsOFlfkfD+MyFLztxivA4Pufq2qWpWkL8xdLOMQWE6OzIC5mTCVVXRkZYOgFIG/58xpaTyOi1QV/G5I59lQT7CRlqYeXp189mY2dE40AjdpwS1IQbNwHGTLeatFz4s0c7ek7yA0o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199018)(4326008)(6916009)(8676002)(41300700001)(91956017)(76116006)(66556008)(66946007)(64756008)(66446008)(66476007)(316002)(8936002)(83380400001)(36756003)(186003)(6512007)(122000001)(4744005)(2616005)(26005)(71200400001)(2906002)(33656002)(5660300002)(54906003)(6506007)(6486002)(53546011)(86362001)(38070700005)(478600001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A2F039F8FB4E1418D3165F15ECF9D0C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10112
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75e1b702-fb75-408c-a2bd-08db08523b49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lFhRmItmdtshshZf5O5OuCQAjZYNtT0VMs07Hi3wnPelOeow4zXxLKukS5vIKHAm2X3cgQsz6BE/3Yw1mGUqhO9nh3s7ZaHZi+Cir5wXU/Zx45I5tPp+H0ZFF2i/VH7U/dc5nAeTo1zatzVgZIocMaZG3hVHOhVitxCGidqnjMBNEkBuuy3qn1T7+FeWlh3FSQ1yldecsQlXSDu/lAWWq7lT6486n/1+wNbSoUCgtnXkryLma5P2APyfAbe08V9QY/pCvY8+h05A407eWNwiEmr/Usqh449/UnBkc+j2fm7jDofHOQqhgK3P4cwC+1kBQQ+pmMbCXOZGOmIRr83BkNnq5ZQvCeVvHh6Ea/WM6Rey55yfGEOanl0m4Ho8tMufp9L5wyYpmYeFFLyQ0va6sFkAkCI8Nus5u1cpSPGonXOwWFAjJXg4CXimk8YPhRnaIldyQj+YDv3ADvXJh7HLfoAsWc1ErV6Mg9Tf7jQ9aPaNbJcYlnsizsz09D982RlcpuBRqqV1HkgvsQdi7q70Pjefp74ELFOrszfgxXFoUySIOESj+eJaaN+BQGXjXLnHJ5WvtwyxMuRULrrlRSIIySPWQF6VAowL1CvZ+5n9DjP7zVqTrpShyKy2gzeea2DM3LtjXwSNlcTQWuqJ4yAqqfU2zp9Q2k7UgXK8kWjPGVzvMQh04xs6DR7SKBLU4d7z3K+aSyAJsk8k4z44wqig7w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199018)(36840700001)(46966006)(40470700004)(26005)(6486002)(478600001)(6512007)(186003)(8936002)(53546011)(2616005)(40480700001)(5660300002)(41300700001)(6862004)(336012)(6506007)(54906003)(316002)(356005)(70206006)(70586007)(8676002)(33656002)(83380400001)(40460700003)(36860700001)(81166007)(4326008)(47076005)(82740400003)(86362001)(82310400005)(2906002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 14:55:56.7488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed221aaf-f7eb-4c72-4b0e-08db085240a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6298

DQoNCj4gT24gNiBGZWIgMjAyMywgYXQgMTQ6NTEsIFhlbmlhIFJhZ2lhZGFrb3UgPGJ1cnphbG9k
b3dhQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhDQo+IA0KPiBPbiAyLzYvMjMgMTY6
NDIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gMyBGZWIgMjAyMywgYXQgMTk6MDksIFhl
bmlhIFJhZ2lhZGFrb3UgPGJ1cnphbG9kb3dhQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g
TWFjcm8gZHRfaXJxKCkgaXMgYnJva2VuIGJlY2F1c2UgdGhlIG1hY3JvIHBhcmFtZXRlciBoYXMg
dGhlIHNhbWUgbmFtZSB3aXRoDQo+Pj4gdGhlIHN0cnVjdCBkdF9pcnEgbWVtYmVyICJpcnEiLg0K
Pj4gSeKAmW0gbm90IHN1cmUgYWJvdXQgdGhlIHdvcmRpbmcg4oCcYnJva2Vu4oCdLCBpdCBzaG91
bGQgd29yayBhbnl3YXkgb3IgYW0gSSB3cm9uZz8NCj4gDQo+IE5vLCBpdCB3b24ndCB3b3JrIGJl
Y2F1c2UgdGhlIHN0cnVjdHVyZSBtZW1iZXIgd2lsbCBiZSBzdWJzdGl0dXRlZCBhcyB3ZWxsIGJ5
IHRoZSBtYWNybyBhcmd1bWVudCAoZm9yIGluc3RhbmNlIGR0X2lycShibGFoKSB3aWxsIGJlIHJl
cGxhY2VkIGJ5IChibGFoKS0+YmxhaCkuDQoNClllcyB5b3UgYXJlIHJpZ2h0LCBJIHdhcyByZWFk
aW5nIGl0IGluIHRoZSB3cm9uZyB3YXkhIA0KDQo+IA0KPj4+IE1hY3JvIGR0X2lycV9mbGFncygp
IGlzIGJyb2tlbiBhcyB3ZWxsIGJlY2F1c2Ugc3RydWN0IGR0X2lycSBoYXMgbm8gbWVtYmVyDQo+
Pj4gbmFtZWQgImZsYWdzIi4NCj4+IFllcyB0aGlzIGRlcGVuZHMgaWYgdGhlIG1hY3JvIHdhcyBt
ZWFudCB0byBhY2Nlc3MgdGhlIHN0cnVjdHVyZSBkdF9pcnEsIEnigJl2ZSBoYWQgYSBsb29rDQo+
PiBvbiB0aGUgY29tbWl0IGludHJvZHVjaW5nIGl0IGJ1dCBJIGNvdWxkIG5vdCBmaWd1cmUgb3V0
IHRoZSB1c2FnZS4NCj4gDQo+IEdpdmVuIHRoZSBtYWNybyBuYW1lLCBJIGFzc3VtZWQgdGhhdCBp
dCB3YXMgbWVhbnQgdG8gYmUgdXNlZCBmb3IgYWNjZXNzaW5nIGEgZHRfaXJxIGZpZWxkLg0KDQpZ
ZXMgSSB3b3VsZCBjb21lIHRvIHRoZSBzYW1lIGNvbmNsdXNpb24NCg0KDQo=

