Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01EE55F986
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 09:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357594.586244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6SSi-0004ni-9Y; Wed, 29 Jun 2022 07:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357594.586244; Wed, 29 Jun 2022 07:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6SSi-0004kG-5L; Wed, 29 Jun 2022 07:50:12 +0000
Received: by outflank-mailman (input) for mailman id 357594;
 Wed, 29 Jun 2022 07:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlzK=XE=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o6SSg-0004kA-CS
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 07:50:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 186e4e0e-f780-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 09:50:08 +0200 (CEST)
Received: from DB6PR07CA0193.eurprd07.prod.outlook.com (2603:10a6:6:42::23) by
 VI1PR08MB2704.eurprd08.prod.outlook.com (2603:10a6:802:1b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Wed, 29 Jun 2022 07:50:02 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::35) by DB6PR07CA0193.outlook.office365.com
 (2603:10a6:6:42::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.7 via Frontend
 Transport; Wed, 29 Jun 2022 07:50:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 07:50:01 +0000
Received: ("Tessian outbound 514db98d9a19:v121");
 Wed, 29 Jun 2022 07:50:01 +0000
Received: from f12120776115.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 008B0CAC-AE6E-4837-8844-479CEC574696.1; 
 Wed, 29 Jun 2022 07:49:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f12120776115.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 07:49:56 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB8PR08MB5017.eurprd08.prod.outlook.com (2603:10a6:10:ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 07:49:54 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%9]) with mapi id 15.20.5373.017; Wed, 29 Jun 2022
 07:49:54 +0000
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
X-Inumbo-ID: 186e4e0e-f780-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T5VCm9R5vCuBtUPeNG+XyONOMGS67zs7KSUUosDB8vavHp+gw6tRfILuACfZGHnohCAJAOThRru5loUoJbOTqYWalAUn9lrsqZ/H0tdBcJ01IxxngGzyr3nXhRvEXW5ra9U0sHmI+j/d1YUKq9cERle22YNQPVaFlpdz7CJONs+6uhBB1Z6CTUHWtO9OxfdiIojF+NhshPkBPPeTNdeIYStnYqKlcTOdawygxx0HjwegKz4FnqwXK9AfidafUExl2LDhUfXe5FMLNsDYVQklWl6+du45z77o0zPE8j+gYAaH7jvcnLzbfVBkuxAGXInAlBAPoztW0okhXgWWy5hVig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zag62M8tH5+CJv1vPt7L0sAa1qAxkF/R0nqvxTkVhss=;
 b=hjGhXvQa+X7nPM7Ul7KFIoATcGyxUipE0pQ12DBfWvhOt8loN8PHPRY+5Yuz6FWFphvOtUH5AFklWcopz+C/j9PO154+oEqjWgDlS/FYmoZi4/S2rqxt8ETElJCpQMtD4+PAxXsdT5W86HF4J1msGnwoQIah3U6drbRgb1lNerE70XSBgednvpokhztHSj0mN9J83t0OqOD8v/FkVXpXjMxvpGfz3ggbyrmZTpG6yN9jDpK0krijiZZ+9F5hPbhMiC65/nZLYIAt56W12neFTqpMLRRxczADkBhx4r1n+VWeZ7bnQg/Qj/E1fcIthOZzbPrZPR/pU9/qzyTZpLDSaw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zag62M8tH5+CJv1vPt7L0sAa1qAxkF/R0nqvxTkVhss=;
 b=gZlQX+4gEelQRw0v2TWKcgaBr7RTGrhjydwGkNaCpCk7Fv89LWi/kkixgBr/mrDZn3nttmD30jESxucUAUeKd2PfOn0pH00eZrKlcGbb126jpd3Mg4beYb/sB3T+FuM1+BaRE1BFU8KQxKh3c1GFsllErKRwSwclIEIDd0WucLY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLzFw7K/GlOYLe8e0i9iq2JiZVjk/qjKtWvNPtMcJBlYVgJIdaCFRxvMAXavnhk116AZO9Yw+ZeJdi2nPWonSz3V5JD4FhDtx4NuI0HgoGWlxJfSbOE3T2XvqXeVk4mlGki72VgnNcErE3MaphaxW6tM/g+VuoRAeD2l98Hekgr92PbfKYEQwQphmflK2dgRzKj4+SKWx4YPO+EfLZ6B4qBSi5f6IeMgsn1GDQOBLUAvBIjCo4GbsQMpT0MlG/f6DXTZNXXiHAtLurBFSYqRlFGf1zA5dmCOMIQRzptiK5GBdLWj3rBB0LF0t6/bT/HOSz9vU3gwo+kCJarAG5LElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zag62M8tH5+CJv1vPt7L0sAa1qAxkF/R0nqvxTkVhss=;
 b=bYTg3ThAknuCpXc1WhYzhVUM2mfq0FbAU+AZ2i29ocAx8oSDMo5oOusLWfbVlu7i8x1pstNUMvHixvHQQcYGxYdQvqxeXKtb0r2Jtrd+U4lssVl1c6OYZCZiFo6+coicT7vQGp8ua3Lt0Tmih/OTT0Quzm70D+6JnDcd0oGgxUJjuDzsbdQQx9j7Ya6lX/GE4Oj8AQC7SrZlIo/4tQe+LjiecRRYvIv1kFg2wvLJfe61T3icGEyjpecbKK04+cdwt00S4V2XLmkqRf/DKjVkll9K1CuJHfL6UlPJ08ccuGt3hACsTHJF7Q7TUXm8E7fM/5ThksnblqVhgJ6b1Eqoag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zag62M8tH5+CJv1vPt7L0sAa1qAxkF/R0nqvxTkVhss=;
 b=gZlQX+4gEelQRw0v2TWKcgaBr7RTGrhjydwGkNaCpCk7Fv89LWi/kkixgBr/mrDZn3nttmD30jESxucUAUeKd2PfOn0pH00eZrKlcGbb126jpd3Mg4beYb/sB3T+FuM1+BaRE1BFU8KQxKh3c1GFsllErKRwSwclIEIDd0WucLY=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 3/8] xen/arm: allocate static shared memory to a
 specific owner domain
Thread-Topic: [PATCH v5 3/8] xen/arm: allocate static shared memory to a
 specific owner domain
Thread-Index: AQHYhGQ+VQS5G+xrzUihN2YrNBvaxq1e8m8AgAcdTKA=
Date: Wed, 29 Jun 2022 07:49:54 +0000
Message-ID:
 <DU2PR08MB73257C8DDCC8DB00E62A7D68F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-4-Penny.Zheng@arm.com>
 <8cf391b9-02a3-6058-35cb-e0a63b8db854@xen.org>
In-Reply-To: <8cf391b9-02a3-6058-35cb-e0a63b8db854@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DC1E737AB0E2D546BC17B082587D6C56.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: aa73bd23-3a72-49e0-8b51-08da59a3f8c7
x-ms-traffictypediagnostic:
	DB8PR08MB5017:EE_|DBAEUR03FT013:EE_|VI1PR08MB2704:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YLEXtiAOLSuKvtTqNrqeMPmf86QvqarZWawVvNzGhA3J3RGo9j6p7YlyGdU8hynKhKmMspwlv3i4kKS5CClxnuEDdtCBTly7y7/qBB6rOza/CDEAKpQRt88k72vojKJVR/1kCZIJEa+VZ3794OuTOBdvkctFHggaY7F5E5DYBzU290gk32hfDmyoOXCvm0WfpuqWLdYcxkjl1c+hVcbHJB6ejM+zlIoZZ/yY5eMM0q3ij/LKQcm4YwhUJ0wXy1eDqOO9pL+PJrplSC5lLGYiEob1hwylTaEMSl4Y72DY6HeCcXx5CGmWzWr/U6qFcPPWbDskj0DgSZW06Tbzum0A0EQrdOglfU7dHPcZ6ubBiJQQ2bQLLMxVPjo/gH/5e4MYYSzVOoTPl4wKVN7y9cCPdt8Q9SmBEhN/eARSTDHlDNJoSPGhO7yXMXdpzHWzdeuWh/qohStm5KjFgL7Ug8wQJyOmQUs44Ie3/nxUoyqXbShfRkQDyThcp5BoVXZYHEZWJPxT/bgmsgTnE7qFDtVQKMIlRK6XK5P0qucvsmQ+gd20IyX3qQo0O3/ztJ1603F1C3QmefK/YGA3AE6mEJ1l/zZuVGvJP2wdaKWHZKV3s/AnnZYKGjMxELSTDwSPht9bZDzR0jXi5QwZ3xYnXYkF+SLGJVBoU+m7N3+zL3NAFWQm+L045G8X8dFxXJY02uMwW8c8Cn4T2q6ekb8NgztwRhlJkUW7HfOuFJtzshjfwDxeDmvZjoHX2ASUuRReVuJSn1/iH43KwfSBcQwIDPOnbgWbfQDRe2wdHar2V96SpAQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(110136005)(54906003)(86362001)(38100700002)(76116006)(52536014)(66446008)(186003)(4326008)(26005)(66946007)(66556008)(83380400001)(53546011)(38070700005)(6506007)(9686003)(64756008)(5660300002)(122000001)(33656002)(41300700001)(8936002)(316002)(66476007)(2906002)(7696005)(8676002)(55016003)(71200400001)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5017
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ce7ba0d-37e0-4814-9271-08da59a3f480
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P9qMULTUWLuNOgeIGK+ObZL+ps5sXHgJFVpiCJ1h8qfw31kezg/t+EKDWG+jfKhzhy8MQaCjKJHCnj2/uJsIg8MpgP7CY5HElba3kxZFNqvo2PySiqq2fLO46FJwg82OBW5Wu7ALkvVvah6W3GTd8VXqQ0zo156vNdhnbIZjsXPlGdtHjYyjUXZ/2/YD8At5dFolHinsK46RuINTAB86/On3XG8N2kOFI7DzPW10G5H4KQkHSwjBM5g4jZ4ce6lWIajBcjGgCfsOLMv4P1mhxJ9ENvSpMx0rfw4OjHa27oxRDKTSxfsP1WKK/oCaLwclDMgrJ26oP4wRa/AzQ7mpcRkZSO5ZPO1DkTF9VKyP9ZtTMV3OWiT6oajiuaSkZ3AxWpe2EljsggBr1JiocrJhCkSwK5KyDM5P2oT0ivGYblc1KDT+oQoOooTJjvHYa9JeFe/ICyoSFKEv2hnKNyHxGfOajqApJLsZj83LUfn7jmsqROpExiN82JdvKn2ogy2UgDD+vOvwQCtmqMw3amCoIwoDCYbJjmx/I5QEIeWGjlHdVIgKi0TjtDRbWriYQc6psECRkRyQhEUbt0Stn3twUCgNI2FfZ0rpZBpqG15Nc/IVlluj9DVFI11oDUuplJ6B/KMTjOGf1P4jkYMJWnpNoIboigsBAk+Tkxp/4QR5v5H9zhSYobcqAwEvvoUOaoj2gqbjhnDBIIF4CO8Q2f7BhVWnWyi+tK4h387XTxTNuCvpYl9piryDlqBwdQMwUOfDTFaCDnQkhX30t2lbmpiYiPTId3LlvdkNxk8sE+FjxbX24LAbM5lpKkT55dyGnrlp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(40470700004)(36840700001)(40460700003)(52536014)(33656002)(26005)(47076005)(8936002)(356005)(9686003)(5660300002)(186003)(336012)(86362001)(6506007)(70206006)(4326008)(107886003)(70586007)(82310400005)(8676002)(41300700001)(2906002)(53546011)(83380400001)(110136005)(7696005)(40480700001)(55016003)(82740400003)(316002)(81166007)(36860700001)(54906003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 07:50:01.4558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa73bd23-3a72-49e0-8b51-08da59a3f8c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2704

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIEp1bmUgMjUsIDIwMjIg
MzowNyBBTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNo
dWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1
IDMvOF0geGVuL2FybTogYWxsb2NhdGUgc3RhdGljIHNoYXJlZCBtZW1vcnkgdG8gYQ0KPiBzcGVj
aWZpYyBvd25lciBkb21haW4NCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24gMjAvMDYvMjAyMiAw
NjoxMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gSWYgb3duZXIgcHJvcGVydHkgaXMgZGVmaW5l
ZCwgdGhlbiBvd25lciBkb21haW4gb2YgYSBzdGF0aWMgc2hhcmVkDQo+ID4gbWVtb3J5IHJlZ2lv
biBpcyBub3QgdGhlIGRlZmF1bHQgZG9tX2lvIGFueW1vcmUsIGJ1dCBhIHNwZWNpZmljIGRvbWFp
bi4NCj4gPg0KPiA+IFRoaXMgY29tbWl0IGltcGxlbWVudHMgYWxsb2NhdGluZyBzdGF0aWMgc2hh
cmVkIG1lbW9yeSB0byBhIHNwZWNpZmljDQo+ID4gZG9tYWluIHdoZW4gb3duZXIgcHJvcGVydHkg
aXMgZGVmaW5lZC4NCj4gPg0KPiA+IENvZGluZyBmbG93IGZvciBkZWFsaW5nIGJvcnJvd2VyIGRv
bWFpbiB3aWxsIGJlIGludHJvZHVjZWQgbGF0ZXIgaW4NCj4gPiB0aGUgZm9sbG93aW5nIGNvbW1p
dHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJt
LmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPg0KPiA+IC0tLQ0KPiA+IHY1IGNoYW5nZToNCj4gPiAtIG5vIGNoYW5nZQ0KPiA+
IC0tLQ0KPiA+IHY0IGNoYW5nZToNCj4gPiAtIG5vIGNoYW5nZXMNCj4gPiAtLS0NCj4gPiB2MyBj
aGFuZ2U6DQo+ID4gLSBzaW1wbGlmeSB0aGUgY29kZSBzaW5jZSBvX2diYXNlIGlzIG5vdCB1c2Vk
IGlmIHRoZSBkb21haW4gaXMgZG9tX2lvDQo+ID4gLS0tDQo+ID4gdjIgY2hhbmdlOg0KPiA+IC0g
UDJNIG1hcHBpbmcgaXMgcmVzdHJpY3RlZCB0byBub3JtYWwgZG9tYWluDQo+ID4gLSBpbi1jb2Rl
IGNvbW1lbnQgZml4DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMg
fCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiAtLQ0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYw0KPiA+IGluZGV4IDkxYTVhY2U4NTEuLmQ0ZmQ2NGUyYmQgMTAwNjQ0DQo+
ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gKysrIGIveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gQEAgLTgwNSw5ICs4MDUsMTEgQEAgc3RhdGljIG1mbl90
IF9faW5pdA0KPiBhY3F1aXJlX3NoYXJlZF9tZW1vcnlfYmFuayhzdHJ1Y3QgZG9tYWluICpkLA0K
PiA+ICAgICovDQo+ID4gICBzdGF0aWMgaW50IF9faW5pdCBhbGxvY2F0ZV9zaGFyZWRfbWVtb3J5
KHN0cnVjdCBkb21haW4gKmQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHUzMiBhZGRyX2NlbGxzLCB1MzIgc2l6ZV9jZWxscywNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IHBiYXNlLCBwYWRkcl90IHBz
aXplKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRy
X3QgcGJhc2UsIHBhZGRyX3QgcHNpemUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFkZHJfdCBnYmFzZSkNCj4gPiAgIHsNCj4gPiAgICAgICBtZm5fdCBz
bWZuOw0KPiA+ICsgICAgaW50IHJldCA9IDA7DQo+ID4NCj4gPiAgICAgICBkcHJpbnRrKFhFTkxP
R19JTkZPLA0KPiA+ICAgICAgICAgICAgICAgIkFsbG9jYXRlIHN0YXRpYyBzaGFyZWQgbWVtb3J5
IEJBTksNCj4gPiAlIyJQUklwYWRkciItJSMiUFJJcGFkZHIiLlxuIiwgQEAgLTgyMiw4ICs4MjQs
MTggQEAgc3RhdGljIGludCBfX2luaXQNCj4gYWxsb2NhdGVfc2hhcmVkX21lbW9yeShzdHJ1Y3Qg
ZG9tYWluICpkLA0KPiA+ICAgICAgICAqIERPTUlEX0lPIGlzIHRoZSBkb21haW4sIGxpa2UgRE9N
SURfWEVOLCB0aGF0IGlzIG5vdCBhdXRvLQ0KPiB0cmFuc2xhdGVkLg0KPiA+ICAgICAgICAqIEl0
IHNlZXMgUkFNIDE6MSBhbmQgd2UgZG8gbm90IG5lZWQgdG8gY3JlYXRlIFAyTSBtYXBwaW5nIGZv
ciBpdA0KPiA+ICAgICAgICAqLw0KPiA+IC0gICAgQVNTRVJUKGQgPT0gZG9tX2lvKTsNCj4gPiAt
ICAgIHJldHVybiAwOw0KPiA+ICsgICAgaWYgKCBkICE9IGRvbV9pbyApDQo+ID4gKyAgICB7DQo+
ID4gKyAgICAgICAgcmV0ID0gZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZXMoZCwgZ2FkZHJfdG9fZ2Zu
KGdiYXNlKSwgc21mbiwNCj4gPiArIFBGTl9ET1dOKHBzaXplKSk7DQo+IA0KPiBDb2Rpbmcgc3R5
bGU6IHRoaXMgbGluZSBpcyBvdmVyIDgwIGNoYXJhY3RlcnMuIEFuZC4uLg0KPiANCj4gPiArICAg
ICAgICBpZiAoIHJldCApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBwcmludGso
WEVOTE9HX0VSUg0KPiA+ICsgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byBtYXAgc2hhcmVk
IG1lbW9yeSB0byAlcGQuXG4iLCBkKTsNCj4gDQo+IC4uLiB0aGlzIGxpbmUgY291bGQgYmUgbWVy
Z2VkIHdpdGggdGhlIHByZXZpb3VzIG9uZS4NCj4gDQo+ID4gKyAgICAgICAgICAgIHJldHVybiBy
ZXQ7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIHJldHVybiBy
ZXQ7DQo+ID4gICB9DQo+ID4NCj4gPiAgIHN0YXRpYyBpbnQgX19pbml0IHByb2Nlc3Nfc2htKHN0
cnVjdCBkb21haW4gKmQsIEBAIC04MzYsNiArODQ4LDggQEANCj4gPiBzdGF0aWMgaW50IF9faW5p
dCBwcm9jZXNzX3NobShzdHJ1Y3QgZG9tYWluICpkLA0KPiA+ICAgICAgIHUzMiBzaG1faWQ7DQo+
ID4gICAgICAgdTMyIGFkZHJfY2VsbHMsIHNpemVfY2VsbHM7DQo+ID4gICAgICAgcGFkZHJfdCBn
YmFzZSwgcGJhc2UsIHBzaXplOw0KPiA+ICsgICAgY29uc3QgY2hhciAqcm9sZV9zdHI7DQo+ID4g
KyAgICBib29sIG93bmVyX2RvbV9pbyA9IHRydWU7DQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGJlc3QgaWYgcm9sZV9zdHIgYW5kIG93bmVyX2RvbV9pbyBhcmUgZGVmaW5lZCB3aXRoaW4gdGhl
DQo+IGxvb3AuIFNhbWUgZ29lcyBmb3IgYWxsIHRoZSBvdGhlciBkZWNsYXJhdGlvbnMuDQo+IA0K
PiA+DQo+ID4gICAgICAgZHRfZm9yX2VhY2hfY2hpbGRfbm9kZShub2RlLCBzaG1fbm9kZSkNCj4g
PiAgICAgICB7DQo+ID4gQEAgLTg2MiwxOSArODc2LDI3IEBAIHN0YXRpYyBpbnQgX19pbml0IHBy
b2Nlc3Nfc2htKHN0cnVjdCBkb21haW4gKmQsDQo+ID4gICAgICAgICAgIEFTU0VSVChJU19BTElH
TkVEKHBiYXNlLCBQQUdFX1NJWkUpICYmIElTX0FMSUdORUQocHNpemUsDQo+IFBBR0VfU0laRSkp
Ow0KPiA+ICAgICAgICAgICBnYmFzZSA9IGR0X3JlYWRfbnVtYmVyKGNlbGxzLCBhZGRyX2NlbGxz
KTsNCj4gPg0KPiA+IC0gICAgICAgIC8qIFRPRE86IENvbnNpZGVyIG93bmVyIGRvbWFpbiBpcyBu
b3QgdGhlIGRlZmF1bHQgZG9tX2lvLiAqLw0KPiA+ICsgICAgICAgIC8qDQo+ID4gKyAgICAgICAg
ICogInJvbGUiIHByb3BlcnR5IGlzIG9wdGlvbmFsIGFuZCBpZiBpdCBpcyBkZWZpbmVkIGV4cGxp
Y2l0bHksDQo+ID4gKyAgICAgICAgICogdGhlbiB0aGUgb3duZXIgZG9tYWluIGlzIG5vdCB0aGUg
ZGVmYXVsdCAiZG9tX2lvIiBkb21haW4uDQo+ID4gKyAgICAgICAgICovDQo+ID4gKyAgICAgICAg
aWYgKCBkdF9wcm9wZXJ0eV9yZWFkX3N0cmluZyhzaG1fbm9kZSwgInJvbGUiLCAmcm9sZV9zdHIp
ID09IDAgKQ0KPiA+ICsgICAgICAgICAgICBvd25lcl9kb21faW8gPSBmYWxzZQ0KPiBJSVVDLCB0
aGUgcm9sZSBpcyBwZXItcmVnaW9uLiBIb3dldmVyLCBvd25lcl9kb21faW8gaXMgZmlyc3QgaW5p
dGlhbGl6ZWQgdG8NCj4gZmFsc2Ugb3V0c2lkZSB0aGUgbG9vcC4gVGhlcmVmb3JlLCB0aGUgdmFy
aWFibGUgbWF5IG5vdCBiZSBjb3JyZWN0IG9uIHRoZSBuZXh0DQo+IHJlZ2lvbi4NCj4gDQo+IFNv
IEkgdGhpbmsgeW91IHdhbnQgdG8gd3JpdGU6DQo+IA0KPiBvd25lcl9kb21faW8gPSAhZHRfcHJv
cGVydHlfcmVhZF9zdHJpbmcoLi4uKTsNCj4gDQo+IFRoaXMgY2FuIGFsc28gYmUgYXZvaWRlZCBp
ZiB5b3UgcmVkdWNlIHRoZSBzY29wZSBvZiB0aGUgdmFyaWFibGUgKGl0IGlzIG1lYW50DQo+IHRv
IG9ubHkgYmUgdXNlZCBpbiB0aGUgbG9vcCkuDQo+IA0KDQpZZXMsIGl0IGlzIGEgYnVnLCB0aHgh
ISEgSSdsbCByZWR1Y2UgdGhlIHNjb3BlLg0KDQo+ID4gKw0KPiA+ICAgICAgICAgICAvKg0KPiA+
ICAgICAgICAgICAgKiBQZXIgc3RhdGljIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGNvdWxkIGJlIHNo
YXJlZCBiZXR3ZWVuIG11bHRpcGxlDQo+ID4gICAgICAgICAgICAqIGRvbWFpbnMuDQo+ID4gLSAg
ICAgICAgICogSW4gY2FzZSByZS1hbGxvY2F0aW5nIHRoZSBzYW1lIHNoYXJlZCBtZW1vcnkgcmVn
aW9uLCB3ZSBjaGVjaw0KPiA+IC0gICAgICAgICAqIGlmIGl0IGlzIGFscmVhZHkgYWxsb2NhdGVk
IHRvIHRoZSBkZWZhdWx0IG93bmVyIGRvbV9pbyBiZWZvcmUNCj4gPiAtICAgICAgICAgKiB0aGUg
YWN0dWFsIGFsbG9jYXRpb24uDQo+ID4gKyAgICAgICAgICogU28gd2hlbiBvd25lciBkb21haW4g
aXMgdGhlIGRlZmF1bHQgZG9tX2lvLCBpbiBjYXNlIHJlLWFsbG9jYXRpbmcNCj4gPiArICAgICAg
ICAgKiB0aGUgc2FtZSBzaGFyZWQgbWVtb3J5IHJlZ2lvbiwgd2UgY2hlY2sgaWYgaXQgaXMgYWxy
ZWFkeSBhbGxvY2F0ZWQNCj4gPiArICAgICAgICAgKiB0byB0aGUgZGVmYXVsdCBvd25lciBkb21f
aW8gYmVmb3JlIHRoZSBhY3R1YWwgYWxsb2NhdGlvbi4NCj4gPiAgICAgICAgICAgICovDQo+ID4g
LSAgICAgICAgaWYgKCAhaXNfc2htX2FsbG9jYXRlZF90b19kb21pbyhwYmFzZSkgKQ0KPiA+ICsg
ICAgICAgIGlmICggKG93bmVyX2RvbV9pbyAmJiAhaXNfc2htX2FsbG9jYXRlZF90b19kb21pbyhw
YmFzZSkpIHx8DQo+ID4gKyAgICAgICAgICAgICAoIW93bmVyX2RvbV9pbyAmJiBzdHJjbXAocm9s
ZV9zdHIsICJvd25lciIpID09IDApICkNCj4gPiAgICAgICAgICAgew0KPiA+IC0gICAgICAgICAg
ICAvKiBBbGxvY2F0ZSBzdGF0aWNhbGx5IHNoYXJlZCBwYWdlcyB0byB0aGUgZGVmYXVsdCBvd25l
ciBkb21faW8uICovDQo+ID4gLSAgICAgICAgICAgIHJldCA9IGFsbG9jYXRlX3NoYXJlZF9tZW1v
cnkoZG9tX2lvLCBhZGRyX2NlbGxzLCBzaXplX2NlbGxzLA0KPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBiYXNlLCBwc2l6ZSk7DQo+ID4gKyAgICAgICAgICAg
IC8qIEFsbG9jYXRlIHN0YXRpY2FsbHkgc2hhcmVkIHBhZ2VzIHRvIHRoZSBvd25lciBkb21haW4u
ICovDQo+ID4gKyAgICAgICAgICAgIHJldCA9IGFsbG9jYXRlX3NoYXJlZF9tZW1vcnkob3duZXJf
ZG9tX2lvID8gZG9tX2lvIDogZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBhZGRyX2NlbGxzLCBzaXplX2NlbGxzLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBiYXNlLCBwc2l6ZSwgZ2Jhc2UpOw0KPiA+ICAgICAg
ICAgICAgICAgaWYgKCByZXQgKQ0KPiA+ICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+
ID4gICAgICAgICAgIH0NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

