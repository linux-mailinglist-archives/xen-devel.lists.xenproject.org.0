Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F12C9DFCCF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846392.1261568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2R8-0000Z5-0V; Mon, 02 Dec 2024 09:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846392.1261568; Mon, 02 Dec 2024 09:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2R7-0000Vw-Ty; Mon, 02 Dec 2024 09:09:45 +0000
Received: by outflank-mailman (input) for mailman id 846392;
 Mon, 02 Dec 2024 09:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZV9f=S3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tI2R6-0000Vq-BL
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:09:44 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 298b7d86-b08d-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 10:09:40 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d0bde80b4bso3386461a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 01:09:40 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5999734ccsm484474466b.204.2024.12.02.01.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 01:09:39 -0800 (PST)
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
X-Inumbo-ID: 298b7d86-b08d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzEiLCJoZWxvIjoibWFpbC1lZDEteDUzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI5OGI3ZDg2LWIwOGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTMwNTgwLjczMTE2NCwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733130580; x=1733735380; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K0LcNt8SeuLBMBvyvO/3O96yWkcgQXYTF/AS5scqEEA=;
        b=g8Z/K3U+s/t2ijVeY8SqKod3n2NrVGPqcG2IF6/yqDCqSq1vdUKV3yau6xxaJjfDCA
         ulsZX9isSOqPl9wmfElAxnhajDf86A5pR/u96DmPh2IKu6JiazsWl6fFmxFoGkRVzrW3
         mdU3xNV9w7+17h3ggQyaDV8um67RU/rsezLrP3ce28AazgwMO3cJ8rwuCD4riRxKtLVe
         Rum1IJ2Y8oJFU2fXHmJVc2+tUEKFlzkcZuePiFizLgOTnrPjIzr0u2xNAfrZCIk8w2Rm
         ns98d+RjmNzasio7HrRatV3vAaUQh+y3cqiOiXanLcA1uaMjqWPmwTHvTGzIPrTfXErc
         DkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130580; x=1733735380;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0LcNt8SeuLBMBvyvO/3O96yWkcgQXYTF/AS5scqEEA=;
        b=f9MYnQVKzZ7aeoPWEVeQMgDo641QyipB8k3dz6gOcvMFWRy5Cb9y61E2abY4GIVUCU
         jre5UNDS6EpVSilYbVWxB5Z5xnRbptP83WmeSZUJiiRoLEntvw/0xlIXdEkedHeqXsWC
         Ygb/37fLB1IlrGKk9x2ypR2uJVG3Yxjms3otXO36xF4lIaAlAVwH6KrU0Gfnku4YYzVr
         P2ZNn0XqJ+r1dU6kFWhEa2Wv9t5EzsUetO738ZuUXrhA37eyZYOos7OcubRqFrwBSxfy
         +RD1sv1B/FCqh4p8YD7qHbHT/APGEvUlzOiof7WewWWzo8Jb0PgF09/xsOMPj1CJI26z
         J8UA==
X-Gm-Message-State: AOJu0YyprD06rPW+RemCM+D40Qsjiyx3jky4SvoTybhlDFy3hecQfj9e
	94qHdaGLmU+jWCleaGHuKur57fNWMntgMEm0c1dAaCLfytJfLTLz78mqRA==
X-Gm-Gg: ASbGncszp58lRkd6Ct3IM5n7al7dPMwXLiF8RS0MeApLOGep+yO3vz08HjV7LHyJxeM
	8L5DlW0IXUyH/YXKLbFnNahgTym2H2h/M/YgjHjfNrU5dD0JkE79n+7Y35qA9LL9/q/jrXr79yS
	tN7O7F1Aw0YsvJjYTbT9JRSYePGZsevkXLa0O3f0+F0NnLEGaw2DrnMHSmLgXtUab5I+3GxHl0w
	gBJt+9Ez4oDDT+B65c7ZJR/yfkW4rlkNR8jkPQHFNHscT45/u60bX2M1bt89+s=
X-Google-Smtp-Source: AGHT+IGHlEUcn8Jzy9vnJx9f03wmAYCNxrRani5Sp1IUD7XRRO77Q+Q3RgvoauMhe7jfXiRBwMzNbg==
X-Received: by 2002:a17:906:b392:b0:a9a:f82:7712 with SMTP id a640c23a62f3a-aa5810664dfmr1849803066b.52.1733130579679;
        Mon, 02 Dec 2024 01:09:39 -0800 (PST)
Message-ID: <e418c02521c4916030ac210fab8d935a50eebe11.camel@gmail.com>
Subject: Feature freeze date for Xen 4.20 is Fri Dec 20, 2024
From: oleksii.kurochko@gmail.com
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>, "committers @
 xenproject . org" <committers@xenproject.org>
Date: Mon, 02 Dec 2024 10:09:38 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

Hello everyone,

The feature freeze date for Xen 4.20 is December 20, 2024.

Patches adding new features must be committed by this date.
Straightforward bug fixes may continue to be accepted by maintainers
beyond this point.

If you would like your features included in this release, please ensure
they are committed by the deadline.

Thank you in advance, and have a great week!

Best regards,
  Oleksii



