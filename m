Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B165396BD
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 21:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340013.564947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw7D3-0001kV-OY; Tue, 31 May 2022 19:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340013.564947; Tue, 31 May 2022 19:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw7D3-0001hF-Kq; Tue, 31 May 2022 19:07:17 +0000
Received: by outflank-mailman (input) for mailman id 340013;
 Tue, 31 May 2022 19:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tbfe=WH=citrix.com=prvs=143db7279=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nw7D2-0001h9-5r
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 19:07:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0a2dbe1-e114-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 21:07:14 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 15:07:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6790.namprd03.prod.outlook.com (2603:10b6:303:178::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 19:07:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 19:07:04 +0000
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
X-Inumbo-ID: e0a2dbe1-e114-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654024034;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6fmpXhd8Nkq59qOHrKEQ95y2cZuWs+vh0baw+s8478k=;
  b=elByjeEtqH8e2ZJFNE+B1wV4TWdpmAtTsx9XDYDofdCGRjXvQ+GRgJSC
   1Zw9pfRPfFp+L6/2UTwjzb7x2Fyjny/rJThIUXQzfjazx00f+qU8e2RBT
   ug8xVsjUkWwPG3/jmhXs8rFQSnuTNQUJFUIh7zV7IkfvrqjsxZbEv9GvI
   U=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 72956401
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8TGbKa/Ddpr3FK7DIYtdDrUDU3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GYfXTuCPviCazfzeNlwbtmw9x5T6pTSmtAxSAVl+Sg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IPgW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCna6ZWykPAI6VpPoEYTBSNn1aAK9l1paSdBBTseTLp6HHW13F5qw0SWsQbcgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHviMvIACtNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrK//tqvTSLlWSd1pDqb9jFW4ylffxPg3SBg
 EfZ/G++IDwFYYn3JT2ttyjEavX0tS/jQ4cTCL2Q/+ZnmkGO3XcUDAAKVFy9ur+yjUvWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS8wqK1raS7w+HB3MsVSJIctgvvok3QlQC3
 V+Tnsj1AiRvvafTQnaU7LS8ti+7IywcJykDYkcsTwID78PyvYIbgRfGT9IlG6mw5vX5Fj39z
 CqDhDQvjLUUy8gQ3uO0+k6vvt63jp3ATwpw7AOHWGugt1l9fNT8ONbu7kXH5/FdKorfVkOGo
 HUPh8mZ6qYJEI2JkyuOBu4KGdlF+sq4DdEVunY3d7FJythn0yfLkVx4iN2mGHpUDw==
IronPort-HdrOrdr: A9a23:BdytmKxWK1rVh+q9hWn3KrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2RYUh27D3xnklWavo3RiKmrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.91,266,1647316800"; 
   d="scan'208";a="72956401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnqB7lnZVQ4N2RJsJwfcdM1ZwMpWgOOwWyIW+w003SSwkn31KZbhXVCZJLdXr4udBwbMch9sZKPEsyBIIYM1heGFVzWmZxrvhWxDABd3IuqDEaiKS/wLncm0d+Kk0ztcXbnf8h3Boy0geTfBzvy4/7xHjQOpEqc8gRb/dmuTw+JNPr7Qf+Zi2Ix+4veN4da33yj8gT8UZbeYSxdEU1AIAtucBchxqb9nMJlt0TDUH6BSbYQg/wMQHfLlDRlMcW+dG9ulG4nDI+MavY+yg59Xqc5M+gPDk8a2jSAuRoAm94/1XyBcVAQL3+RvicvpkfxhDuNKx69JNqM80MYg8uukhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fmpXhd8Nkq59qOHrKEQ95y2cZuWs+vh0baw+s8478k=;
 b=Z+GalL5xZs8QNc94wVsDXd7Y5JTFkxiI1brVgJQ7Ac9YLZBuAsSYQkkpf/6xA8lBeRamfJPn2VEt7A7kJlSq4St4Jtkr9K93p5Cp9ypyKRCxZA0U8Ah2OA7iTnSz2h+S2DyBXGQvQAUKvdHJWQxFsRuMtG2Cz68Cr4o4Q4LgAikJvEuNpLw/SVhjVlEVxSuZ63rydQ/gKGwPeGstt5eryf35Q3+v0xRp80lofcwavmbqBiN+/FgDhAVDU5I1gCj4yGO4P83AJtOmFvM69W2+0fajlIUlXs8kuLksqGQJ+YH6SxIHMAzl+ZYlur80njQLH8Hpb7EkSBB7cyv/oCizww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fmpXhd8Nkq59qOHrKEQ95y2cZuWs+vh0baw+s8478k=;
 b=gF/sykDVdV3EGEhD/7nT0IY8EdAk6R4n35/DDiEDgCs6+KvrBaEN34eQmj7gFwKz+xJqbSpVEi/fu4Gnfuhcc2JIL9HpqD65TrZJ1MBqY+/AzkEngTrRghnSoZb3CoAEORx6dRZqvE0HHkssZc/toQAgtmox7faCFmqXNZtjOWI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>,
	"jandryuk@gmail.com" <jandryuk@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
Thread-Topic: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
Thread-Index: AQHYdRttYyzERFwD3EWagofaBthvzK05WQKA
Date: Tue, 31 May 2022 19:07:04 +0000
Message-ID: <6f177e81-9c97-0f7f-2f79-88cc4db83e02@citrix.com>
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-3-dpsmith@apertussolutions.com>
In-Reply-To: <20220531182041.10640-3-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 518f84a7-ebc2-441b-6581-08da4338c00a
x-ms-traffictypediagnostic: CO3PR03MB6790:EE_
x-microsoft-antispam-prvs:
 <CO3PR03MB67900B4D5DFF2183859E51D6BADC9@CO3PR03MB6790.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fyU3ZiI8VeHmDxFw/L7vM1O+8vEyQ5C+pSBMdJcdAP3H1ZsrLa3eK9QvLUd+8ztT1MnPGA66jpjMFyPnCkHTPPwkTLKy/IcRU90O1BPXyHdCViQ7uHbZyJQ1GLwqteZSDnh6/bx2zuLv2AwnKj0hqAEoSpuw5VBfsXDToL1k2Ee2LHqEHAzoGCrxEZREeie3pEPZA4VuJ/VfjiKiIIirK+qwp0C4QDX7Vx0n9z1i/TzpXkwRLOmeTUnCridktJPXWbDorWL4r3peeNDJGwtVW/4wYMFQFiG9e0kL447NO3ny116WLuTLFvZA5dDnThEDMZcBImGwlI1h51Yo64TjTeV+tURYco7arq8EJBiSU2vfsLtHTb/96r8dzCZ1/qgxBoyntYK2qLrllXip+8Rqsrr7Ljv6oRRLjmXFD8MZyFLcJ8n9+xkp3rn0wXGDpvS+1J5dQ9uXQdFwu6FVY4o7W+JZ577a3e7lHS3DLpZf12q/x2Gu2lgH8g4MUttWZNTthj2AlMrlzeFS95FvIXybW9KI13OfhSg3RPafKeAk/2fvpZbKWd9Nl43eohpB481kwcAuoU9q8/5LDPbAuvLe9OfRL5I0zI2hYsP9iBT0MF1DqVtWuyi7B1oukfiv2KACiInus7JE/7pgKzM7UJxvmCZG1oZEa08sNqcQVPhuIHSfAvd76g+EdAzxtUsQNVEgu90BrkmSIuB2sZ4i3uo48bykf6OouI4XXdIZqnxbNHqCPMnwVQpmlvbbv9Iw4EgCvIdQlP3IgwQ/bqF3ZWRKhfJB2tngdrGaEmmzsK65byc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(122000001)(6512007)(36756003)(26005)(6506007)(38070700005)(31696002)(53546011)(71200400001)(86362001)(38100700002)(2616005)(186003)(54906003)(76116006)(110136005)(31686004)(66446008)(8676002)(66476007)(66946007)(82960400001)(66556008)(8936002)(64756008)(91956017)(5660300002)(2906002)(6486002)(316002)(4326008)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1FsSTV6Z0pTWkdjRHFZMzFCM2lzSTREOVlWM2NaUFZJbzRNdllYZFpYQWFN?=
 =?utf-8?B?VVNVc1ZMMlpvUiswKy9zdE9FZDlONjVxMVQ1TVdWbm9wOGhOQW9lcUFMQTRm?=
 =?utf-8?B?RzJLWEZ2ck40Z25oOUNFVXpFYWZ3TVpJYU53OXJmd1dLUUdXYXh3Zzc2K2lv?=
 =?utf-8?B?SnZlL3BMTGhqUGNMTGtaa2szdFdWTks1RmkvcVZCeVVRNC9VeTNmNGcvUVdL?=
 =?utf-8?B?U2tPZmdZV3NlaTNnR3NsUE8rSmptdU9vMU9hSElVdmI5ekdvWjZaVlM3OVZB?=
 =?utf-8?B?VUhNL003N0xOeVZET1NpWWcra0ErQ21hS05JZERDRHNiYU5vMnZnTlpYR04x?=
 =?utf-8?B?YVhtTUJMRm1qR0VtdndyOU1CMHlxY0hnS0lTcHZiRGx0NHdaSVBDN3dqOUda?=
 =?utf-8?B?NEJkbUE3dWFybGZkNVp6TnRFaU5YYUQvcktuejZpOXlzZUMzVUp5cEcwQU1q?=
 =?utf-8?B?NDVrOTFoVFZLOFpnZW5MaWVabStPVGFMZ2ZMeHVmQTEwbkNzSmx3Z2lJN3hM?=
 =?utf-8?B?TUZBQnRNQVhhYTladXhsY0dLTVhwMXFUdjVUblZMbVZTMVZuRDJtNFpCU0pw?=
 =?utf-8?B?NDIxOGN4Um9FOVJldmgxQXZJaEtpMG40NVRUMVN4ZEtKODdiZ0VWRUxQMUdC?=
 =?utf-8?B?SzlSWlI1MlJaYk9sdkdRYzNMbjlxcTBpS1lSMENwZW1iVGVReXhRR3ZNUTI1?=
 =?utf-8?B?SmJTU3FoU3RHd1dGcGw4NEh3NTJubVpXTHBWM3d0a204SlREbEVHRHhEK2Za?=
 =?utf-8?B?K3ZvME8yYjlrd2l2S2FUTVFWNGJ5QnpUWTNIczlnSTRSSnVuM1NHaXQvNUVZ?=
 =?utf-8?B?R20rdkFLU0FvOGNMNjRnOTh3YlNZaVc4dGhsSzdFeWQ4UVlEVkxUZWFFejFy?=
 =?utf-8?B?NjIvNWUrbXpJbWN4WEZNV2xFV2luTU1QT0dNV1ZvOGhrVXluTkdkclhjNmZF?=
 =?utf-8?B?V1ZVZkwzSDBUeURkSjBUSjNncFRzeTRsM2JSQmt6SWpmbXpJREhaWGR2Yzd4?=
 =?utf-8?B?eWtRVXdCeVp5bE0vK25ybHdyRTBEYXZHODhST1l3dnlJWDUxb2RQVDh1Qkh1?=
 =?utf-8?B?Wi96RWVuZ2NFdzRIRkw2UDQ1b2xMeUVseEhpOURxVEdDbzJDSDNmcWtrNUFm?=
 =?utf-8?B?ejJTbnBmRm9WaVFKR3VaNk1GNW1XbFF1ZkRTMlRHOXlWaXhOb0Z3b2gxTFJQ?=
 =?utf-8?B?Q1M2b0pXdU9RK3pmL1FGM1l0Z096Q0hENXRtSEpHYnhmVEFneFdmb2R5REkx?=
 =?utf-8?B?cGl6MldMYnpTZXlRa0FDaHB1SkppZ3NMcXpIZnNaSXBwaW5xczFqMEZyL0hp?=
 =?utf-8?B?U2g1QzBxdk5KYkNKdnVuR0E5VTdCejNyVkNXZGFVMHFvRnFmd2xTTXB4OG1P?=
 =?utf-8?B?M3JVUG9qVVVkM3E0MjV4QlFieUdwRXVDMGpIR0dwd0xHSE5JT1pieW5iaCtI?=
 =?utf-8?B?SHhCbXRTUmphZXhQYTZkUTFLRnNwaHJLN25zeXJTMWEyRGNlTkNEdms0SHVS?=
 =?utf-8?B?ZTZLU2xtV1h2bnl5THFReVAzRzN5QTVwM0hWTFFWUm1qZlp1Rk5aejJpYmJ5?=
 =?utf-8?B?S0JRMXNjeW5YZGcrVk56cmM5ZFVPU1ZYT0JnN3MwUWJBbUNDS2wzOVRuL3Nu?=
 =?utf-8?B?Y3FaejZ3SE9CakRYVFdVbExWaG94eDJ4TE5jejhJK29OemkzODd1SnBPWFRz?=
 =?utf-8?B?bmFpbG5yNzcxYkI1V1NDTVRPUzlTYmhPRFBWSmErWUpzUG81NkZJQkQyUVJ3?=
 =?utf-8?B?YzI1eTVVRExHT1JFYVhvZDFBclJzY2Y1NXdNVDYwTk96MW4zbjRrYmJsS2ds?=
 =?utf-8?B?akhJSVFBTGZ0UVRTYVVyNFMrRk9Wem1ySW5yQWxMVXNWaHBvMWhpZlRTeG9V?=
 =?utf-8?B?eGd6Qmg1dDRxeVp6azEraW1mVm1hNlRlditOQUQ1UEUyTG0vZ25ORy8rSGFK?=
 =?utf-8?B?ZGFlS2hNQkpIdlJaREhicy9BMzlhelhtNldQQnZ4eHY3S0dOZG5vckZ1S0dV?=
 =?utf-8?B?MHlacThPSVh6TkRxejlaWitXbm1GTDg5aE91ZG9sWGNlQXh6bDNpS3hGK0hI?=
 =?utf-8?B?WHoxOTdxOGNMNjVpRUxmaFJmUzhSb2pOR2lpYnArUmxjdWd2cnhyTTV3QkVt?=
 =?utf-8?B?V0hOU2lPL01TaHByR0hBN3hsV21DWG13R3JwTllGUVRxV2s5UGxzS0xWNkpX?=
 =?utf-8?B?emp4TTlwRjBmNVFKR0J3MWY4cXRQSVRBMm9KdGtDY3pubU1LVW9BS01IcXFl?=
 =?utf-8?B?WGs5NGZnMEo5U2FTR0t1OFd4MU8ydmRteGZlSW9ISkNtaVJVOGQxdEhCRTR0?=
 =?utf-8?B?d3pzUHJ5dnBraW55azhINldoL2JIci9lRXovbFMvVEJiaHY1MXd2NUo2Y0ND?=
 =?utf-8?Q?s3YlvvjJqifTezS4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB92E5FF14B2564F9396BC291066C7B1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518f84a7-ebc2-441b-6581-08da4338c00a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 19:07:04.4857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DLgGpGLH65X1gessWszPsoQ/HWuWmn8Pi/p7O/IJeeIfCjqYXtsd4IBCKMQhrZVsLPPDbZHv096Am2eKNlpn3J+3RDTHdM0KsaIiHiz7zQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6790

T24gMzEvMDUvMjAyMiAxOToyMCwgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL3hzbS94c21fcG9saWN5LmMgYi94ZW4veHNtL3hzbV9wb2xpY3kuYw0KPiBpbmRleCA4
ZGFmYmM5MzgxLi42OTBmZDIzZTlmIDEwMDY0NA0KPiAtLS0gYS94ZW4veHNtL3hzbV9wb2xpY3ku
Yw0KPiArKysgYi94ZW4veHNtL3hzbV9wb2xpY3kuYw0KPiBAQCAtOCw3ICs4LDcgQEANCj4gICAq
ICBDb250cmlidXRvcnM6DQo+ICAgKiAgTWljaGFlbCBMZU1heSwgPG1kbGVtYXlAZXBvY2gubmNz
Yy5taWw+DQo+ICAgKiAgR2VvcmdlIENva2VyLCA8Z3Njb2tlckBhbHBoYS5uY3NjLm1pbD4NCj4g
LSAqICANCj4gKyAqDQo+ICAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4gICAqICBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiwNCj4gICAqICBh
cyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4NCj4gQEAgLTMyLDE0
ICszMiwyMSBAQA0KPiAgI2lmZGVmIENPTkZJR19NVUxUSUJPT1QNCj4gIGludCBfX2luaXQgeHNt
X211bHRpYm9vdF9wb2xpY3lfaW5pdCgNCj4gICAgICB1bnNpZ25lZCBsb25nICptb2R1bGVfbWFw
LCBjb25zdCBtdWx0aWJvb3RfaW5mb190ICptYmksDQo+IC0gICAgdm9pZCAqKnBvbGljeV9idWZm
ZXIsIHNpemVfdCAqcG9saWN5X3NpemUpDQo+ICsgICAgY29uc3QgdW5zaWduZWQgY2hhciAqKnBv
bGljeV9idWZmZXIsIHNpemVfdCAqcG9saWN5X3NpemUpDQo+ICB7DQo+ICAgICAgaW50IGk7DQo+
ICAgICAgbW9kdWxlX3QgKm1vZCA9IChtb2R1bGVfdCAqKV9fdmEobWJpLT5tb2RzX2FkZHIpOw0K
PiAtICAgIGludCByYyA9IDA7DQo+ICsgICAgaW50IHJjID0gLUVOT0VOVDsNCj4gICAgICB1MzIg
Kl9wb2xpY3lfc3RhcnQ7DQo+ICAgICAgdW5zaWduZWQgbG9uZyBfcG9saWN5X2xlbjsNCj4gIA0K
PiArI2lmZGVmIENPTkZJR19YU01fRkxBU0tfUE9MSUNZDQo+ICsgICAgLyogSW5pdGlhbGx5IHNl
dCB0byBidWlsdGluIHBvbGljeSwgb3ZlcnJpZGVuIGlmIGJvb3QgbW9kdWxlIGlzIGZvdW5kLiAq
Lw0KPiArICAgICpwb2xpY3lfYnVmZmVyID0geHNtX2ZsYXNrX2luaXRfcG9saWN5Ow0KPiArICAg
ICpwb2xpY3lfc2l6ZSA9IHhzbV9mbGFza19pbml0X3BvbGljeV9zaXplOw0KPiArICAgIHJjID0g
MDsNCj4gKyNlbmRpZg0KDQpEb2VzDQoNCmlmICggSVNfRU5BQkxFRChDT05GSUdfWFNNX0ZMQVNL
X1BPTElDWSkgKQ0Kew0KwqDCoMKgIC4uLg0KfQ0KDQpjb21waWxlIHByb3Blcmx5P8KgIFlvdSds
bCBuZWVkIHRvIGRyb3AgdGhlIGlmZGVmYXJ5IGluIHhzbS5oLCBidXQgdGhpcw0Kd291bGQgYmUg
YSBiZXR0ZXIgYXBwcm9hY2ggKG1vcmUgY29tcGlsZXIgY292ZXJhZ2UgaW4gbm9ybWFsIGJ1aWxk
cykuDQoNClNhbWUgZm9yIHRoZSByZWxhdGVkIGh1bmsgb24gdGhlIERUIHNpZGUuDQoNCj4gKw0K
PiAgICAgIC8qDQo+ICAgICAgICogVHJ5IGFsbCBtb2R1bGVzIGFuZCBzZWUgd2hpY2hldmVyIGNv
dWxkIGJlIHRoZSBiaW5hcnkgcG9saWN5Lg0KPiAgICAgICAqIEFkanVzdCBtb2R1bGVfbWFwIGZv
ciB0aGUgbW9kdWxlIHRoYXQgaXMgdGhlIGJpbmFyeSBwb2xpY3kuDQo+IEBAIC01NCwxMyArNjEs
MTQgQEAgaW50IF9faW5pdCB4c21fbXVsdGlib290X3BvbGljeV9pbml0KA0KPiAgDQo+ICAgICAg
ICAgIGlmICggKHhzbV9tYWdpY190KSgqX3BvbGljeV9zdGFydCkgPT0gWFNNX01BR0lDICkNCj4g
ICAgICAgICAgew0KPiAtICAgICAgICAgICAgKnBvbGljeV9idWZmZXIgPSBfcG9saWN5X3N0YXJ0
Ow0KPiArICAgICAgICAgICAgKnBvbGljeV9idWZmZXIgPSAodW5zaWduZWQgY2hhciAqKV9wb2xp
Y3lfc3RhcnQ7DQoNClRoZSBleGlzdGluZyBsb2dpYyBpcyBob3JyaWJsZS7CoCBUbyBzdGFydCB3
aXRoLCB0aGVyZSdzIGEgYnVmZmVyIG92ZXJydW4NCmZvciBhIG1vZHVsZSBvZiBmZXdlciB0aGFu
IDQgYnl0ZXMuwqAgKFNhbWUgb24gdGhlIERUIHNpZGUuKQ0KDQpJdCB3b3VsZCBiZSBzbGlnaHRs
eSBsZXNzIGhvcnJpYmxlIGFzDQoNCmZvciAoIC4uLiApDQp7DQrCoMKgwqAgdm9pZCAqcHRyOw0K
DQrCoMKgwqAgaWYgKCAhdGVzdF9iaXQoaSwgbW9kdWxlX21hcCkgfHwgbW9kW2ldLm1vZF9lbmQg
PCBzaXplb2YoeHNtX2hlYWRlcikgKQ0KwqDCoMKgIMKgwqDCoCBjb250aW51ZTsNCg0KwqDCoMKg
IHB0ciA9IGJvb3RzdHJhcF9tYXAoLi4uKTsNCg0KwqDCoMKgIGlmICggbWVtY21wKHB0ciwgWFNN
X01BR0lDLCBzaXplb2YoWFNNX01BR0lDKSkgPT0gMCApDQrCoMKgwqAgew0KwqDCoMKgIMKgwqDC
oCAqcG9saWN5X2J1ZmZlciA9IHB0cjsNCsKgwqDCoCDCoMKgwqAgKnBvbGljeV9sZW4gPSBtb2Rb
aV0ubW9kX2VuZDsNCg0KwqDCoMKgIMKgwqDCoCAuLi4NCsKgwqDCoCDCoMKgwqAgYnJlYWs7DQrC
oMKgwqAgfQ0KDQrCoMKgwqAgYm9vdHN0cmFwX21hcChOVUxMKTsNCn0NCg0KYmVjYXVzZSBhdCBs
ZWFzdCB0aGlzIGdldHMgcmlkIG9mIHRoZSBpbnRlcm1lZGlhdGUgdmFyaWFibGVzLCB0aGUgYnVm
ZmVyDQpvdmVycnVuLCBhbmQgdGhlIGF3a3dhcmQgY2FzdGluZyB0byBmaW5kIFhTTV9NQUdJQy4N
Cg0KVGhhdCBzYWlkLCBpdCdzIHN0aWxsIHVuY2xlYXIgd2hhdCdzIGdvaW5nIG9uLCBiZWNhdXNl
IGhhc194c21fbWFnaWMoKQ0Kc2F5cyB0aGUgaGVhZGVyIGlzIDE2IGJ5dGVzIGxvbmcsIHJhdGhl
ciB0aGFuIDQgKGFzc3VtaW5nIHRoYXQgaXQgbWVhbnMNCnVpbnQzMl90LsKgIHBvbGljeWRiX3Jl
YWQoKSB1c2VzIHVpbnQzMl90KS4NCg0KQWxzbywgcG9saWN5ZGJfcmVhZCgpIHVzZXMgbGUzMl90
b19jcHUoKSBzbyB0aGUgbXVsdGlib290L2R0IGNoZWNrcyBhcmUNCndyb25nIG9uIGJpZy1lbmRp
YW4gc3lzdGVtcy4NCg0KQWxzbyBhbHNvLCBwb2xpY3lkYl9yZWFkKCkgcmVhbGx5IGRvZXNuJ3Qg
bmVlZCB0byBtYWtlIGEgdGVtcG9yYXJ5DQptZW1vcnkgYWxsb2NhdGlvbiB0byBjaGVjayBhIGZp
eGVkIHN0cmluZyBvZiBmaXhlZCBsZW5ndGguwqAgVGhpcyBpcw0KaG9ycmlibGUuDQoNCkkgc3Vz
cGVjdCB3ZSdyZSBnZXR0aW5nIGludG8gImluIGEgc3Vic2VxdWVudCBwYXRjaCIgdGVycml0b3J5
IGhlcmUuDQoNCn5BbmRyZXcNCg==

