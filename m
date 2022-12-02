Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F69640614
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 12:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451899.709704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p14Yl-0003cz-6z; Fri, 02 Dec 2022 11:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451899.709704; Fri, 02 Dec 2022 11:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p14Yl-0003aN-42; Fri, 02 Dec 2022 11:50:27 +0000
Received: by outflank-mailman (input) for mailman id 451899;
 Fri, 02 Dec 2022 11:50:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHVG=4A=citrix.com=prvs=328764c7b=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p14Yj-0003aG-MS
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 11:50:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7cde0b-7237-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 12:50:17 +0100 (CET)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 06:50:18 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BL1PR03MB6040.namprd03.prod.outlook.com (2603:10b6:208:316::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 11:50:16 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 11:50:16 +0000
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
X-Inumbo-ID: 7c7cde0b-7237-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669981823;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y1I07nZvZXjukZSzT68yIEwgGUxUWyJg4CbBDronIwY=;
  b=LmVnedFPG2HlJdg35L2Ky+5yfnQMYNpyhisfCeRMpg5VdEOd+z4DYueb
   CiqUBEChpD8Sl0ABJiU5xDRxFCy3EpsTU4LdH3kNZmP3m7Er6k7a6lcbS
   Le1TY8b4cPh8FEJpoB+o3o3u09K+rPvCbdnBDtXFEqcpOHhcPRV6Q/R9Z
   0=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 85801937
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sZg2b6wYaH0qtNKNvVt6t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkVTm
 2QXCGiFbPeIamWnL4glaIyy8EkHupKHm4ViGldtrSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPaoT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV5S5
 8w0BWgsVzCOtaGo7IOkbPZG1/12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQruFTuGIO9ltiiTsVPn12Ep
 2vAuWD4BB0bO/SUyCaf82LqjejK9c/+cNJPROXhp6U16LGV7moLKUVNZEmRnaOk02q1X8MPA
 G4LpjV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc6TCIn/
 kWElNToAXpoqrL9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A6d+8pog210rLVow6SPTzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:rmWGqq0WpFTYW2usmB1SVQqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="85801937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cR/oi2EvrNMoQzVVD58UNSupoiPtsoxTqr0Zry1FJVxc6pbrHDH0xfN/19qVT+nyNPTwUYNhXWenrdTWz/lJ+97s9d72yxcCM4HvOFWHauTMvljFoOiQn39ADUXrj/lD/XPkmTQfGMOaoFd0EjlkI/ngmoSXyGhBc1H16b6+Nc+Hx3KpPq9RdUvyGmnN8naXVjqLZGCVo0y713UK+yPHyNzx4MH5wXh25WdYqcJrQKbd187hpOVa7bf0DlwuMffYv5dP0SyJqvz1A4DOACh1ZYs/rSgBJYMSS/VNrp+HY7H1+MrCffcnxVMoVC6bkKeu+OUV2mXth3aRphlZZr9zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1I07nZvZXjukZSzT68yIEwgGUxUWyJg4CbBDronIwY=;
 b=AvC6OoLnLvVsUBP686HbVqxlxwW2edtbpA8OzEgtWXFvPu8K/b4QnJUEXHQK7vJZguwXhEhp0xOGj80YgsdUkgtqlNHcMU/KuYTLTdzqdebV9G6I09OswPIXxPMOa0bm+tx6coetIaXXyK4FQ9pW3GLSgEHD+ZVAv/1noQKnJa0b7rupd4TmP3dZIyQeCY1zdxNTyjuzzniEKRRp+9UtD6Koesua7hJjguS76xLBYHRQe08ir1g3/Bu54b+YtaRpixNZdRVrEYja67AdIoGTBSszH6Etg0HScjNZoXp7+D7jGx3U3ihbiD5YIYfboBY5vLelIVzPmwdytLidkCHTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1I07nZvZXjukZSzT68yIEwgGUxUWyJg4CbBDronIwY=;
 b=IntUkCEpJzaObgroIQztCWeS1dOxNZHkh0UhIXK5S1CoVfJPnir1k6nYPrZOnrm4savd7kXwNLIsGvlydBWfBsxSIdoRe1yfLUF1gPz5AAzmc6gbRbtfhIpAJUTsj+pEagDxLA8iohlF+3jQ7q1IcvwBJTuqiz+D94khpv8/n34=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 3/4] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Topic: [PATCH v2 3/4] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Index: AQHZBjy6tVGKXp8AVkOBzk6mFgDO865afAEA
Date: Fri, 2 Dec 2022 11:50:15 +0000
Message-ID: <4B52142D-7A45-47CE-B3F7-F94EB209FCE4@citrix.com>
References: <cover.1669978356.git.edvin.torok@citrix.com>
 <af355b5ef654745130815f30299d67bea7284f0e.1669978356.git.edvin.torok@citrix.com>
In-Reply-To:
 <af355b5ef654745130815f30299d67bea7284f0e.1669978356.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BL1PR03MB6040:EE_
x-ms-office365-filtering-correlation-id: e48cc90b-8ea9-430d-1156-08dad45b60ee
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NWEdgGtJA/E+ndbEQULng5Gcs7iOmW14bEbc2Rj1aTtQAA6GdrQ/Aq6vWjLKwpjRAweq33+UPgrqsvX9YQbXiQndhtZy6eZ//p8V0hNacFgZ1ud+oCcy0N8HCG8VpvH+MjiVrquG2DApeoshxVR58bXfPY/vJBuyICSe/ZwUJox2zQ5Lw4l4C+JzNdRTpm2LCCi1jmfHomwndI091hgbw9LS4WVy9D8xGnhV+9TJYnSiuICzh4MeY1f2ko5awZZrflRGYcqT7qn/vnYo2Tgav8SjXCnozTnysP48un5ttEZ/a5YsgJlkpl614L4e5jX8Wx0e+qqq4xfIHkW2GKPN45GurieGx6OqAeYZiaIj3rcqAXM4NtnbhxgP38b2xPwnemtWCVa9vR34aZyN+3Z7Gs7+eUrD5e365jUrJsCJHPm3krJq7OGTuiGxEr2nU53uxtth3hore8nxxEdgdFwcaztHHcLeuYRsfswSFMOzRFC+RNLE3cpNY8RFYgM68csp3Bu4tarIozaLnqnTYzqob0KcxOqdP3Ci5SUosPWzuhC8QNIgX9XFxLmTz3izQzjKk5M25bmQPK/+Eewdy/FMgCoYiN7nJiMwfnb4+4VASZt1f1MUWbLhcDjekiQa4URKVGvPoART+49hfSBxLiteLA//HTNqSQn4Ft6025fomz5QhTNhkHxdsllMgv0+0suwFlme/uvaqXcqeDcCXsdmoYvUvSiyITwRGRZNQ09ojvg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199015)(86362001)(36756003)(33656002)(2616005)(41300700001)(76116006)(186003)(66946007)(64756008)(4744005)(66556008)(82960400001)(66446008)(8676002)(44832011)(66574015)(5660300002)(4326008)(6506007)(71200400001)(107886003)(6862004)(316002)(6636002)(53546011)(6486002)(478600001)(8936002)(37006003)(26005)(6512007)(54906003)(122000001)(38100700002)(66476007)(38070700005)(91956017)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3AwMzZUMlVDZjF4YjZBQVNzN2xBV2Evc3pmczNRejZxNDhCVVhWQmlmNUNB?=
 =?utf-8?B?TGlzUjlXS3pVVmpkb3g0bzhieStPM1c2N2pVenNqTUw5N1JFMUxnRzA5dWVp?=
 =?utf-8?B?Yy9qUXJCMElJbDlOOUtlbjBMaWllQ2ZIajluWmNoM2VoNkJOeG00bmxwa3Ey?=
 =?utf-8?B?RUJLcjVGT2ZsbWd3Wko0NkgvNTB4TlhLQnhuU0I2NXEvS2EwVUVDbkFYMytM?=
 =?utf-8?B?S3J6bmtzTVlFMERWOUJSNTdXNXVhZm00UzdJWVJESmk0QXRkdytjRGxuckty?=
 =?utf-8?B?UTI2d2pmQkl6WENWZTFGQTRYWnRZMjhxcWxYU3A3RGFyNDY3eVFCUCttNHZx?=
 =?utf-8?B?RC8vTkVhdmVxbW5TNHNmSlR4Si84OWw1cTFUbTQwNTR5ZVFIWk1FbGU1ZlN2?=
 =?utf-8?B?YXdEcVRHdDVXVVhKU0psL09wSFZmZ1QvV1hXUHJBRWFRWmxzenhTTFFvQkpS?=
 =?utf-8?B?NS9wMHJJZ3B5SUFUdjdXUTFrWXduSzhHNDRBaTM3RGFoTmxiVXBvTkxsczlk?=
 =?utf-8?B?ZlhNeUlZTW1LRUVQQ2pPYlpuYWdFY3ROSldVRi96SjZvMDJTSmc3UHA1VHZL?=
 =?utf-8?B?cDNITHhibGpxcE94ZzlVV2JzOFpsUkM3dUNrTjBTQmJsZHB1K0MwOVc0RENU?=
 =?utf-8?B?YkVhaTJkM1ZIN212RzFUMllsVXVVajVJVklEZDhYL2ZUbGJUbTk2aU45a3VS?=
 =?utf-8?B?UTg3V3J5b25wdTM0ZFdLMWRaSnFIc1ZHU24vVXlCZW8wM2tPVXdicDNEQ1pz?=
 =?utf-8?B?WXhydmRISXlaNTlEVHM0eUh4ZDBqWlNoZVpicWJCblJqVkp1MFBtK0lIb2hn?=
 =?utf-8?B?RXBvbHpRWHJNSmI2UUNzK21PMzAyd1Z0VVZ2NExLZE5Zc0Q5TXhTY05Nekly?=
 =?utf-8?B?NmZBbnM0WkdxUE9WeS9UVmhiNlI5bHE2LytYTU1xeW9xL2hINTZKWnQ0NWc2?=
 =?utf-8?B?eVplem52a292d1pHeFo2dlBWbTlUK2I1VlR5UDJ1a09Ib29TcWY2QjZYYUY4?=
 =?utf-8?B?MVRrWWFrM0xyWU4zaGFLZldOWU81SHIyQ2NoOU1qa2dXOTZBQVM0cytTMmNT?=
 =?utf-8?B?d1N5SnVPN0E5RlRQRDlRRmd1czNjdmIyWDc1WGYyV3ZNY0hxTDdXTzJUVUc1?=
 =?utf-8?B?Wjd0MjRqMzRzQnBNTnNYd0JudzdMOUZNampEVjUyME1sTWhzZEtNcnA3TmZX?=
 =?utf-8?B?citVMENSWDlzU2lMSmtzNHhMajBva1dxK1k5S1FISTdJQS9KUmxuNFVuUy9R?=
 =?utf-8?B?QVBJVGcwOXRLK3V6d2tISk9rM25JZzl3Q2tTU0pDU0tQK1hSWmZxNC9udERY?=
 =?utf-8?B?dWVnb291eSt2Wi9pdkIvVWVySjBvUE5vSkwvS2hWa1dqVC9iaGpHeU91QkVJ?=
 =?utf-8?B?b212aTB3SHNKVHZhVnIxUFd3QlFTNkJsUDVHTEVubXFxS0xOVkpBdEdEbXZs?=
 =?utf-8?B?bW9hS21XdThmWjY5cDVrVlArMEZnaEpYWXozeGxpaHh2cHRXcXZvSFdhQnUz?=
 =?utf-8?B?QWlwOTZEL3NSdjZpT1FOQUk3YnR5RTh1NG10SnJvNnJWTDlUSStQcVNIamQy?=
 =?utf-8?B?dmF4dCtLT1FUbXlmdk5GU0VUbm5ERzRkRzVrV1dxNTVtVWhnaUtISFAwQklw?=
 =?utf-8?B?Y1dNK3A2aW5ubDNaMXk5M3RBZUJjVE4zSmxyUHlVWlZrYS90Nkx3T3VnbVlQ?=
 =?utf-8?B?M3FBY1MrMkpMTjdQLzNOdXVVVkhLeUpmUldjWlFxVDRUQmlVRGNDNHEzcWlH?=
 =?utf-8?B?d05XejVtRTI0T3dvckJSeEthM1JVQ0RUNnhMeWp3Z285S0Z4Y29uQXBXZTZU?=
 =?utf-8?B?UlhFSmJseWk5TWhZS1F4SEMvWGtna2ZOaTR4aG9RSnRlVnhVMDJLMUwzUS84?=
 =?utf-8?B?bDd0VTdjMElGbCtZM3doSmpIZnBnSEZHUlpUK2M5ekZ5UHFaNXN6b0xSdXRB?=
 =?utf-8?B?MkpyN3pVVlpzbFlrcGVWZk9aUXRzamQxOTBYaW5UT3J1ZGMrdlNKNW1zRjdE?=
 =?utf-8?B?WTM0Q09ZSnBlY24zNk4rQVpNYmpuenR1MGdXNzBBaDYzVktMOW9HampENjJX?=
 =?utf-8?B?SC8ra1lHR1EvWWEyRDNiZlpTaENTL05KcEVYckhoUFJXQ2FyVWNYYTR0ZEFS?=
 =?utf-8?B?THl3MGpUaU1tZDJUTEluSEFSaENBSmlPbHU0dnRQRzEzUTFYdWRwSGFTZkk4?=
 =?utf-8?Q?GLXsaFR9YeoNbA9WAk0hb60=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB2FB04BF0213A498C041136AAE5C5EC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DSpGhG6wyZPTlvMUGRxlcsL/eeOKZYYx4s58BEwt/dbFKO2tn4RnSUNpZi2K7oXpND7gFoXKVG5YszxzqLJgK5lhW/wBEoLrCQwKuIeD0M5MdzujllKU/bOzOHa5AE/hv9dhVGJg+cd3U1FSEEQKHvOk7QF4UEZ8hycav/DUGU4Tm7cYgqooCMkvbWferwx8kUcUIE+/BUD0AAPCs74XgGL7bWQJtD99OWOZ2ha+FxjYjqvcHTFdimWbHReZ1kaOSAzV1iimgc2W+bnkbmlmidN9NnFqwWOK70dRGS3fRoM6olNeunAoUSBT80P7vhR8U//5gdsLOrQs0SaNIizcVA9qnVpe9icud+qPg3doRN40RprQxELYgut9BHtGU6/xTz/FNjEgJfSV+3WU6oHIHNxStXd0g9eErRwo3BOLgNKpPQ6+3fmsldziwvFT22QvVgsto/NhHhHLfD/kjFle11db6vgNdR1AXxER3J5gMUL+CeTeNzkSlCAcBdfeaUebwli6Za9kDGbpPNc/7mpBBpTKGovBbIAcGdzVnyeFuac7F8HFF96HnVlzGVtr1LeOADbnH5mlZ0NMnlQS6n7b0nPMs4vcjwYpAywaKm5QYHPWupYrgBQZL3rpDPOyi2ztR82MhrhOO5t7Ekh8HZ7dudESiOizyvLfHoajaIicVlRDhGSiOLdD6pAnAcu/giha1gIp6d0d7qXu2Ovr7pCe0QgaQG0KwVKPGtduE4zN0YJl4Mnect1vq9StLj4r14gWRQoCXCljrJUVlO80CSvJK7bDQj5RDPCj1yMLNviZnu/8FLwdPZMEtxP2YyzH/bkm9yrUbrJXXdl2yzfgoWuH6g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48cc90b-8ea9-430d-1156-08dad45b60ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 11:50:15.9204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awwsZNchEGxez7E+m7FiGydIVrvwQjE0vgrNX20T2WiAIjWgY238GyeqRq1r3Vo6vdFuHDw1z7LDV4BOwyShkbgtNEL4kI2UeqyydyQFG9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6040

DQoNCj4gT24gMiBEZWMgMjAyMiwgYXQgMTA6NTUsIEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9r
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gTm90IHRvIGJlIGNvbmZ1c2VkIHdoaWNoIGh2bV9n
ZXRfcGFyYW0sIHdoaWNoIGFsc28gZXhpc3RzIGFuZCBoYXMgYQ0KPiBkaWZmZXJlbnQsIG1vcmUg
ZXJyb3ItcHJvbmUgaW50ZXJmYWNlLg0KPiANCj4gVGhpcyBvbmUgYWx3YXlzIHJldHVybnMgYSA2
NC1iaXQgdmFsdWUsIGFuZCB0aGF0IGlzIHJldGFpbmVkIGluIHRoZQ0KPiBPQ2FtbCBiaW5kaW5n
IGFzIHdlbGwsIHJldHVybmluZyAnaW50NjQnIChhbmQgbm90IGludCwgb3IgbmF0aXZlaW50DQo+
IHdoaWNoIG1pZ2h0IGhhdmUgYSBkaWZmZXJlbnQgc2l6ZSkuDQo+IA0KPiBUaGUgaW50ZWdlciBo
ZXJlIGlzIHVuc2lnbmVkIGluIHRoZSBDIEFQSSwgaG93ZXZlciBPQ2FtbCBvbmx5IGhhcyBzaWdu
ZWQgaW50ZWdlcnMuDQo+IA0KPiBObyBiaXRzIGFyZSBsb3N0LCBpdCBpcyBqdXN0IGEgbWF0dGVy
IG9mIGludGVycHJldGF0aW9uIHdoZW4gcHJpbnRpbmcNCj4gYW5kIGZvciBjZXJ0YWluIGFyaXRo
bWV0aWMgb3BlcmF0aW9ucywgaG93ZXZlciBpbiB0aGUgY2FzZXMgd2hlcmUgdGhlDQo+IE1TQiBp
cyBzZXQgaXQgaXMgdmVyeSBsaWtlbHkgdGhhdCB0aGUgdmFsdWUgaXMgYW4gYWRkcmVzcyBhbmQg
bm8NCj4gYXJpdGhtZXRpYyBzaG91bGQgYmUgcGVyZm9ybWVkIG9uIHRoZSBPQ2FtbCBzaWRlIG9u
IGl0Lg0KPiAodGhpcyBpcyBub3QgYSBuZXcgcHJvYmxlbSB3aXRoIHRoaXMgYmluZGluZywgYnV0
IHdvcnRoIG1lbnRpb25pbmcgZ2l2ZW4NCj4gdGhlIGRpZmZlcmVuY2UgaW4gdHlwZXMpDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0K
DQpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29t
Pg0KDQo=

