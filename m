Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0952EBAA
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333961.557926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1US-0002c7-Gc; Fri, 20 May 2022 12:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333961.557926; Fri, 20 May 2022 12:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1US-0002Z6-C2; Fri, 20 May 2022 12:12:20 +0000
Received: by outflank-mailman (input) for mailman id 333961;
 Fri, 20 May 2022 12:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dhdo=V4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ns1TR-0007nf-Qi
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:11:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f36115d6-d835-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 14:11:17 +0200 (CEST)
Received: from AM6P192CA0080.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::21)
 by AM9PR08MB6241.eurprd08.prod.outlook.com (2603:10a6:20b:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 12:11:04 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::e8) by AM6P192CA0080.outlook.office365.com
 (2603:10a6:209:8d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Fri, 20 May 2022 12:11:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Fri, 20 May 2022 12:11:04 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Fri, 20 May 2022 12:11:04 +0000
Received: from 1970b5736e44.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 32AA5BE6-03A9-402D-B852-239AD7719A31.1; 
 Fri, 20 May 2022 12:10:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1970b5736e44.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 May 2022 12:10:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0802MB2344.eurprd08.prod.outlook.com (2603:10a6:4:87::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Fri, 20 May
 2022 12:10:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 12:10:54 +0000
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
X-Inumbo-ID: f36115d6-d835-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Y1igTrvLoc+ELxafe9dopGEnKPYvtPn1BLEPWEY+SEnz4JAR7kIfypj3neQqo1QB2FjmjqhdvJ5uOfPkEH4pNHvdeJarhwPCdgQTPSRGTvRWR2SquOVO4+2x2SfSKWLMO84tboDCEp/NfwRzBaonp+CEUmPrcnJasIop7lUetoah/ivq9liG6AGT/lHOQjMnVquTXkT1hKXe2tK14ccr+N9siqBs2cYujAtSRGqCBa3YUwHhptoKWUaIv5P71YtDW+i6XqsqGXMPsJnDNWfrjd70ZjFUxuBWVUXg7F1aapWlQkcKF1xKsqmvTYB0yKWUbt2xT4+LyuaGPIYcQ1Erlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhV4J4gc+JgRi2wv6n9qzrSo3gUycWcP4lSQ8bQmDhM=;
 b=A9VyhjhXNrzs69ZCOCa6wZrPyr+VGxla81TM72T95+7rfWnALWrdpfUOEg8Z3vhG9IkdXX5ytjFGHqjFlcfRMGSRbFD3EEcSsTLPCwsPt2EAlI6151FUAW7y9YbOyFViBMS6JAxxiwSY4U+Cgk2xUY0fdV2bs//uXwH9a0sSnM4VR+AMIyRK6pGiU57ylSOUUDBmdPtEHC0rge5AjZcSGJnxnTtq0lwNeEuF9VGpmWNzP9zlldQQbOyy/gAjjj706cWjx4uwsGFR6oqq5DpjeWWfuFOdNCXPzfEnap0dlh9IIY0jYgtSJ7hChZnHB9AlrIn8oC3a0m6+rR3t4DRw+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhV4J4gc+JgRi2wv6n9qzrSo3gUycWcP4lSQ8bQmDhM=;
 b=yK0BcJbMd/4m9N0qa54JX0MUz4Ze8gpsIeYD/xFA0cqVSjhFBbxq+TWiFVztR9uPEo2vdc25kbHxF50Jc/XdSagMFI+jT3EBvWkB+tNzJVW3p5/oP3XGcDYnTwYHo+1v/3vP2HwCnjU/fsFRkh1dFKLWujRfLFn1mCZ7dvW4zL4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 476d27481ef1835c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBkjvIorzCge3jmc+9vOYfG1qbp4Y9x9ngmIOGOuljgPGDTDSELsa2dSaRXtpuloZM4pZXO4i/dRmpNQY2WBBvNq0k0SeMtUFfmFkTVsGQ/5Nu5jls4kOGfHFdsX1betxa8kHsd8c8qhXg3wHkmr5IQTPjJOv0V3sXamoSzXofoTDn2vl+Pxzm2IhSXmmkSjKOe5XtEF+yQqg1G1JHFI2QSEavA96bNGD4ONZPT/wWBugz/q0HnZXvaiAE77hIsGKbXzrhceOq3T74yfm4ih1GYTk73cFR/A54xZIIhp/tuDvRpEAxVJh3fZ/xtC5gemEXVcmLqBIP7laT6xz0QgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhV4J4gc+JgRi2wv6n9qzrSo3gUycWcP4lSQ8bQmDhM=;
 b=cIsmfQm1th5Xfe6pSosSOGzCLZ6hbO7JW4/RqDCamywZnarVu7LFGPLrYGvLO1NrZ8PcHZDKxPjiM7uDXfQDmHSS4xudk2rxPOj9wWP0iy2vIw9tpZTm8pJlHpWjFIfkLc0p7Ahk7DU/J0GBP0pA/rzzqgcEnXdYqXsh0t+K/YTDqKmBLXrMiaonemXIjk3zkkbpbN43PmIlHFxcFKx82U1WAxTgliHe3WGepQjezklP4Yv/LRrV+3oTW9dOqtJT2GUDGdOvxR7zpXhyDNz9dNuJmkou+Fyo1R1aRM4xQRpfb6FOwZcj8MD2M+R/SgqbrYtMSYLLxO+mdkCTh/R/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhV4J4gc+JgRi2wv6n9qzrSo3gUycWcP4lSQ8bQmDhM=;
 b=yK0BcJbMd/4m9N0qa54JX0MUz4Ze8gpsIeYD/xFA0cqVSjhFBbxq+TWiFVztR9uPEo2vdc25kbHxF50Jc/XdSagMFI+jT3EBvWkB+tNzJVW3p5/oP3XGcDYnTwYHo+1v/3vP2HwCnjU/fsFRkh1dFKLWujRfLFn1mCZ7dvW4zL4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] build: Fix make warning if there is no cppcheck
Thread-Topic: [PATCH] build: Fix make warning if there is no cppcheck
Thread-Index: AQHYbDdo2r5944WyY064u79v8h3JAa0nmuqAgAAR9IA=
Date: Fri, 20 May 2022 12:10:54 +0000
Message-ID: <CD82AEA2-621C-4ED1-917B-8EE08E4CD465@arm.com>
References:
 <11fe35abe0a4cc79e6f7253d04ed12d951f1d09d.1653043632.git.bertrand.marquis@arm.com>
 <739ac0c5-0c58-0e0f-ade6-5d48db5254c6@suse.com>
In-Reply-To: <739ac0c5-0c58-0e0f-ade6-5d48db5254c6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2989100f-bdbf-427d-3b67-08da3a59d026
x-ms-traffictypediagnostic:
	DB6PR0802MB2344:EE_|VE1EUR03FT004:EE_|AM9PR08MB6241:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6241BB047EE1990442D8F9D89DD39@AM9PR08MB6241.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2cvA7VKVqVrevrp+a0S0jcimszFN5dSI162vpzHPttigVTgAtYTv/F2C5ZGj+8vJPxl8hVyYyWmth4Az3gP+HZW/UBgaYh9p5V5gcw6fR707p7jJB7yp7SB2hNWT2ImJsjdRN9SbevijD+0ZIlNrS5egjX36wcxsHaor5tOk6MoJm3ffbEQPrjJFKVlCWsWyJEDBePoNqiVg28QBJVYNW4+AtWDL+b7V6sEtZGJYhwvCJUGbTVmhPTk0xLx+B/cvk0DOqZR3uo5bHlJNSrFELECcUF5T3GetU4JAhxzgELXrq+aGGDopHGM331vu9ZDuvjrDrJuyAg/LT6naYcehk0MupEaJDCjJAubCb4oVc4GTnNNFkvYpuo1k3D/Omz1TKyX7n7KHNjavrnlZD585vzNMQCXZ7wv48CiCajEL14TtAm9dmMG9PGra5gtWQeT0FcAh4CJx4Ao6NOr8+s5vdCfUDQS7cxLyCNVDkF8fiJ6dkryyKMU2yRlEXTuCTRELeC5+iPr/mteMqZYYWJL2Uy/gVz9O6n3+3gFMIrE87L9Ge4uud5Mo2CQAjrly0m6qC0id7WY7mycL5TC82P83MdS5oIyllb0H9dEUhrzP7dbzDC/LesIQ6jz96UfqiQACjHsVhJitXiv20nsFWzcjm85l+ioTe+FD7Kxa0cON1ZuxdkNANSv0bGC3k4+/QsLfNJ232WndLhbcsNB5QaXgsJa/UEj5CYNVt15VJ/td29uBQ4j5jnLKiMG6dzBvv9Iw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66446008)(66946007)(66556008)(8936002)(91956017)(122000001)(64756008)(53546011)(316002)(2616005)(4326008)(54906003)(86362001)(6916009)(76116006)(8676002)(6512007)(26005)(6506007)(71200400001)(6486002)(186003)(33656002)(508600001)(38100700002)(4744005)(2906002)(36756003)(83380400001)(38070700005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1370BBBD5BD68A469C68B40507280692@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2344
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ad59f10-4d3b-4b05-2230-08da3a59c9ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wIxo+abHiW0XBD00tqre0ldEHX+up/qczhpBWbOahFEzELol6v7hVfZMbAF6Fgh0tt5PzK05e9xWpIUVwhuSF2giuIk/HybTWvLuGO9d+ZwRi9XjUy4uCdEposjlMNVb3CSo4wDRYdZy2rfxUY8Pi6kOS0iYXhdAfUfTRTZ8sTS7N7N3iP+hP/5FVHs2pHZ5YZPvbqFmbRCarJxKgGeQHNeJeJe7KRtmQdqTolHy3YxGnW48gfCOaOPdORI1ja0PIggba6nUixubsEkDuPEeXTC8iE//X8vlNRRfkJe/Uw0qBVAC+XV9w6ybaNuZ0PlyiFMm5Y0KR8WefHCklyV3GHeC3PlFAAawnCZ5an4G+pFaxZp2A96WmaUTP2eldPRuVGiK6T+nq5tNiTX25Merb/t46ywtUzoJ7v/K+KeDebILICc3/uS+R98LIdpGjICeycQzZXWyKjrqCSNJ138G+g4+CtEK3nu2EpIDPSBG4xLd7QqH3O49jaztGby56ntKGX7JScfowQauFuZmT45IsDXtprZjHAFtIE88+MtxOL2ZpE2O8LNrIR4qC23vYKd9F7HZWg9HfTVXOKI0Yi1B+iIVFOOsAGgX+swH4bOU4u3c5gTAqnxLN5Jb0WrBCNuQcgI5NEoh9yzXeQiv2MFqHGMCaMuEHoLNLPMxKik3sq5EQuku4QHxp+nwkfOzUpXH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36756003)(6506007)(26005)(86362001)(82310400005)(47076005)(6512007)(53546011)(356005)(83380400001)(2906002)(336012)(6862004)(5660300002)(81166007)(2616005)(4326008)(70586007)(186003)(70206006)(33656002)(8676002)(54906003)(8936002)(40460700003)(4744005)(316002)(36860700001)(508600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 12:11:04.3919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2989100f-bdbf-427d-3b67-08da3a59d026
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6241

Hi Jan,

> On 20 May 2022, at 12:06, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 20.05.2022 12:49, Bertrand Marquis wrote:
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -694,12 +694,13 @@ $(objtree)/%.c.cppcheck: $(srctree)/%.c $(objtree)=
/include/generated/autoconf.h
>> 	$(call if_changed,cppcheck_xml)
>>=20
>> cppcheck-version:
>> -ifeq ($(shell which $(CPPCHECK)),)
>> +ifeq ($(shell which $(CPPCHECK) 2> /dev/null),)
>> 	$(error Cannot find cppcheck executable: $(CPPCHECK))
>> -endif
>> +else
>> ifeq ($(shell $(CPPCHECK) --version | awk '{print ($$2 < 2.7)}'),1)
>> 	$(error Please upgrade your cppcheck to version 2.7 or greater)
>> endif
>> +endif
>=20
> While I agree this will silence things, I still would prefer if you
> switched to $(if ...) inside the rule - there's no need to invoke the
> shell while parsing the makefile. Anything like this only needlessly
> slows down the build. Not by much, but it sums up.

I will submit a v2 to solve this properly.

Cheers
Bertrand

>=20
> Jan
>=20


