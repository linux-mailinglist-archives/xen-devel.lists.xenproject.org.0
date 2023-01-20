Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92160674846
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 01:49:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481429.746300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIfaI-0005hm-6K; Fri, 20 Jan 2023 00:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481429.746300; Fri, 20 Jan 2023 00:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIfaI-0005fu-3Q; Fri, 20 Jan 2023 00:48:46 +0000
Received: by outflank-mailman (input) for mailman id 481429;
 Fri, 20 Jan 2023 00:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIfaG-0005fo-6Q
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 00:48:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e600661-985c-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 01:48:41 +0100 (CET)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 19:48:38 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM8PR03MB6229.namprd03.prod.outlook.com (2603:10b6:8:24::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Fri, 20 Jan 2023 00:48:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 00:48:35 +0000
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
X-Inumbo-ID: 2e600661-985c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674175721;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FMQR7PAlz2RaPG9+7fc+6IJPDJjCaab4NobvEecYcdI=;
  b=aNlzy5eL9WrfJalW3TAHCqtzxOEiDHSnymK13WJFtlsOpLGarIb4Xxgv
   u0dvzrnkw+pN59oozxXJmXu3tsgZ+MHRW0NKhDDZnwaImiGLgl6mFZY5Q
   OA2WZXK8ZykZ2f1U27b2yIENJjTlHew3Ja/Lo2ejg+xQsWHpW3j8AtpgT
   Q=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 93475028
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1xXmkKJGSaoKc9l1FE+RjpUlxSXFcZb7ZxGr2PjKsXjdYENSgjwGx
 2YaWDvSP/aPMGr8Ko9zaouwoUMGuZKAztQyQVZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVvPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pW1FT2
 OAiOAoSNAqhhvLonK+/cvlj05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMkWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHinB99KTu3QGvhCx0zM/FMpLk0sSELn/PjnmGW4Sv1EJ
 BlBksYphe1onKCxdfH6WxC7u3+F+B0BQd1bE+49wA6Iw6vQpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuwMyUIKW4JZQcfUBAIpdLkpekbjA/LT9tlOL64iJvyAz6Y6
 yuRsCE0irEXjMgK/6a251bKh3SrvJehZgE07wPTQ2msxhl4eom+Zoqjr1Pc6J5oJoGTREiMp
 3gAls2X6sgBCJiMkGqGR+BlNLit5u2ZOTzGx1B1Fp8q9i+F5HKoO4tX5VlWL0BvNMEGdTb3Y
 VT7tgZY5ZsVN3yvBYd9ZIi7GoIn1qjkGNHsUNjba9NPZt56cwrvwc11TUuZ3mSonE1yl6g6Y
 M6faZz1UitcDrl7xj2rQetbyaUs2i012WLUQ9b80gij1r2dInWSTN/pLWezUwzw14vcyC29z
 jqVH5LiJ8l3OAEmXhTqzA==
IronPort-HdrOrdr: A9a23:v5h6XKybNEcKTBadnEYXKrPxx+gkLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBepTiBUJPwJE80hqQFn7X5XI3SEzUO3VHDEGgM1/qY/9SNIVycygd979
 YYT0E6MqyNMbEYt7e13ODbKadb/DDvysnB7oq+r0uFDzsaFp2IhD0JbjpzZ3cGIjWucqBJc6
 Z0iPA3xQaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJppmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF4CfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqA/7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1bwKoVKuZFIMvJ0vFgLA
 BcNrCE2B+QSyLDU5nthBgp/DVrZAVpIv7JeDlZhiXf6UkmoJkw9Tpp+CVYpAZCyHtHceg928
 30dp1ykrdAV8kXar84KtsgbKKMezHwaCOJCXmVJ1v/EqEBJjbqkL7YpJsIxMzCQu1V8HMV8K
 6xDm+wcVRCJH4HBaC1re522wGIT2OnUTv3zMZCo5B/p73nXbLudTaOUVY0jqKb0r8iK9yeWe
 26N49WD//lPi/pBZtD2RH4VvBpWA4jueAuy54Gsmi104n2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2IMlb9EikVnLxnRCUAhrWCwDC1IM1FLKf8/kYyYALOIEJug8JiU6h7sXOLTFZqKQ5cE
 Z3PbuimKKmomu9+3rO8gxSS1dgJ1cQ5K+lX2JBpAcMPU+xebEfu8+HcWQXx3eDLg8XdbKeLO
 eenSUAxUuaFe3l+cl5MaPUDouztQpnmE63
X-IronPort-AV: E=Sophos;i="5.97,230,1669093200"; 
   d="scan'208";a="93475028"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VILW7RbsPFEY7lFUTFpkQNoqm0C7MzmU6nWBWfZfeylURee7NUTeBET5GP4P3SRwTQttef8eK35mpnhGtdRcdfVmX+TxirBnP36HjQUzeM92esJ9y+eer5VhC98dLTGhOZv5NoULNfF4mEYB0MDSNKF2YuX//J9FS2gTQFrPLCyiou5i1lVaMT+XkXXKzGQt7PDAzf5LMWGZa2p8gBjY+duJNIPU7Jty+ESzTBcDlHjBKMM0AUY6zK2eaHs3w1FrgmxFIG3oAxiSr/5c7JTTXstLZtvbl7S7gbrNfSTdGMxtrOY3CUP5/CRgdK7qd0/YRX4qFJZvOk+pyc4Qo5k2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMQR7PAlz2RaPG9+7fc+6IJPDJjCaab4NobvEecYcdI=;
 b=kk11RCg2p3B92pW5XEV5Bq+3LE5P9W4t9Et3fLqPp8No4Lw9ThpfPcqmbNF1cZIalPIluUMAWRkXUN6birx2kb8Yo4i7PMOikMJXsD2OqW85eEDidE6VDC9W/VbWlaI0FMxD7kbMq/A6b/cw0CHSq9973K+PkjL50B3fSLj5EkRWy00LNQIGSu0CWhpv4C/hLNZ1qxmpjPHN6SsUwH0006EYD61E7i2lPJMLVeDvEclOftRYLGK33wFMu+AF0k5PReMlBXi5EY+QplwhevIILiKyJ4DbRlbcBq5GQlfPb8Vo1r4yazmQeZfCT1SDWFZLrBYBGVX5l2wChwJLp1yGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMQR7PAlz2RaPG9+7fc+6IJPDJjCaab4NobvEecYcdI=;
 b=TCj1VlzM5InSGJJ1CriDySpRvWn4F67SCdUpoRymKryAyl5OWS1Hy8DPX/Bycv14ul2dqM7g7xEpuSU2HiBa5/Uas0PWXuBFB5eeQIEhhvgspi+P7xUU6d3FPpJktce3UtSzNackNXVl9LVOdTzQYXWBRcwxN0SNCOAjrTeM720=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Bobby
 Eshleman <bobby.eshleman@gmail.com>
Subject: Re: [PATCH v5 4/5] xen/riscv: introduce early_printk basic stuff
Thread-Topic: [PATCH v5 4/5] xen/riscv: introduce early_printk basic stuff
Thread-Index: AQHZLA9l20cepYD69E6g31XDw2HHwK6mebiA
Date: Fri, 20 Jan 2023 00:48:35 +0000
Message-ID: <aefd4cb9-9a60-4ef1-ff45-dedfb6c37203@citrix.com>
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
 <8d7ac0dc51a6331d3efa7fcda433616670b46700.1674131459.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <8d7ac0dc51a6331d3efa7fcda433616670b46700.1674131459.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM8PR03MB6229:EE_
x-ms-office365-filtering-correlation-id: b9f9e263-09f5-4e53-48c8-08dafa800fcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zROTV1iYqQxF15sKGf1GByq/2LyKhOcswZho8kdrMPFHh3xoKJAlhIZP59he85X5rP1rqZQC3/g9oQGuE/g0rIGqYKdkpfLY0Fg7kZgMOXxG7kXqB1nK0WmT050ToGh5F4JS3FtuXMhJNfCuj1egNy183R65U1jWM645d4mxAlZpNSai1HMrYnb5EtJFaU6EfIwb37TSGKUL2YfhS4utC1jReiSC1GQaqc/UFb0AaR7i35qGgDIF3spOXIiOflo49Ae3or28wBMBzH1gJL8lYU2Y+/PJK7bCiBHJoRiNhTMnohvL9jVvWzlJrrv5cYhM3XjKrBFlBQq4keTGDDk335opAeThLaqzE2xfdXdnMKoHI6TaO+90U9Voivk2WbYqzLCDJ0aAkC4KIWpynuHYy1bHoZ+vocN12UnkVORNmaUarhNSJc8ONGUKKR92N6XwR5tnUcwAE4u+zaXqhbWUpudgR7rrWbAG7vqaqIR7GUKJfdI8SNmU1DMh72m9YPwGkJWo5NX9GIzcsKmIqfG/0wc6sBerJGt+Q0QdTswW/urOQElwTMqZnY13RSmPXxLDdhAFzuvHFmLrxl+LVBF9K9f9A2cnmO6esZWKDiCeYzjnD3L7jzM3w68cHeegTZ0uEvbP0s2G6OqEiax6t4ngYLby1AJd4j63sJdPczmsylLTD6nPRTq+SJ8ecsi4uIicW1RdjmDl3HPk5EVGL6WKXNJSzerA5rQ56bKVV6VJ7s2B/4Knaahcc+UPDapQzqXr9IQd9rznth687gRHQPRo2Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199015)(82960400001)(38100700002)(122000001)(66946007)(38070700005)(31696002)(66476007)(76116006)(5660300002)(4744005)(7416002)(2906002)(91956017)(8936002)(66556008)(8676002)(4326008)(64756008)(41300700001)(26005)(2616005)(66446008)(186003)(6512007)(83380400001)(53546011)(54906003)(71200400001)(110136005)(6506007)(6486002)(478600001)(36756003)(316002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkdRZlMrNks3T2ZaM0lhbXkyRDZOVnN3eS9GdzFzOGp5V0VFLzZ4aDV0VGta?=
 =?utf-8?B?TFArY3p1UndjNkdQYmxndytxdWdGTUdvTE02cnc4Szc1YTJYSFZ5ZDFNbm1R?=
 =?utf-8?B?d3IxeXJwNDNzQ2lmRUlsOE00YzR0S3V4dnRneTZDL24zVXZmajVDS3J0MGRS?=
 =?utf-8?B?YTBNelNTS0wxU09LTG1tdHhJaW1EWDNsNkhndGsreGtYTHRLUXI4ck1JRFZk?=
 =?utf-8?B?T2prWVFkR3FQYVVnVkkzMVJxcUhmVVNVYWlTbWFiSFRoV0QyaU9MU21LTGRT?=
 =?utf-8?B?SytmaE1RVDRObk95OHkzUVhoK2FjNFEyRU82cnhYdjN1N0loOGozNUlydWh6?=
 =?utf-8?B?anhQSFo4MjZWNzRoRlRrUlFMc1hTYzh1ZnlHQkkyUFVMY0N4VTlocWFOamlT?=
 =?utf-8?B?czhUZnVLTU1YT3NlSWZNemxwYUxXdkU4NjV6YkZPUE9FUmxKZUV2cXZZd3hx?=
 =?utf-8?B?N1I2K3FhUnJDcFFmcFhYTE9EbExQaVNhSjRJblA2bXJ2SHJaL1JidkZ2cEph?=
 =?utf-8?B?T1VZN2NZUWNJLzB1VloxdXZrV3J5RnhvWVN3RXg5YThFUityc28zM0lMUjFy?=
 =?utf-8?B?VDJ6T3lMeVNTZlh5dTgrbEttdVVWN28wOSthZ2dTczg3eXJNQ25IMHdSd1BD?=
 =?utf-8?B?WUlxQ0ZzQUdRdUlCOFJkQ2xZdGtMSDlSOC8rOFVEbzRJREl3NzR1TjhNalFI?=
 =?utf-8?B?cHNGVUJSTWZvSyt4ajlUSVlXWkRJNDdIejZ1MGdQSXZtSFJoLzNRUksyS0pW?=
 =?utf-8?B?dk1xdlRiejlQSnYvQUZJbWU2clVWV2EvRmVlclArd21adHJUZlBlYTJoSm5y?=
 =?utf-8?B?NjFQcEtRQ3lSZ1VkVXl4bjZETDhlWHVzMC9nbk1HUVNZUVRXME1TNmJBZXZo?=
 =?utf-8?B?aEpWUHhSL2NHb1Jkdy9tQW5NYlhLai9xbUlvc3dyYThGMUF4RVFweCtiYS9q?=
 =?utf-8?B?UmIyaGoyRXFVU256aWJsa2F6dVVnTDVITTJKcmdoZ0JxUXZtcktZNS9QUjhT?=
 =?utf-8?B?NW5aWWtiUGRENXZ5VDMydVkraWhPM2hrazkvNmFlZXR4eDBaMGVIc2tVWWdN?=
 =?utf-8?B?OWNPeU1qMThuWi8xVnMwWFBEQzk3Um9JSnhaMWVmMUZ0cmxMRGpvY0x0b043?=
 =?utf-8?B?NnRRMXQ4SGVQYlR6SlluUnNnQmJ5dkRnOU9qSGlNbUFSRm5BdytiaG1ITGx6?=
 =?utf-8?B?Um5XOWV6OHZRNVE0bFl5Q3VIVXFoSWt3UkJvTThFWjdkMjBBNGRxd00rQnhx?=
 =?utf-8?B?RUo5blpqV0ViaWQvdkFETFVYdjFqazJEM1RrTUNUb3UzZWxFY1o3VWtYSjhv?=
 =?utf-8?B?YTZJb2xoNnhWeEVHOExRYjJwOFJ1cE1uUVlPMWJvRERnc2xGL2ZBekIxaEpE?=
 =?utf-8?B?djNwa1JyNFQvZkdBb3hJdDZHWDFSSWdYdURKQlNaek94UWNpVm9mcUxySEpJ?=
 =?utf-8?B?OEhBcHpzYTU1VWNFRnFYZCtKSTRUSVZWcGZMV0hzOTlQOW5SeFpHeFhoRVVh?=
 =?utf-8?B?WlJUWmxOQWJWY09WbjRtQVVzVklSeE9lbmcrOG5FYldpc1lqSStoaE51d3cx?=
 =?utf-8?B?djVNeUJxVVhvMSttTU43ajFVeXA0UmlQUHV5T1FNK1k3Zjk2ZGNlQS9kNHlS?=
 =?utf-8?B?LzRSKzZqZE5xMWRRMUQ5NWgvdmJXcmZpenkzRFN6eUwyV012MCs0RGpqTFNP?=
 =?utf-8?B?MG02ejRkM3lKZE5GZ25relVMYVl4d2lkSHVOZlVQa0VBTVZlMjJqSWpRTHVj?=
 =?utf-8?B?UGJJMm11RWdSSm9pWHdYa3VKVlpjK0Vwd2NsM2xzcGVJQU1NeGg3dTAvM1pa?=
 =?utf-8?B?a1lxcStaczRaUU02RTI3QXRObHVPNjZEbThtbFJLZlVpbmhudUl6UjlGVHJy?=
 =?utf-8?B?K0N3Z0RSdTQxRUQzVGExS1IxalBLeUdKRTN3MEgzMGJxMTF6THpndTZTUy9U?=
 =?utf-8?B?OFE4bjF0S2RKS2liN3ZEdEU0RVJpbklaTm1ISEdFSHdGcnk2UGhvbDZOOGVl?=
 =?utf-8?B?bXlrODhBM2RzRHVUSC9rTWJyNHhTT1lYYmVOc0ZUbmZpcmFvUW1ZNk5xMVVH?=
 =?utf-8?B?SWVDbFEzWURIeVdsYngranZ3ODRMaDNnRUs4NVFjcWl0dGJXTE5HZ3ppcU11?=
 =?utf-8?Q?xH6MieEcQhSDDOZhRagHnhX+7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81C76C455AA8C647BD237D01E2B390F7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?WXRVRG9MTHEya1IzUXhEbGpZWHdEa0p2alp3WjhaN2daWlluem8rQU52b0ll?=
 =?utf-8?B?WWZIbE05Wno4ZkozUDFoeE44ekV1OWowQlZURmltRUlVZ242RHd1YXRMN3Iv?=
 =?utf-8?B?R21MTkFvaXNNQ3hOWkg1K1N1MnRWaUZnT3FOOVZOckY1ZTFYQlZMRVNDRnZM?=
 =?utf-8?B?Yjc1NksyZWxKNElMTFNoTWVSclpKMlZiNUtub2V6UDZTUE5ySDVXSExyamha?=
 =?utf-8?B?dXI0TEhzRmExcUZxNVdCYTJIRERZemd5bGlEVmZNOElyd2JsdFBXSllZcjB4?=
 =?utf-8?B?Zk9ESDN1UXRQMVdKcCtsZmh6YnhrTWtrZTdjOWVPQk5sTkZnZWpGYTY5NGdV?=
 =?utf-8?B?eXg3QmN0cmFDakQ5bXhTN0VlK0dIRlByR1ExaUhWMVpUeVRPeUxiejA1RlBU?=
 =?utf-8?B?RVRydnZtMXNWZFFsWUptQ3V2eW1jUjVRMU5KN3lDTUNvVEUxaXdCRnE5akJN?=
 =?utf-8?B?a0V0NDNlWkZpbVc5d0lzbHkrR08yR0RXMHBnUGRvMkpleGpsTTZ6RHByZnho?=
 =?utf-8?B?M0cwMGNSNS94L2lleGtEL2xCeEZHSkxPdTUvT2ZOS3czbkQ4dzhJSHJnZmtH?=
 =?utf-8?B?ZHo0MTczd3VMWVZjekZDVG1SVzNnZEl6TUdrclB3OVVyUkRmU2M0OC9MY1Vy?=
 =?utf-8?B?R2treDRieVZ1VWowYlBTMk5vL1M2djQ2M2VwWWxqUkROZ1hIeEwyTmVLMTBK?=
 =?utf-8?B?dGdJZi9KWUVNbEd5L0tvNkswREZvOUs0elk2WHhoRFYxNndXSHlVaVI0c2pp?=
 =?utf-8?B?L0kwQTVyK0tWeVRiOXBKaHdDRzNEaURsWnhIQnUzVkh0MUx0dUNCRjJ4QkRm?=
 =?utf-8?B?cUdaOVR0d0s5SFhDOGlBdnNMTUcyL2t5N1ZyYjV3dFRWcXVKK2RGWllseEtM?=
 =?utf-8?B?cFNCK2hxU2ZKTVYzRE9TUmdGdjA1S0tvdWxZaTF2aHh1aFBSSHpycUdmQ0hY?=
 =?utf-8?B?dStDZ0QrYk8rNGh0cFRCc1Fpdkk1VFlhYkRFcnhLbVNFQ2hGSTFVV1diWmlK?=
 =?utf-8?B?NXRzLzBtME5RQXhXVld0eDB1MExSL0J4WStoY3ZPSlNvMXpCdWVUSkFhc0dI?=
 =?utf-8?B?NjJUV2VKcjdWS210bmtuaDFVMFhiT0p5Wkt6V1R3SThCMExxVVEvWkV4ZmRv?=
 =?utf-8?B?QlpWczNxRnE0blRWeGNtdFV6eDhkdnZJZ2lyTjNHSFdSUGZRRTlBYng2S3JY?=
 =?utf-8?B?QmZNK21UelNPOU53ZE5UNkVTeWptOCtBbDZnS0dwdmpqRjlGTnlvZGx6NTZH?=
 =?utf-8?Q?prVLwo+bCUvAEOI?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f9e263-09f5-4e53-48c8-08dafa800fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 00:48:35.3616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CzEPXAGYdNLjE27zOCTHPMKlRihRG36Y5jhC9hHNdvge1kJX7uAH4YX1293RH7w0RopZn/KLp2kmsiKaXch6rQuXWWcpFGMbJDf3Et1kXuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6229

T24gMTkvMDEvMjAyMyAyOjA3IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvcmlzY3YvZWFybHlfcHJpbnRrLmMgYi94ZW4vYXJjaC9yaXNjdi9lYXJs
eV9wcmludGsuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi42
ZjU5MGU3MTJiDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIveGVuL2FyY2gvcmlzY3YvZWFybHlf
cHJpbnRrLmMNCj4gQEAgLTAsMCArMSw0NSBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAgKi8NCj4gKy8qDQo+ICsgKiBSSVNDLVYgZWFybHkgcHJpbnRrIHVzaW5nIFNC
SQ0KPiArICoNCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBCb2JieSBFc2hsZW1hbiA8Ym9iYnll
c2hsZW1hbkBnbWFpbC5jb20+DQo+ICsgKi8NCj4gKyNpbmNsdWRlIDxhc20vZWFybHlfcHJpbnRr
Lmg+DQo+ICsjaW5jbHVkZSA8YXNtL3NiaS5oPg0KPiArDQo+ICsvKg0KPiArICogZWFybHlfKigp
IGNhbiBiZSBjYWxsZWQgZnJvbSBoZWFkLlMgd2l0aCBNTVUtb2ZmLg0KPiArICoNCj4gKyAqIFRo
ZSBmb2xsb3dpbmcgcmVxdWlyZW1ldHMgc2hvdWxkIGJlIGhvbm91cmVkIGZvciBlYXJseV8qKCkg
dG8NCj4gKyAqIHdvcmsgY29ycmVjdGx5Og0KPiArICogICAgSXQgc2hvdWxkIHVzZSBQQy1yZWxh
dGl2ZSBhZGRyZXNzaW5nIGZvciBhY2Nlc3Npbmcgc3ltYm9scy4NCj4gKyAqICAgIFRvIGFjaGll
dmUgdGhhdCBHQ0MgY21vZGVsPW1lZGFueSBzaG91bGQgYmUgdXNlZC4NCj4gKyAqLw0KPiArI2lm
bmRlZiBfX3Jpc2N2X2Ntb2RlbF9tZWRhbnkNCj4gKyNlcnJvciAiZWFybHlfKigpIGNhbiBiZSBj
YWxsZWQgZnJvbSBoZWFkLlMgd2l0aCBNTVUtb2ZmIg0KPiArI2VuZGlmDQoNClRoaXMgY29tbWVu
dCBpcyBmYWxzZSwgYW5kIHRoZSBjaGVjayBpcyBib2d1cy4NCg0KSXQgbmVlZHMgZGVsZXRpbmcu
DQoNCn5BbmRyZXcNCg==

