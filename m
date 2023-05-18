Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417C7080FA
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 14:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536312.834510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcXb-0001dY-QV; Thu, 18 May 2023 12:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536312.834510; Thu, 18 May 2023 12:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcXb-0001b4-NS; Thu, 18 May 2023 12:15:31 +0000
Received: by outflank-mailman (input) for mailman id 536312;
 Thu, 18 May 2023 12:15:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ne9c=BH=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1pzcXZ-0001aw-EV
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 12:15:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac7a0226-f575-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 14:15:27 +0200 (CEST)
Received: from AS8PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:20b:313::15)
 by AS4PR08MB8191.eurprd08.prod.outlook.com (2603:10a6:20b:58e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 12:14:56 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::4d) by AS8PR04CA0070.outlook.office365.com
 (2603:10a6:20b:313::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 12:14:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 12:14:55 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 18 May 2023 12:14:55 +0000
Received: from 0187f21d750b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2086682D-466B-4082-9938-9A029360597A.1; 
 Thu, 18 May 2023 12:14:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0187f21d750b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 May 2023 12:14:49 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS8PR08MB8970.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.34; Thu, 18 May
 2023 12:14:47 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb%7]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 12:14:47 +0000
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
X-Inumbo-ID: ac7a0226-f575-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mevuXsc0WtbFofj+MJrmTbX5VjZEsM7SXqUlYUKj04M=;
 b=dSblu11b5JhcQHf8Ds+GAFCZf9ztmu8Q3ef9T4QPm98qxwpCTA8jw+HnKniBHnwKGFkigzGdDbTY7JiioR6fVgjJMPOwtyol4/xpUKMsKpcLwm5BOX4t2Ht2Ktp2ypU1dWspTdTn32RWHgci3YjWLjCNzAalHrWwhIzUccvZ4EA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef361fdedccfa0c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCV4j+EwJSMSv67xP1iIhr4xnuYFqAeuARUo91wokoOuZvjMVdb6Hq9W0+WEPDMLVe/eTw+RRLu36emEtVzWqrMrQwNGl1d0+Cm01Y3SHLOlf+s29n2l3PX6BztrnH0vl+2u/Mz2gX3KUmRutla9lfnHFbZ55I0jgJRZvBkJ5KO/6EfSkJqd66LBk5XYSxsJp6QZWgQDYKyFp2YiIa2eJsflEpaygmEFHtNeWOyMdE+kKl8a36xRf36SPvJeFOvNq0OOuA34uPQMX318SuetIdzwvxzcp9ovJYryerx3WBWI7mB1uUa+n7KeLIZfu8DmKRbrVFKFhHAAUWJ4fSh01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mevuXsc0WtbFofj+MJrmTbX5VjZEsM7SXqUlYUKj04M=;
 b=DMfpBY9Kj0Il/YXAlrM+IfLEQh7hARiKt8zeew9J+GMtUbue5dfKnvEvk63ukelDp2uBjiave4e5h6ULews20vgjBTeMf+aM867C1FLuNUWEbqOUz+LVVEwz7+Aqpj08sOH25eMkr4Zaai/NNt+W8J//c0DUXJzft5QTI7lco518Pf+Gz1BQvRSidq0GoeYuk9mX/PPEH6D/zoC0nCXamuf+26wUtI2vkV4co7YW+wwCSV40AHa5d64vCBrb+9/rbrswXc3j1wa7pZKK0QzdezrsaHXZ2uoKizd+oVdZcipQHKZRLno19+Vcv1zjuHtNe+VbkjHwpCy/8XpoTJzu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mevuXsc0WtbFofj+MJrmTbX5VjZEsM7SXqUlYUKj04M=;
 b=dSblu11b5JhcQHf8Ds+GAFCZf9ztmu8Q3ef9T4QPm98qxwpCTA8jw+HnKniBHnwKGFkigzGdDbTY7JiioR6fVgjJMPOwtyol4/xpUKMsKpcLwm5BOX4t2Ht2Ktp2ypU1dWspTdTn32RWHgci3YjWLjCNzAalHrWwhIzUccvZ4EA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] pci: fix pci_get_pdev() to always account for the segment
Thread-Topic: [PATCH] pci: fix pci_get_pdev() to always account for the
 segment
Thread-Index: AQHZiXevyYqrsZqMy0C54Y28mmUHD69f8ZgA
Date: Thu, 18 May 2023 12:14:46 +0000
Message-ID: <7661952A-477F-46C8-8F8D-AD2D7D81A4EE@arm.com>
References: <20230518105738.16695-1-roger.pau@citrix.com>
In-Reply-To: <20230518105738.16695-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AS8PR08MB8970:EE_|AM7EUR03FT020:EE_|AS4PR08MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ec2c36-9886-4040-0182-08db57997dfd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ar06aml/Wphd90ZFTOBIcIXAEG0t0JSP0+gHauqVlhOdcr7pXH92t/blJZlJP4ukbNvF+6/PM+0qgDSHNq218tPSQIgZ4UwPlrA0mNKhU7oxG9xrNjF+ypHaI0s1bSY26aYssYErxYJDEJwcXBYHp8a48ZA50g9q0hA6l6f1v+tLuvdffHGV4m+Bgdc9PONNcQrxv6/tlSV+UTShSUuRcAUY8DoErGggSfRGn/6YfkveL5lwVKvQMBrkwDsr/Eetxvdn8wdqs/iAKn4J0nITUDzt6EWx3vUByH5IIL3tzmEbNxlRLPSkYtRjc8XQkPoGFdi5Y99CYZ+yMmsTSME8nY68AnwWJniFBL7X9S4utEbmU78IU8E0JbZ618r8EUtWxsXQURy01UROYG8PzAzyCO07lzcJJ1OVE4PRpszhRFJarwiYuIKyuNm+N13NeQgl0qQVQp2b6geUoyNxM4NKgY993h26+tO96v6KI6y25Mc5SdhXekIRb7JLoVNlfCDznynLznKydh85K+CPpPHqqR7oLgBcnhfiDV9c1yXa/ko2RGPKpjNiD3vqpXjIuIiwMHo+yskuxowcV8M6EuqKfXoBHcwlc49obU1xukyy/RxC6KDtIp/j8dEtdyP1tHE1c67PmatKe2ZDd90EoJO0uA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199021)(316002)(8936002)(91956017)(4326008)(76116006)(66556008)(86362001)(6916009)(15650500001)(5660300002)(66446008)(8676002)(38070700005)(33656002)(66476007)(64756008)(54906003)(38100700002)(122000001)(66946007)(2906002)(4744005)(41300700001)(478600001)(6486002)(2616005)(71200400001)(36756003)(6506007)(6512007)(83380400001)(186003)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <52CAB91DE1F7F1438EA9A10E13C5219C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8970
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b3866c1-9646-4360-04b9-08db579978bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ls1+oNPIn9QOL5A2BwGmflXg9BJ2bd1m6JCIE8oBe3SfWWh/BXkk4bQqNLlPV8j8ao4jj/U1g8yeUbwqV+0jh+SSSNRIWtXrWk4rypyZC74URfdFNuhicwZFpM+jzhzA5w6268YpEFk2UNp3zr83hmBtDXRN03QzDGrUfewZZlQuBY1hvp0D6DhOaz/7f7zySTVYIXUxJkQi2NX+6Z2v23EKwAfdMMn39ZIaFLGtGeFiQ0T3cAzFDk/GDR4jFE4slyxu6LkyVb1yYTNty/wOjMls0hMzQ3xfcH8rTazuRX8lu1ofh7NYz0SgA5SUmuGCzlAZfbgLFkNOgs6g4qh2yGDGaPUO54kHLH1fo06MBREvEixHTImyuJnrKTq6axc+eT1N7dfFVu/geVTSNDryTXvDU+kD5cQiA7arWxbuxA9IFCfd6vHQsu2gjTuwCzidlGlwZITzZpOLV6StECBmp5IWqlKU2R4V20KqcNAays7aC5FIOX59poqBzyuBlc6xSvyHNs7jJ+fCecUwg209Go7ZSYwY9JBdkFMaMocKYHVLLEk501NOlTDSLS3AgjOqMu1oB4mCqtA96mztaCHijsD8GA+nGNIfxh71srJ+yJRLvIhCvsbJvC4ANeUzw0ONPN36ahLJ7yLzs5i1YGMZwHD4/IYAg7O9cSxvHf/AZMr221sL3BvYn1xnUyG4keqoggqOjvVbPydWkrAShfNCfJDOEFFLVcMyvGvYAxGHqfQeOusHuSb8WcFHnjac9BZA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(6486002)(40480700001)(40460700003)(53546011)(6506007)(6512007)(186003)(26005)(5660300002)(82310400005)(8676002)(86362001)(41300700001)(33656002)(8936002)(6862004)(356005)(4326008)(82740400003)(70586007)(316002)(81166007)(54906003)(336012)(70206006)(2616005)(36860700001)(2906002)(4744005)(36756003)(15650500001)(478600001)(83380400001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 12:14:55.7778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ec2c36-9886-4040-0182-08db57997dfd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8191

SGkgUm9nZXIsDQoNCj4gT24gMTggTWF5IDIwMjMsIGF0IDExOjU3IGFtLCBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFdoZW4gYSBkb21haW4gcGFy
YW1ldGVyIGlzIHByb3ZpZGVkIHRvIHBjaV9nZXRfcGRldigpIHRoZSBzZWFyY2gNCj4gZnVuY3Rp
b24gd291bGQgbWF0Y2ggYWdhaW5zdCB0aGUgYmRmLCB3aXRob3V0IHRha2luZyB0aGUgc2VnbWVu
dCBpbnRvDQo+IGFjY291bnQuDQo+IA0KPiBGaXggdGhpcyBhbmQgYWxzbyBhY2NvdW50IGZvciB0
aGUgcGFzc2VkIHNlZ21lbnQuDQo+IA0KPiBGaXhlczogOGNmNmUwNzM4OTA2ICgnUENJOiBzaW1w
bGlmeSAoYW5kIHRodXMgY29ycmVjdCkgcGNpX2dldF9wZGV2eyxfYnlfZG9tYWlufSgpJykNCj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQog
DQpJIHRoaW5rIHRoZSBjb3JyZWN0IGZpeGVzIHRhZyBpczoNCkZpeGVzOiBhMzdmOWVhN2E2NTEg
KCJQQ0k6IGZvbGQgcGNpX2dldF9wZGV2eyxfYnlfZG9tYWlufSgpIikNCg0KV2l0aCB0aGF0Og0K
UmV2aWV3ZWQtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KIA0KDQpSZWdh
cmRzLA0KUmFodWw=

